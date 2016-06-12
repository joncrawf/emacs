;;; custom.el --- Custom Settings
;;; Commentary:

;;; Code:
(defvar common-load-dir (file-name-directory (or load-file-name buffer-file-name)))
(defvar common-package-dir "../packages")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0107651d44bfacc9ee4d725fdba9a617273ef0569bffc8f07e7212d39d1bf6ec" default)))

 '(make-backup-files nil)
 '(indent-tabs-mode nil)
 '(tab-stop-list (quote (2 4 6 8 10 12 14 16 18 20 22 24 26 28 30)))
 '(scroll-bar-mode nil)

 '(ido-separator nil)
 '(ido-use-filename-at-point (quote guess))

 '(ac-auto-show-menu t)
 '(ac-auto-start t)
 '(ac-candidate-limit 80)
 '(ac-delay 0.5)
 '(ac-etags-requires 1)
 '(ac-expand-on-auto-complete t)
 '(ac-quick-help-delay 0.5))

(custom-set-faces
 '(ac-yasnippet-candidate-face ((t (:inherit ac-candidate-face :background "#2B3B40" :foreground "sandybrown"))))
 '(ac-yasnippet-selection-face ((t (:background "#2B3B40" :foreground "coral3"))))
 )

(provide 'custom)
;;; custom.el ends here
