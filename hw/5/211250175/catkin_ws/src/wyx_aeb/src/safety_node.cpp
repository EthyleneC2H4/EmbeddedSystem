#include <ros/ros.h>
#include <nav_msgs/Odometry.h>
#include <sensor_msgs/LaserScan.h>
#include <std_msgs/Bool.h>
#include <ackermann_msgs/AckermannDriveStamped.h>

class Safety {
private:
    ros::NodeHandle n;
    double speed;
    ros::Subscriber odom_sub;
    ros::Subscriber scan_sub;
    ros::Publisher brake_pub;
    ros::Publisher brake_bool_pub;

public:
    Safety() {
        n = ros::NodeHandle();
        speed = 0.0;

        // Create ROS subscribers and publishers
        odom_sub = n.subscribe("/odom", 10, &Safety::odom_callback, this);
        scan_sub = n.subscribe("/scan", 10, &Safety::scan_callback, this);
        brake_pub = n.advertise<ackermann_msgs::AckermannDriveStamped>("/brake", 10);
        brake_bool_pub = n.advertise<std_msgs::Bool>("/brake_bool", 10);
    }

    void odom_callback(const nav_msgs::Odometry::ConstPtr& odom_msg) {
        // Update current speed
        speed = odom_msg->twist.twist.linear.x;
    }

    void scan_callback(const sensor_msgs::LaserScan::ConstPtr& scan_msg) {
        // Calculate Time-to-Collision (TTC) - a simple example using the closest point
        //double closest_distance = *min_element(scan_msg->ranges.begin(), scan_msg->ranges.end());
	//ROS_INFO("Closest Distance: %f", closest_distance);

        //double ttc = (closest_distance-0.2) / speed;
	auto min_range_it = std::min_element(scan_msg->ranges.begin(), scan_msg->ranges.end());
    	size_t min_range_index = std::distance(scan_msg->ranges.begin(), min_range_it);

    	// Calculate the angle corresponding to the minimum range
    	double angle = scan_msg->angle_min + min_range_index * scan_msg->angle_increment;

 	// Calculate Time-to-Collision (TTC) considering relative motion direction and angle
 	double closest_distance = *min_range_it;
 	ROS_INFO("Closest Distance: %f, Angle: %f, abs cos value: %f", closest_distance,angle,std::abs(cos(angle)));

 	// Calculate relative speed based on the sign of the velocity
 	double relative_speed = (speed >= 0) ? speed : -speed;
	
 	// Calculate TTC with adjusted formula
	// 0.25:the distance between jiguang and the body of the car
 	double ttc = (closest_distance) / (relative_speed * std::abs(cos(angle)));
	ROS_INFO("relative_speed: %f, ttc : %f",relative_speed,ttc);

        // Publish drive/brake message based on TTC
        if (ttc < 0.6) {
            // If TTC is less than 1 second, apply emergency brake
            publishEmergencyBrake();
        } else {
            // If TTC is greater than or equal to 1 second, no emergency action needed
            publishNoEmergency();
        }
    }

    void publishEmergencyBrake() {
        // Publish brake message
        ackermann_msgs::AckermannDriveStamped brake_msg;
        brake_msg.header.stamp = ros::Time::now();
        brake_msg.drive.speed = 0.0;
        brake_pub.publish(brake_msg);

        // Publish Bool message to indicate emergency brake
        std_msgs::Bool brake_bool_msg;
        brake_bool_msg.data = true;
        brake_bool_pub.publish(brake_bool_msg);
    }

    void publishNoEmergency() {
        // Publish Bool message to indicate no emergency
        std_msgs::Bool brake_bool_msg;
        brake_bool_msg.data = false;
        brake_bool_pub.publish(brake_bool_msg);
    }
};

int main(int argc, char** argv) {
    ros::init(argc, argv, "safety_node");
    Safety sn;
    ros::spin();
    return 0;
}

