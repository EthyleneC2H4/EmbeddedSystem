#include "ros/ros.h"
#include "turtlesim/Pose.h"
#include "geometry_msgs/Twist.h"
#include <cstdlib>
#include <ctime>
#include <tf2/LinearMath/Quaternion.h>

turtlesim::Pose turtle1_pose;
turtlesim::Pose turtle2_pose;

ros::Publisher vel_pub1;
ros::Publisher vel_pub2;

void turtle1PoseCallback(const turtlesim::Pose::ConstPtr& pose_msg)
{
    turtle1_pose = *pose_msg;
}

void turtle2PoseCallback(const turtlesim::Pose::ConstPtr& pose_msg)
{
    turtle2_pose = *pose_msg;
}


int main(int argc, char *argv[])
{
    ros::init(argc, argv, "two_turtles");
    ros::NodeHandle n;

    vel_pub1 = n.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
    vel_pub2 = n.advertise<geometry_msgs::Twist>("/turtle2/cmd_vel", 10);

    ros::Subscriber pose_sub1 = n.subscribe("/turtle1/pose", 10, turtle1PoseCallback);
    ros::Subscriber pose_sub2 = n.subscribe("/turtle2/pose", 10, turtle2PoseCallback);

    ROS_INFO("Two turtles start...");

    // 随机数生成器的初始化
    std::srand(std::time(0));

    ros::Rate loop_rate(2); // 控制速率

    while (ros::ok())
    {
        geometry_msgs::Twist vel_cmd1;
        geometry_msgs::Twist vel_cmd2;

        vel_cmd1.linear.x = 3.0 * double(std::rand()) / RAND_MAX - 3.0; // 随机线速度 (-1 到 1 m/s)
        vel_cmd1.angular.z = 6.0 * double(std::rand()) / RAND_MAX - 2.0; // 随机角速度 (-2.0 到 2.0 rad/s)

        vel_cmd2.linear.x = vel_cmd1.linear.x; // 第二只乌龟与第一只乌龟运动方式一致
        vel_cmd2.angular.z = vel_cmd1.angular.z; // 第二只乌龟与第一只乌龟运动方式一致

        vel_pub1.publish(vel_cmd1);
        vel_pub2.publish(vel_cmd2);

        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}

