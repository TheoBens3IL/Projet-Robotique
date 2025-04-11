;; Auto-generated. Do not edit!


(when (boundp 'pp_msgs::MotionPlanningPlugin)
  (if (not (find-package "PP_MSGS"))
    (make-package "PP_MSGS"))
  (shadow 'MotionPlanningPlugin (find-package "PP_MSGS")))
(unless (find-package "PP_MSGS::MOTIONPLANNINGPLUGIN")
  (make-package "PP_MSGS::MOTIONPLANNINGPLUGIN"))
(unless (find-package "PP_MSGS::MOTIONPLANNINGPLUGINREQUEST")
  (make-package "PP_MSGS::MOTIONPLANNINGPLUGINREQUEST"))
(unless (find-package "PP_MSGS::MOTIONPLANNINGPLUGINRESPONSE")
  (make-package "PP_MSGS::MOTIONPLANNINGPLUGINRESPONSE"))

(in-package "ROS")





(defclass pp_msgs::MotionPlanningPluginRequest
  :super ros::object
  :slots (_costmap_ros _width _height _start _goal _resolution _origin ))

(defmethod pp_msgs::MotionPlanningPluginRequest
  (:init
   (&key
    ((:costmap_ros __costmap_ros) (make-array 0 :initial-element 0 :element-type :integer))
    ((:width __width) 0)
    ((:height __height) 0)
    ((:start __start) 0)
    ((:goal __goal) 0)
    ((:resolution __resolution) 0.0)
    ((:origin __origin) (make-array 0 :initial-element 0.0 :element-type :float))
    )
   (send-super :init)
   (setq _costmap_ros __costmap_ros)
   (setq _width (round __width))
   (setq _height (round __height))
   (setq _start (round __start))
   (setq _goal (round __goal))
   (setq _resolution (float __resolution))
   (setq _origin __origin)
   self)
  (:costmap_ros
   (&optional __costmap_ros)
   (if __costmap_ros (setq _costmap_ros __costmap_ros)) _costmap_ros)
  (:width
   (&optional __width)
   (if __width (setq _width __width)) _width)
  (:height
   (&optional __height)
   (if __height (setq _height __height)) _height)
  (:start
   (&optional __start)
   (if __start (setq _start __start)) _start)
  (:goal
   (&optional __goal)
   (if __goal (setq _goal __goal)) _goal)
  (:resolution
   (&optional __resolution)
   (if __resolution (setq _resolution __resolution)) _resolution)
  (:origin
   (&optional __origin)
   (if __origin (setq _origin __origin)) _origin)
  (:serialization-length
   ()
   (+
    ;; int32[] _costmap_ros
    (* 4    (length _costmap_ros)) 4
    ;; int32 _width
    4
    ;; int32 _height
    4
    ;; int32 _start
    4
    ;; int32 _goal
    4
    ;; float32 _resolution
    4
    ;; float32[] _origin
    (* 4    (length _origin)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _costmap_ros
     (write-long (length _costmap_ros) s)
     (dotimes (i (length _costmap_ros))
       (write-long (elt _costmap_ros i) s)
       )
     ;; int32 _width
       (write-long _width s)
     ;; int32 _height
       (write-long _height s)
     ;; int32 _start
       (write-long _start s)
     ;; int32 _goal
       (write-long _goal s)
     ;; float32 _resolution
       (sys::poke _resolution (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;; float32[] _origin
     (write-long (length _origin) s)
     (dotimes (i (length _origin))
       (sys::poke (elt _origin i) (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _costmap_ros
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _costmap_ros (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _costmap_ros i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;; int32 _width
     (setq _width (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _height
     (setq _height (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _start
     (setq _start (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _goal
     (setq _goal (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; float32 _resolution
     (setq _resolution (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;; float32[] _origin
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _origin (instantiate float-vector n))
     (dotimes (i n)
     (setf (elt _origin i) (sys::peek buf ptr- :float)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass pp_msgs::MotionPlanningPluginResponse
  :super ros::object
  :slots (_plan ))

(defmethod pp_msgs::MotionPlanningPluginResponse
  (:init
   (&key
    ((:plan __plan) (make-array 0 :initial-element 0 :element-type :integer))
    )
   (send-super :init)
   (setq _plan __plan)
   self)
  (:plan
   (&optional __plan)
   (if __plan (setq _plan __plan)) _plan)
  (:serialization-length
   ()
   (+
    ;; int32[] _plan
    (* 4    (length _plan)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32[] _plan
     (write-long (length _plan) s)
     (dotimes (i (length _plan))
       (write-long (elt _plan i) s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32[] _plan
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _plan (instantiate integer-vector n))
     (dotimes (i n)
     (setf (elt _plan i) (sys::peek buf ptr- :integer)) (incf ptr- 4)
     ))
   ;;
   self)
  )

(defclass pp_msgs::MotionPlanningPlugin
  :super ros::object
  :slots ())

(setf (get pp_msgs::MotionPlanningPlugin :md5sum-) "1fb7f778734b213306e1e32481d2f6bf")
(setf (get pp_msgs::MotionPlanningPlugin :datatype-) "pp_msgs/MotionPlanningPlugin")
(setf (get pp_msgs::MotionPlanningPlugin :request) pp_msgs::MotionPlanningPluginRequest)
(setf (get pp_msgs::MotionPlanningPlugin :response) pp_msgs::MotionPlanningPluginResponse)

(defmethod pp_msgs::MotionPlanningPluginRequest
  (:response () (instance pp_msgs::MotionPlanningPluginResponse :init)))

(setf (get pp_msgs::MotionPlanningPluginRequest :md5sum-) "1fb7f778734b213306e1e32481d2f6bf")
(setf (get pp_msgs::MotionPlanningPluginRequest :datatype-) "pp_msgs/MotionPlanningPluginRequest")
(setf (get pp_msgs::MotionPlanningPluginRequest :definition-)
      "# MotionPlanningPlugin.srv
int32[] costmap_ros
int32 width
int32 height
int32 start
int32 goal
float32 resolution
float32[] origin  # [x,y,z]
---
int32[] plan
")

(setf (get pp_msgs::MotionPlanningPluginResponse :md5sum-) "1fb7f778734b213306e1e32481d2f6bf")
(setf (get pp_msgs::MotionPlanningPluginResponse :datatype-) "pp_msgs/MotionPlanningPluginResponse")
(setf (get pp_msgs::MotionPlanningPluginResponse :definition-)
      "# MotionPlanningPlugin.srv
int32[] costmap_ros
int32 width
int32 height
int32 start
int32 goal
float32 resolution
float32[] origin  # [x,y,z]
---
int32[] plan
")



(provide :pp_msgs/MotionPlanningPlugin "1fb7f778734b213306e1e32481d2f6bf")


