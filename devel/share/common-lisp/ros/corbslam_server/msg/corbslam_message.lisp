; Auto-generated. Do not edit!


(cl:in-package corbslam_server-msg)


;//! \htmlinclude corbslam_message.msg.html

(cl:defclass <corbslam_message> (roslisp-msg-protocol:ros-message)
  ((TRANSM
    :reader TRANSM
    :initarg :TRANSM
    :type cl:string
    :initform "")
   (DATA
    :reader DATA
    :initarg :DATA
    :type cl:string
    :initform ""))
)

(cl:defclass corbslam_message (<corbslam_message>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <corbslam_message>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'corbslam_message)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name corbslam_server-msg:<corbslam_message> is deprecated: use corbslam_server-msg:corbslam_message instead.")))

(cl:ensure-generic-function 'TRANSM-val :lambda-list '(m))
(cl:defmethod TRANSM-val ((m <corbslam_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader corbslam_server-msg:TRANSM-val is deprecated.  Use corbslam_server-msg:TRANSM instead.")
  (TRANSM m))

(cl:ensure-generic-function 'DATA-val :lambda-list '(m))
(cl:defmethod DATA-val ((m <corbslam_message>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader corbslam_server-msg:DATA-val is deprecated.  Use corbslam_server-msg:DATA instead.")
  (DATA m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <corbslam_message>) ostream)
  "Serializes a message object of type '<corbslam_message>"
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'TRANSM))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'TRANSM))
  (cl:let ((__ros_str_len (cl:length (cl:slot-value msg 'DATA))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) (cl:slot-value msg 'DATA))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <corbslam_message>) istream)
  "Deserializes a message object of type '<corbslam_message>"
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'TRANSM) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:slot-value msg 'TRANSM) __ros_str_idx) (cl:code-char (cl:read-byte istream)))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<corbslam_message>)))
  "Returns string type for a message object of type '<corbslam_message>"
  "corbslam_server/corbslam_message")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'corbslam_message)))
  "Returns string type for a message object of type 'corbslam_message"
  "corbslam_server/corbslam_message")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<corbslam_message>)))
  "Returns md5sum for a message object of type '<corbslam_message>"
  "5356b099d5ff117b1b1e0b26458d0016")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'corbslam_message)))
  "Returns md5sum for a message object of type 'corbslam_message"
  "5356b099d5ff117b1b1e0b26458d0016")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<corbslam_message>)))
  "Returns full string definition for message of type '<corbslam_message>"
  (cl:format cl:nil "string TRANSM~%string DATA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'corbslam_message)))
  "Returns full string definition for message of type 'corbslam_message"
  (cl:format cl:nil "string TRANSM~%string DATA~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <corbslam_message>))
  (cl:+ 0
     4 (cl:length (cl:slot-value msg 'TRANSM))
     4 (cl:length (cl:slot-value msg 'DATA))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <corbslam_message>))
  "Converts a ROS message object to a list"
  (cl:list 'corbslam_message
    (cl:cons ':TRANSM (TRANSM msg))
    (cl:cons ':DATA (DATA msg))
))
