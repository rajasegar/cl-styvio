(defsystem "cl-styvio"
  :version "0.1.0"
  :author "Rajasegar Chandran"
  :license ""
  :depends-on ("clack"
               "lack"
               "caveman2"
               "envy"
               "cl-ppcre"
               "uiop"

               ;; HTML Template
               "djula"

               ;; ajax
               "dexador"

               ;; json
               "cl-json"

							 ;; dotenv
							 "cl-dotenv")
  :components ((:module "src"
                :components
                ((:file "main" :depends-on ("config" "view" "db"))
                 (:file "web" :depends-on ("view"))
                 (:file "view" :depends-on ("config"))
                 (:file "db" :depends-on ("config"))
                 (:file "config"))))
  :description ""
  :in-order-to ((test-op (test-op "cl-styvio-test"))))
