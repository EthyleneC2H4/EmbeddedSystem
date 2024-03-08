#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>
#include <std_msgs/Bool.h>
#include <ackermann_msgs/AckermannDriveStamped.h>

class Safety {
private:
  ros::NodeHandle n;
  ros::Subscriber odom_sub;
  ros::Subscriber scan_sub;
  ros::Publisher brake_pub;
  ros::Publisher brake_bool_pub;
  double speed;

public:
  Safety() {
    n = ros::NodeHandle();
    speed = 0.0;

    odom_sub = n.subscribe("/odom", 1, &Safety::odom_callback, this);
    scan_sub = n.subscribe("/scan", 1, &Safety::scan_callback, this);

    brake_pub = n.advertise<ackermann_msgs::AckermannDriveStamped>("/brake", 1);
    brake_bool_pub = n.advertise<std_msgs::Bool>("/brake_bool", 1);
  }

  void odom_callback(const nav_msgs::Odometry::ConstPtr& odom_msg) {
    // Update current speed
    speed = odom_msg->twist.twist.linear.x;
  }

  void scan_callback(const sensor_msgs::LaserScan::ConstPtr& scan_msg) {
    // Calculate TTC (Time to Collision)
    double ttc = scan_msg->ranges[0] / speed; // Assuming the obstacle is at the first range index

    if (ttc < 1.0) {
      // Publish brake message
      ackermann_msgs::AckermannDriveStamped brake_msg;
      brake_msg.drive.speed = 0.0;
      brake_pub.publish(brake_msg);

      // Publish brake bool message
      std_msgs::Bool brake_bool_msg;
      brake_bool_msg.data = true;
      brake_bool_pub.publish(brake_bool_msg);
    } else {
      // Publish brake bool message as false
      std_msgs::Bool brake_bool_msg;
      brake_bool_msg.data = false;
      brake_bool_pub.publish(brake_bool_msg);
    }
  }
};

int main(int argc, char** argv) {
  ros::init(argc, argv, "safety_node");
  Safety sn;
  ros::spin();
  return 0;
}