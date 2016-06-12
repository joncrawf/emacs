;;; functions.el --- List of my own functions
;;; Commentary:
;; Credit: Jon Crawford <jon@joncrawf.com>

;;; Code:

(defun comment-it ()
  "comment or uncomment region or line"
  (interactive)
  (if mark-active
    (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(provide 'functions)
;;; functions.el ends here
