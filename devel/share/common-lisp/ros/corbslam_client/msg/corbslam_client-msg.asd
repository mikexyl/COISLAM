
(cl:in-package :asdf)

(defsystem "corbslam_client-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "corbslam_message" :depends-on ("_package_corbslam_message"))
    (:file "_package_corbslam_message" :depends-on ("_package"))
  ))