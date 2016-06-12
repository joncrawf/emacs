;;; functions.el --- List of my own functions
;;; Commentary:

;;; Code:

(defun comment-it ()
  "comment or uncomment region or line"
  (interactive)
  (if mark-active
    (comment-or-uncomment-region (region-beginning) (region-end))
    (comment-or-uncomment-region (line-beginning-position) (line-end-position))))

(defun duplicate-line ()
	"duplicate line under mark"
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))

(provide 'functions)
;;; functions.el ends here
