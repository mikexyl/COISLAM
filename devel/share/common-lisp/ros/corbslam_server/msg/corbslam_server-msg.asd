
(cl:in-package :asdf)

(defsystem "corbslam_server-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "corbslam_message" :depends-on ("_package_corbslam_message"))
    (:file "_package_corbslam_message" :depends-on ("_package"))
  ))