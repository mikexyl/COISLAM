// Auto-generated. Do not edit!

// (in-package corbslam_server.srv)


"use strict";

const _serializer = _ros_msg_utils.Serialize;
const _arraySerializer = _serializer.Array;
const _deserializer = _ros_msg_utils.Deserialize;
const _arrayDeserializer = _deserializer.Array;
const _finder = _ros_msg_utils.Find;
const _getByteLength = _ros_msg_utils.getByteLength;

//-----------------------------------------------------------


//-----------------------------------------------------------

class corbslam_insertRequest {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.CID = null;
      this.TYPE = null;
      this.COUNT = null;
      this.DATA = null;
    }
    else {
      if (initObj.hasOwnProperty('CID')) {
        this.CID = initObj.CID
      }
      else {
        this.CID = 0;
      }
      if (initObj.hasOwnProperty('TYPE')) {
        this.TYPE = initObj.TYPE
      }
      else {
        this.TYPE = 0;
      }
      if (initObj.hasOwnProperty('COUNT')) {
        this.COUNT = initObj.COUNT
      }
      else {
        this.COUNT = 0;
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
    // Serializes a message object of type corbslam_insertRequest
    // Serialize message field [CID]
    bufferOffset = _serializer.int32(obj.CID, buffer, bufferOffset);
    // Serialize message field [TYPE]
    bufferOffset = _serializer.int32(obj.TYPE, buffer, bufferOffset);
    // Serialize message field [COUNT]
    bufferOffset = _serializer.int32(obj.COUNT, buffer, bufferOffset);
    // Serialize message field [DATA]
    bufferOffset = _serializer.string(obj.DATA, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type corbslam_insertRequest
    let len;
    let data = new corbslam_insertRequest(null);
    // Deserialize message field [CID]
    data.CID = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [TYPE]
    data.TYPE = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [COUNT]
    data.COUNT = _deserializer.int32(buffer, bufferOffset);
    // Deserialize message field [DATA]
    data.DATA = _deserializer.string(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    let length = 0;
    length += object.DATA.length;
    return length + 16;
  }

  static datatype() {
    // Returns string type for a service object
    return 'corbslam_server/corbslam_insertRequest';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'ff2d73c5ba59321e3e9eb4ca71fd3b55';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 CID
    int32 TYPE
    int32 COUNT
    string DATA
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new corbslam_insertRequest(null);
    if (msg.CID !== undefined) {
      resolved.CID = msg.CID;
    }
    else {
      resolved.CID = 0
    }

    if (msg.TYPE !== undefined) {
      resolved.TYPE = msg.TYPE;
    }
    else {
      resolved.TYPE = 0
    }

    if (msg.COUNT !== undefined) {
      resolved.COUNT = msg.COUNT;
    }
    else {
      resolved.COUNT = 0
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

class corbslam_insertResponse {
  constructor(initObj={}) {
    if (initObj === null) {
      // initObj === null is a special case for deserialization where we don't initialize fields
      this.ACK = null;
    }
    else {
      if (initObj.hasOwnProperty('ACK')) {
        this.ACK = initObj.ACK
      }
      else {
        this.ACK = 0;
      }
    }
  }

  static serialize(obj, buffer, bufferOffset) {
    // Serializes a message object of type corbslam_insertResponse
    // Serialize message field [ACK]
    bufferOffset = _serializer.int32(obj.ACK, buffer, bufferOffset);
    return bufferOffset;
  }

  static deserialize(buffer, bufferOffset=[0]) {
    //deserializes a message object of type corbslam_insertResponse
    let len;
    let data = new corbslam_insertResponse(null);
    // Deserialize message field [ACK]
    data.ACK = _deserializer.int32(buffer, bufferOffset);
    return data;
  }

  static getMessageSize(object) {
    return 4;
  }

  static datatype() {
    // Returns string type for a service object
    return 'corbslam_server/corbslam_insertResponse';
  }

  static md5sum() {
    //Returns md5sum for a message object
    return 'a7cd8a5f161a50dd5df85bf42834b25e';
  }

  static messageDefinition() {
    // Returns full string definition for message
    return `
    int32 ACK
    
    
    `;
  }

  static Resolve(msg) {
    // deep-construct a valid message object instance of whatever was passed in
    if (typeof msg !== 'object' || msg === null) {
      msg = {};
    }
    const resolved = new corbslam_insertResponse(null);
    if (msg.ACK !== undefined) {
      resolved.ACK = msg.ACK;
    }
    else {
      resolved.ACK = 0
    }

    return resolved;
    }
};

module.exports = {
  Request: corbslam_insertRequest,
  Response: corbslam_insertResponse,
  md5sum() { return '1aabe292bb21d2f96bb243920fb547e5'; },
  datatype() { return 'corbslam_server/corbslam_insert'; }
};
