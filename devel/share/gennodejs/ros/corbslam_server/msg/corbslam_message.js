// Auto-generated. Do not edit!

// (in-package corbslam_server.msg)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------

class corbslam_message {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.TRANSM = null;
      this.DATA = null;
    }
    else {
      if (initObj.hasOwnProperty('TRANSM')) {
        this.TRANSM = initObj.TRANSM
      }
      else {
        this.TRANSM = '';
      }
      if (initObj.hasOwnProperty('DATA')) {
        this.DATA = initObj.DATA
      }
      else {
        this.DATA = '';
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type corbslam_message
    // Serialize message field [TRANSM]
    bufferOffset = _serializer.string(obj.TRANSM, buffer, bufferOffset);
    // Serialize message field [DATA]
    bufferOffset = _serializer.string(obj.DATA, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type corbslam_message
    let len;
    let data = new corbslam_message(null);
    // Deserialize message field [TRANSM]
    data.TRANSM = _deserializer.string(buffer, bufferOffset);
    // Deserialize message field [DATA]
    data.DATA = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.TRANSM.length;
    length += object.DATA.length;
    return length + 8;
  }

  static datatype() {
    // Returns string type for a message object
    return 'corbslam_server/corbslam_message';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return '5356b099d5ff117b1b1e0b26458d0016';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    string TRANSM
    string DATA
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new corbslam_message(null);
    if (msg.TRANSM !== undefined) {
      resolved.TRANSM = msg.TRANSM;
    }
    else {
      resolved.TRANSM = ''
    }

    if (msg.DATA !== undefined) {
      resolved.DATA = msg.DATA;
    }
    else {
      resolved.DATA = ''
    }

    return resolved;
    }
};

module.exports = corbslam_message;
