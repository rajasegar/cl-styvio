(in-package :cl-user)
(defpackage cl-styvio.web
  (:use :cl
        :caveman2
				:cl-dotenv
        :cl-styvio.config
        :cl-styvio.view
        :cl-styvio.db)
  (:export :*web*))
(in-package :cl-styvio.web)

;;
;; Application

(defclass <web> (<app>) ())
(defvar *web* (make-instance '<web>))
(clear-routing-rules *web*)
(.env:load-env (asdf:system-relative-pathname "cl-styvio" "./.env"))

(defvar *api-key* (uiop:getenv "API_KEY"))

(print *api-key*)

;;
;; Routing rules

(defroute "/" ()
  (let ((stock (cl-json:decode-json-from-string
								(dex:get (concatenate 'string "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=IBM&apikey=" *api-key*)))))
    (print stock)
  (render #P"index.html" (list :stock stock))))

;;
;; Error pages

(defmethod on-exception ((app <web>) (code (eql 404)))
  (declare (ignore app))
  (merge-pathnames #P"_errors/404.html"
                   *template-directory*))
