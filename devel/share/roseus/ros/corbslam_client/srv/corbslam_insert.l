;; Auto-generated. Do not edit!


(when (boundp 'corbslam_client::corbslam_insert)
  (if (not (find-package "CORBSLAM_CLIENT"))
    (make-package "CORBSLAM_CLIENT"))
  (shadow 'corbslam_insert (find-package "CORBSLAM_CLIENT")))
(unless (find-package "CORBSLAM_CLIENT::CORBSLAM_INSERT")
  (make-package "CORBSLAM_CLIENT::CORBSLAM_INSERT"))
(unless (find-package "CORBSLAM_CLIENT::CORBSLAM_INSERTREQUEST")
  (make-package "CORBSLAM_CLIENT::CORBSLAM_INSERTREQUEST"))
(unless (find-package "CORBSLAM_CLIENT::CORBSLAM_INSERTRESPONSE")
  (make-package "CORBSLAM_CLIENT::CORBSLAM_INSERTRESPONSE"))

(in-package "ROS")





(defclass corbslam_client::corbslam_insertRequest
  :super ros::object
  :slots (_CID _TYPE _COUNT _DATA ))

(defmethod corbslam_client::corbslam_insertRequest
  (:init
   (&key
    ((:CID __CID) 0)
    ((:TYPE __TYPE) 0)
    ((:COUNT __COUNT) 0)
    ((:DATA __DATA) "")
    )
   (send-super :init)
   (setq _CID (round __CID))
   (setq _TYPE (round __TYPE))
   (setq _COUNT (round __COUNT))
   (setq _DATA (string __DATA))
   self)
  (:CID
   (&optional __CID)
   (if __CID (setq _CID __CID)) _CID)
  (:TYPE
   (&optional __TYPE)
   (if __TYPE (setq _TYPE __TYPE)) _TYPE)
  (:COUNT
   (&optional __COUNT)
   (if __COUNT (setq _COUNT __COUNT)) _COUNT)
  (:DATA
   (&optional __DATA)
   (if __DATA (setq _DATA __DATA)) _DATA)
  (:serialization-length
   ()
   (+
    ;; int32 _CID
    4
    ;; int32 _TYPE
    4
    ;; int32 _COUNT
    4
    ;; string _DATA
    4 (length _DATA)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _CID
       (write-long _CID s)
     ;; int32 _TYPE
       (write-long _TYPE s)
     ;; int32 _COUNT
       (write-long _COUNT s)
     ;; string _DATA
       (write-long (length _DATA) s) (princ _DATA s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _CID
     (setq _CID (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _TYPE
     (setq _TYPE (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; int32 _COUNT
     (setq _COUNT (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; string _DATA
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _DATA (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(defclass corbslam_client::corbslam_insertResponse
  :super ros::object
  :slots (_ACK ))

(defmethod corbslam_client::corbslam_insertResponse
  (:init
   (&key
    ((:ACK __ACK) 0)
    )
   (send-super :init)
   (setq _ACK (round __ACK))
   self)
  (:ACK
   (&optional __ACK)
   (if __ACK (setq _ACK __ACK)) _ACK)
  (:serialization-length
   ()
   (+
    ;; int32 _ACK
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; int32 _ACK
       (write-long _ACK s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; int32 _ACK
     (setq _ACK (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;;
   self)
  )

(defclass corbslam_client::corbslam_insert
  :super ros::object
  :slots ())

(setf (get corbslam_client::corbslam_insert :md5sum-) "1aabe292bb21d2f96bb243920fb547e5")
(setf (get corbslam_client::corbslam_insert :datatype-) "corbslam_client/corbslam_insert")
(setf (get corbslam_client::corbslam_insert :request) corbslam_client::corbslam_insertRequest)
(setf (get corbslam_client::corbslam_insert :response) corbslam_client::corbslam_insertResponse)

(defmethod corbslam_client::corbslam_insertRequest
  (:response () (instance corbslam_client::corbslam_insertResponse :init)))

(setf (get corbslam_client::corbslam_insertRequest :md5sum-) "1aabe292bb21d2f96bb243920fb547e5")
(setf (get corbslam_client::corbslam_insertRequest :datatype-) "corbslam_client/corbslam_insertRequest")
(setf (get corbslam_client::corbslam_insertRequest :definition-)
      "int32 CID
int32 TYPE
int32 COUNT
string DATA
---
int32 ACK

")

(setf (get corbslam_client::corbslam_insertResponse :md5sum-) "1aabe292bb21d2f96bb243920fb547e5")
(setf (get corbslam_client::corbslam_insertResponse :datatype-) "corbslam_client/corbslam_insertResponse")
(setf (get corbslam_client::corbslam_insertResponse :definition-)
      "int32 CID
int32 TYPE
int32 COUNT
string DATA
---
int32 ACK

")



(provide :corbslam_client/corbslam_insert "1aabe292bb21d2f96bb243920fb547e5")


