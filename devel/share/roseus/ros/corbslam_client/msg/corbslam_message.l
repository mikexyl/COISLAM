;; Auto-generated. Do not edit!


(when (boundp 'corbslam_client::corbslam_message)
  (if (not (find-package "CORBSLAM_CLIENT"))
    (make-package "CORBSLAM_CLIENT"))
  (shadow 'corbslam_message (find-package "CORBSLAM_CLIENT")))
(unless (find-package "CORBSLAM_CLIENT::CORBSLAM_MESSAGE")
  (make-package "CORBSLAM_CLIENT::CORBSLAM_MESSAGE"))

(in-package "ROS")
;;//! \htmlinclude corbslam_message.msg.html


(defclass corbslam_client::corbslam_message
  :super ros::object
  :slots (_TRANSM _DATA ))

(defmethod corbslam_client::corbslam_message
  (:init
   (&key
    ((:TRANSM __TRANSM) "")
    ((:DATA __DATA) "")
    )
   (send-super :init)
   (setq _TRANSM (string __TRANSM))
   (setq _DATA (string __DATA))
   self)
  (:TRANSM
   (&optional __TRANSM)
   (if __TRANSM (setq _TRANSM __TRANSM)) _TRANSM)
  (:DATA
   (&optional __DATA)
   (if __DATA (setq _DATA __DATA)) _DATA)
  (:serialization-length
   ()
   (+
    ;; string _TRANSM
    4 (length _TRANSM)
    ;; string _DATA
    4 (length _DATA)
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string _TRANSM
       (write-long (length _TRANSM) s) (princ _TRANSM s)
     ;; string _DATA
       (write-long (length _DATA) s) (princ _DATA s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string _TRANSM
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _TRANSM (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;; string _DATA
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setq _DATA (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
   ;;
   self)
  )

(setf (get corbslam_client::corbslam_message :md5sum-) "5356b099d5ff117b1b1e0b26458d0016")
(setf (get corbslam_client::corbslam_message :datatype-) "corbslam_client/corbslam_message")
(setf (get corbslam_client::corbslam_message :definition-)
      "string TRANSM
string DATA

")



(provide :corbslam_client/corbslam_message "5356b099d5ff117b1b1e0b26458d0016")


