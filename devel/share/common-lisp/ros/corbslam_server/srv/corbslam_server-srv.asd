
(cl:in-package :asdf)

(defsystem "corbslam_server-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "corbslam_insert" :depends-on ("_package_corbslam_insert"))
    (:file "_package_corbslam_insert" :depends-on ("_package"))
    (:file "corbslam_update" :depends-on ("_package_corbslam_update"))
    (:file "_package_corbslam_update" :depends-on ("_package"))
  ))