; Auto-generated. Do not edit!


(cl:in-package pp_msgs-srv)


;//! \htmlinclude MotionPlanningPlugin-request.msg.html

(cl:defclass <MotionPlanningPlugin-request> (roslisp-msg-protocol:ros-message)
  ((costmap_ros
    :reader costmap_ros
    :initarg :costmap_ros
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0))
   (width
    :reader width
    :initarg :width
    :type cl:integer
    :initform 0)
   (height
    :reader height
    :initarg :height
    :type cl:integer
    :initform 0)
   (start
    :reader start
    :initarg :start
    :type cl:integer
    :initform 0)
   (goal
    :reader goal
    :initarg :goal
    :type cl:integer
    :initform 0)
   (resolution
    :reader resolution
    :initarg :resolution
    :type cl:float
    :initform 0.0)
   (origin
    :reader origin
    :initarg :origin
    :type (cl:vector cl:float)
   :initform (cl:make-array 0 :element-type 'cl:float :initial-element 0.0)))
)

(cl:defclass MotionPlanningPlugin-request (<MotionPlanningPlugin-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionPlanningPlugin-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionPlanningPlugin-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pp_msgs-srv:<MotionPlanningPlugin-request> is deprecated: use pp_msgs-srv:MotionPlanningPlugin-request instead.")))

(cl:ensure-generic-function 'costmap_ros-val :lambda-list '(m))
(cl:defmethod costmap_ros-val ((m <MotionPlanningPlugin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:costmap_ros-val is deprecated.  Use pp_msgs-srv:costmap_ros instead.")
  (costmap_ros m))

(cl:ensure-generic-function 'width-val :lambda-list '(m))
(cl:defmethod width-val ((m <MotionPlanningPlugin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:width-val is deprecated.  Use pp_msgs-srv:width instead.")
  (width m))

(cl:ensure-generic-function 'height-val :lambda-list '(m))
(cl:defmethod height-val ((m <MotionPlanningPlugin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:height-val is deprecated.  Use pp_msgs-srv:height instead.")
  (height m))

(cl:ensure-generic-function 'start-val :lambda-list '(m))
(cl:defmethod start-val ((m <MotionPlanningPlugin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:start-val is deprecated.  Use pp_msgs-srv:start instead.")
  (start m))

(cl:ensure-generic-function 'goal-val :lambda-list '(m))
(cl:defmethod goal-val ((m <MotionPlanningPlugin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:goal-val is deprecated.  Use pp_msgs-srv:goal instead.")
  (goal m))

(cl:ensure-generic-function 'resolution-val :lambda-list '(m))
(cl:defmethod resolution-val ((m <MotionPlanningPlugin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:resolution-val is deprecated.  Use pp_msgs-srv:resolution instead.")
  (resolution m))

(cl:ensure-generic-function 'origin-val :lambda-list '(m))
(cl:defmethod origin-val ((m <MotionPlanningPlugin-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:origin-val is deprecated.  Use pp_msgs-srv:origin instead.")
  (origin m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionPlanningPlugin-request>) ostream)
  "Serializes a message object of type '<MotionPlanningPlugin-request>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'costmap_ros))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'costmap_ros))
  (cl:let* ((signed (cl:slot-value msg 'width)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'height)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'start)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'goal)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'resolution))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'origin))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((bits (roslisp-utils:encode-single-float-bits ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)))
   (cl:slot-value msg 'origin))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionPlanningPlugin-request>) istream)
  "Deserializes a message object of type '<MotionPlanningPlugin-request>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'costmap_ros) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'costmap_ros)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'width) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'height) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'start) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'goal) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'resolution) (roslisp-utils:decode-single-float-bits bits)))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'origin) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'origin)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:aref vals i) (roslisp-utils:decode-single-float-bits bits))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionPlanningPlugin-request>)))
  "Returns string type for a service object of type '<MotionPlanningPlugin-request>"
  "pp_msgs/MotionPlanningPluginRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionPlanningPlugin-request)))
  "Returns string type for a service object of type 'MotionPlanningPlugin-request"
  "pp_msgs/MotionPlanningPluginRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionPlanningPlugin-request>)))
  "Returns md5sum for a message object of type '<MotionPlanningPlugin-request>"
  "1fb7f778734b213306e1e32481d2f6bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionPlanningPlugin-request)))
  "Returns md5sum for a message object of type 'MotionPlanningPlugin-request"
  "1fb7f778734b213306e1e32481d2f6bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionPlanningPlugin-request>)))
  "Returns full string definition for message of type '<MotionPlanningPlugin-request>"
  (cl:format cl:nil "# MotionPlanningPlugin.srv~%int32[] costmap_ros~%int32 width~%int32 height~%int32 start~%int32 goal~%float32 resolution~%float32[] origin  # [x,y,z]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionPlanningPlugin-request)))
  "Returns full string definition for message of type 'MotionPlanningPlugin-request"
  (cl:format cl:nil "# MotionPlanningPlugin.srv~%int32[] costmap_ros~%int32 width~%int32 height~%int32 start~%int32 goal~%float32 resolution~%float32[] origin  # [x,y,z]~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionPlanningPlugin-request>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'costmap_ros) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
     4
     4
     4
     4
     4
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'origin) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionPlanningPlugin-request>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionPlanningPlugin-request
    (cl:cons ':costmap_ros (costmap_ros msg))
    (cl:cons ':width (width msg))
    (cl:cons ':height (height msg))
    (cl:cons ':start (start msg))
    (cl:cons ':goal (goal msg))
    (cl:cons ':resolution (resolution msg))
    (cl:cons ':origin (origin msg))
))
;//! \htmlinclude MotionPlanningPlugin-response.msg.html

(cl:defclass <MotionPlanningPlugin-response> (roslisp-msg-protocol:ros-message)
  ((plan
    :reader plan
    :initarg :plan
    :type (cl:vector cl:integer)
   :initform (cl:make-array 0 :element-type 'cl:integer :initial-element 0)))
)

(cl:defclass MotionPlanningPlugin-response (<MotionPlanningPlugin-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <MotionPlanningPlugin-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'MotionPlanningPlugin-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name pp_msgs-srv:<MotionPlanningPlugin-response> is deprecated: use pp_msgs-srv:MotionPlanningPlugin-response instead.")))

(cl:ensure-generic-function 'plan-val :lambda-list '(m))
(cl:defmethod plan-val ((m <MotionPlanningPlugin-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader pp_msgs-srv:plan-val is deprecated.  Use pp_msgs-srv:plan instead.")
  (plan m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <MotionPlanningPlugin-response>) ostream)
  "Serializes a message object of type '<MotionPlanningPlugin-response>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'plan))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let* ((signed ele) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    ))
   (cl:slot-value msg 'plan))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <MotionPlanningPlugin-response>) istream)
  "Deserializes a message object of type '<MotionPlanningPlugin-response>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'plan) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'plan)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<MotionPlanningPlugin-response>)))
  "Returns string type for a service object of type '<MotionPlanningPlugin-response>"
  "pp_msgs/MotionPlanningPluginResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionPlanningPlugin-response)))
  "Returns string type for a service object of type 'MotionPlanningPlugin-response"
  "pp_msgs/MotionPlanningPluginResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<MotionPlanningPlugin-response>)))
  "Returns md5sum for a message object of type '<MotionPlanningPlugin-response>"
  "1fb7f778734b213306e1e32481d2f6bf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'MotionPlanningPlugin-response)))
  "Returns md5sum for a message object of type 'MotionPlanningPlugin-response"
  "1fb7f778734b213306e1e32481d2f6bf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<MotionPlanningPlugin-response>)))
  "Returns full string definition for message of type '<MotionPlanningPlugin-response>"
  (cl:format cl:nil "int32[] plan~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'MotionPlanningPlugin-response)))
  "Returns full string definition for message of type 'MotionPlanningPlugin-response"
  (cl:format cl:nil "int32[] plan~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <MotionPlanningPlugin-response>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'plan) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <MotionPlanningPlugin-response>))
  "Converts a ROS message object to a list"
  (cl:list 'MotionPlanningPlugin-response
    (cl:cons ':plan (plan msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'MotionPlanningPlugin)))
  'MotionPlanningPlugin-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'MotionPlanningPlugin)))
  'MotionPlanningPlugin-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'MotionPlanningPlugin)))
  "Returns string type for a service object of type '<MotionPlanningPlugin>"
  "pp_msgs/MotionPlanningPlugin")