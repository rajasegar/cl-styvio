(defsystem "cl-styvio-test"
  :defsystem-depends-on ("prove-asdf")
  :author "Rajasegar Chandran"
  :license ""
  :depends-on ("cl-styvio"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "cl-styvio"))))
  :description "Test system for cl-styvio"
  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
