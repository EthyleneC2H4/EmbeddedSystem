#include "ros/ros.h"
#include <geometry_msgs/Twist.h>
#include <turtlesim/Spawn.h>
#include <turtlesim/Pose.h>
#include <stdlib.h>

turtlesim::Pose turtle1_pose;

void turtle1PoseCallback(const turtlesim::Pose::ConstPtr &msg)
{
    turtle1_pose = *msg;
}

double getRandomNumber(double min, double max)
{
    return min + (max - min) * (double)rand() / RAND_MAX;
}

int main(int argc, char *argv[])
{
    ros::init(argc, argv, "draw_circle");
    ros::NodeHandle nh;

    // 创建第一只乌龟
    ros::service::waitForService("/spawn");
    ros::ServiceClient spawnClient = nh.serviceClient<turtlesim::Spawn>("/spawn");
    turtlesim::Spawn::Request req;
    turtlesim::Spawn::Response resp;
    req.x = 1.0;
    req.y = 1.0;
    req.theta = 0.0;
    req.name = "turtle1";
    spawnClient.call(req, resp);

    // 创建第二只乌龟
    req.x = 5.0;
    req.y = 5.0;
    req.theta = 0.0;
    req.name = "turtle2";
    spawnClient.call(req, resp);

    ros::Publisher turtle1_vel_pub = nh.advertise<geometry_msgs::Twist>("/turtle1/cmd_vel", 10);
    ros::Publisher turtle2_vel_pub = nh.advertise<geometry_msgs::Twist>("/turtle2/cmd_vel", 10);
    ros::Subscriber turtle1_pose_sub = nh.subscribe("/turtle1/pose", 10, turtle1PoseCallback);

    ros::Rate loop_rate(10);

    while (ros::ok())
    {
        // 随机运动的小乌龟
        geometry_msgs::Twist turtle1_cmd;
        turtle1_cmd.linear.x = getRandomNumber(-2.0, 2.0);
        turtle1_cmd.angular.z = getRandomNumber(-1.8, 1.8);
        turtle1_vel_pub.publish(turtle1_cmd);

        // 跟随运动的小乌龟
        geometry_msgs::Twist turtle2_cmd;
        turtle2_cmd.linear.x = turtle1_cmd.linear.x;
        turtle2_cmd.linear.y = turtle1_cmd.linear.y;
        turtle2_cmd.angular.z = turtle1_cmd.angular.z;
        turtle2_vel_pub.publish(turtle2_cmd);

        ros::spinOnce();
        loop_rate.sleep();
    }

    return 0;
}