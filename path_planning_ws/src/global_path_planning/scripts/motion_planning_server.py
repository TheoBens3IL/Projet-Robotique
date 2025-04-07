#!/usr/bin/env python3

import rospy
from pp_msgs.srv import MotionPlanningPlugin, MotionPlanningPluginResponse
from geometry_msgs.msg import Twist
from gridviz import GridViz
from algorithms.motion_dijkstra import motion_dijkstra

class MotionPlanner:
    def __init__(self):
        rospy.init_node('motion_planning_server')
        self.service = rospy.Service('/move_base/SrvClientPlugin/make_motion_plan', 
                                   MotionPlanningPlugin, 
                                   self.handle_motion_plan)
        self.cmd_vel_pub = rospy.Publisher('/cmd_vel', Twist, queue_size=5)
        rospy.loginfo("Motion Planning Server ready.")

    def handle_motion_plan(self, req):
        ''' 
        Prend un chemin global et retourne un chemin optimisé pour le mouvement.
        '''
        viz = GridViz(req.costmap_ros, req.resolution, req.origin, req.start, req.goal, req.width)
        
        path, _ = motion_dijkstra(
            req.start, req.goal, req.width, req.height, 
            req.costmap_ros, req.resolution, req.origin, viz, None
        )

        resp = MotionPlanningPluginResponse()
        resp.plan = path
        return resp

if __name__ == '__main__':
    MotionPlanner()
    rospy.spin()
