// Auto-generated. Do not edit!

// (in-package pp_msgs.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class MotionPlanningPluginRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.costmap_ros = null;
      this.width = null;
      this.height = null;
      this.start = null;
      this.goal = null;
      this.resolution = null;
      this.origin = null;
    }
    else {
      if (initObj.hasOwnProperty('costmap_ros')) {
        this.costmap_ros = initObj.costmap_ros
      }
      else {
        this.costmap_ros = [];
      }
      if (initObj.hasOwnProperty('width')) {
        this.width = initObj.width
      }
      else {
        this.width = 0;
      }
      if (initObj.hasOwnProperty('height')) {
        this.height = initObj.height
      }
      else {
        this.height = 0;
      }
      if (initObj.hasOwnProperty('start')) {
        this.start = initObj.start
      }
      else {
        this.start = 0;
      }
      if (initObj.hasOwnProperty('goal')) {
        this.goal = initObj.goal
      }
      else {
        this.goal = 0;
      }
      if (initObj.hasOwnProperty('resolution')) {
        this.resolution = initObj.resolution
      }
      else {
        this.resolution = 0.0;
      }
      if (initObj.hasOwnProperty('origin')) {
        this.origin = initObj.origin
      }
      else {
        this.origin = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotionPlanningPluginRequest
    // Serialize message field [costmap_ros]
    bufferOffset = _arraySerializer.int32(obj.costmap_ros, buffer, bufferOffset, null);
    // Serialize message field [width]
    bufferOffset = _serializer.int32(obj.width, buffer, bufferOffset);
    // Serialize message field [height]
    bufferOffset = _serializer.int32(obj.height, buffer, bufferOffset);
    // Serialize message field [start]
    bufferOffset = _serializer.int32(obj.start, buffer, bufferOffset);
    // Serialize message field [goal]
    bufferOffset = _serializer.int32(obj.goal, buffer, bufferOffset);
    // Serialize message field [resolution]
    bufferOffset = _serializer.float32(obj.resolution, buffer, bufferOffset);
    // Serialize message field [origin]
    bufferOffset = _arraySerializer.float32(obj.origin, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotionPlanningPluginRequest
    let len;
    let data = new MotionPlanningPluginRequest(null);
    // Deserialize message field [costmap_ros]
    data.costmap_ros = _arrayDeserializer.int32(buffer, bufferOffset, null)
    // Deserialize message field [width]
    data.width = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [height]
    data.height = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [start]
    data.start = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [goal]
    data.goal = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [resolution]
    data.resolution = _deserializer.float32(buffer, bufferOffset);
    // Deserialize message field [origin]
    data.origin = _arrayDeserializer.float32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.costmap_ros.length;
    length += 4 * object.origin.length;
    return length + 28;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pp_msgs/MotionPlanningPluginRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '710f6e11c9e7009223854e94fce6ad46';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    # MotionPlanningPlugin.srv
    int32[] costmap_ros
    int32 width
    int32 height
    int32 start
    int32 goal
    float32 resolution
    float32[] origin  # [x,y,z]
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotionPlanningPluginRequest(null);
    if (msg.costmap_ros !== undefined) {
      resolved.costmap_ros = msg.costmap_ros;
    }
    else {
      resolved.costmap_ros = []
    }

    if (msg.width !== undefined) {
      resolved.width = msg.width;
    }
    else {
      resolved.width = 0
    }

    if (msg.height !== undefined) {
      resolved.height = msg.height;
    }
    else {
      resolved.height = 0
    }

    if (msg.start !== undefined) {
      resolved.start = msg.start;
    }
    else {
      resolved.start = 0
    }

    if (msg.goal !== undefined) {
      resolved.goal = msg.goal;
    }
    else {
      resolved.goal = 0
    }

    if (msg.resolution !== undefined) {
      resolved.resolution = msg.resolution;
    }
    else {
      resolved.resolution = 0.0
    }

    if (msg.origin !== undefined) {
      resolved.origin = msg.origin;
    }
    else {
      resolved.origin = []
    }

    return resolved;
    }
};

class MotionPlanningPluginResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.plan = null;
    }
    else {
      if (initObj.hasOwnProperty('plan')) {
        this.plan = initObj.plan
      }
      else {
        this.plan = [];
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type MotionPlanningPluginResponse
    // Serialize message field [plan]
    bufferOffset = _arraySerializer.int32(obj.plan, buffer, bufferOffset, null);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type MotionPlanningPluginResponse
    let len;
    let data = new MotionPlanningPluginResponse(null);
    // Deserialize message field [plan]
    data.plan = _arrayDeserializer.int32(buffer, bufferOffset, null)
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += 4 * object.plan.length;
    return length + 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'pp_msgs/MotionPlanningPluginResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'd00db495743883c1d9a4cf3d0844ceac';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32[] plan
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new MotionPlanningPluginResponse(null);
    if (msg.plan !== undefined) {
      resolved.plan = msg.plan;
    }
    else {
      resolved.plan = []
    }

    return resolved;
    }
};

module.exports = {
  Request: MotionPlanningPluginRequest,
  Response: MotionPlanningPluginResponse,
  md5sum() { return '1fb7f778734b213306e1e32481d2f6bf'; },
  datatype() { return 'pp_msgs/MotionPlanningPlugin'; }
};
