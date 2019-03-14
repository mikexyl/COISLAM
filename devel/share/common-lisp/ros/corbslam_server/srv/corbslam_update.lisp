; Auto-generated. Do not edit!


(cl:in-package corbslam_server-srv)


;//! \htmlinclude corbslam_update-request.msg.html

(cl:defclass <corbslam_update-request> (roslisp-msg-protocol:ros-message)
  ((CID
    :reader CID
    :initarg :CID
    :type cl:integer
    :initform 0)
   (TYPE
    :reader TYPE
    :initarg :TYPE
    :type cl:integer
    :initform 0)
   (COUNT
    :reader COUNT
    :initarg :COUNT
    :type cl:integer
    :initform 0)
   (DATA
    :reader DATA
    :initarg :DATA
    :type cl:string
    :initform ""))
)

(cl:defclass corbslam_update-request (<corbslam_update-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <corbslam_update-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'corbslam_update-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name corbslam_server-srv:<corbslam_update-request> is deprecated: use corbslam_server-srv:corbslam_update-request instead.")))

(cl:ensure-generic-function 'CID-val :lambda-list '(m))
(cl:defmethod CID-val ((m <corbslam_update-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader corbslam_server-srv:CID-val is deprecated.  Use corbslam_server-srv:CID instead.")
  (CID m))

(cl:ensure-generic-function 'TYPE-val :lambda-list '(m))
(cl:defmethod TYPE-val ((m <corbslam_update-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader corbslam_server-srv:TYPE-val is deprecated.  Use corbslam_server-srv:TYPE instead.")
  (TYPE m))

(cl:ensure-generic-function 'COUNT-val :lambda-list '(m))
(cl:defmethod COUNT-val ((m <corbslam_update-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader corbslam_server-srv:COUNT-val is deprecated.  Use corbslam_server-srv:COUNT instead.")
  (COUNT m))

(cl:ensure-generic-function 'DATA-val :lambda-list '(m))
(cl:defmethod DATA-val ((m <corbslam_update-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader corbslam_server-srv:DATA-val is deprecated.  Use corbslam_server-srv:DATA instead.")
  (DATA m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <corbslam_update-request>) ostream)
  "Serializes a message object of type '<corbslam_update-request>"
  (cl:let* ((signed (cl:slot-value msg 'CID)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'TYPE)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let* ((signed (cl:slot-value msg 'COUNT)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'DATA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'DATA))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <corbslam_update-request>) istream)
  "Deserializes a message object of type '<corbslam_update-request>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'CID) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'TYPE) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'COUNT) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'DATA) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'DATA) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<corbslam_update-request>)))
  "Returns string type for a service object of type '<corbslam_update-request>"
  "corbslam_server/corbslam_updateRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'corbslam_update-request)))
  "Returns string type for a service object of type 'corbslam_update-request"
  "corbslam_server/corbslam_updateRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<corbslam_update-request>)))
  "Returns md5sum for a message object of type '<corbslam_update-request>"
  "1aabe292bb21d2f96bb243920fb547e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'corbslam_update-request)))
  "Returns md5sum for a message object of type 'corbslam_update-request"
  "1aabe292bb21d2f96bb243920fb547e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<corbslam_update-request>)))
  "Returns full string definition for message of type '<corbslam_update-request>"
  (cl:format cl:nil "int32 CID~%int32 TYPE~%int32 COUNT~%string DATA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'corbslam_update-request)))
  "Returns full string definition for message of type 'corbslam_update-request"
  (cl:format cl:nil "int32 CID~%int32 TYPE~%int32 COUNT~%string DATA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <corbslam_update-request>))
  (cl:+ 0
     4
     4
     4
     4 (cl:length (cl:slot-value msg 'DATA))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <corbslam_update-request>))
  "Converts a ROS message object to a list"
  (cl:list 'corbslam_update-request
    (cl:cons ':CID (CID msg))
    (cl:cons ':TYPE (TYPE msg))
    (cl:cons ':COUNT (COUNT msg))
    (cl:cons ':DATA (DATA msg))
))
;//! \htmlinclude corbslam_update-response.msg.html

(cl:defclass <corbslam_update-response> (roslisp-msg-protocol:ros-message)
  ((ACK
    :reader ACK
    :initarg :ACK
    :type cl:integer
    :initform 0))
)

(cl:defclass corbslam_update-response (<corbslam_update-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <corbslam_update-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'corbslam_update-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name corbslam_server-srv:<corbslam_update-response> is deprecated: use corbslam_server-srv:corbslam_update-response instead.")))

(cl:ensure-generic-function 'ACK-val :lambda-list '(m))
(cl:defmethod ACK-val ((m <corbslam_update-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader corbslam_server-srv:ACK-val is deprecated.  Use corbslam_server-srv:ACK instead.")
  (ACK m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <corbslam_update-response>) ostream)
  "Serializes a message object of type '<corbslam_update-response>"
  (cl:let* ((signed (cl:slot-value msg 'ACK)) (unsigned (cl:if (cl:< signed 0) (cl:+ signed 4294967296) signed)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) unsigned) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) unsigned) ostream)
    )
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <corbslam_update-response>) istream)
  "Deserializes a message object of type '<corbslam_update-response>"
    (cl:let ((unsigned 0))
      (cl:setf (cl:ldb (cl:byte 8 0) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) unsigned) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) unsigned) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'ACK) (cl:if (cl:< unsigned 2147483648) unsigned (cl:- unsigned 4294967296))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<corbslam_update-response>)))
  "Returns string type for a service object of type '<corbslam_update-response>"
  "corbslam_server/corbslam_updateResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'corbslam_update-response)))
  "Returns string type for a service object of type 'corbslam_update-response"
  "corbslam_server/corbslam_updateResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<corbslam_update-response>)))
  "Returns md5sum for a message object of type '<corbslam_update-response>"
  "1aabe292bb21d2f96bb243920fb547e5")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'corbslam_update-response)))
  "Returns md5sum for a message object of type 'corbslam_update-response"
  "1aabe292bb21d2f96bb243920fb547e5")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<corbslam_update-response>)))
  "Returns full string definition for message of type '<corbslam_update-response>"
  (cl:format cl:nil "int32 ACK~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'corbslam_update-response)))
  "Returns full string definition for message of type 'corbslam_update-response"
  (cl:format cl:nil "int32 ACK~%~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <corbslam_update-response>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <corbslam_update-response>))
  "Converts a ROS message object to a list"
  (cl:list 'corbslam_update-response
    (cl:cons ':ACK (ACK msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'corbslam_update)))
  'corbslam_update-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'corbslam_update)))
  'corbslam_update-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'corbslam_update)))
  "Returns string type for a service object of type '<corbslam_update>"
  "corbslam_server/corbslam_update")