
(cl:in-package :asdf)

(defsystem "corbslam_client-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "corbslam_insert" :depends-on ("_package_corbslam_insert"))
    (:file "_package_corbslam_insert" :depends-on ("_package"))
    (:file "corbslam_update" :depends-on ("_package_corbslam_update"))
    (:file "_package_corbslam_update" :depends-on ("_package"))
    (:file "orbslam_client_testsrv" :depends-on ("_package_orbslam_client_testsrv"))
    (:file "_package_orbslam_client_testsrv" :depends-on ("_package"))
  ))