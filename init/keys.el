;;; keys.el --- My Key Bindings
;;; Commentary:
;; note: C-h k is the command used to discover key-presses

;;; Code:
(global-set-key (kbd "M-£") '(lambda () (interactive) (insert "#")))

;; Undo and Redo
(global-set-key (kbd "M-;") 'semi-colon-end)

(global-set-key [M-right] 'forward-word)
(global-set-key [M-left] 'backward-word)

(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "C-k") 'kill-line)

(global-set-key (kbd "s-h") 'goto-line)

(global-set-key (kbd "s-p") 'ibuffer)

;; Duplicate line
(global-set-key (kbd "s-d") 'duplicate-line)
(global-set-key (kbd "M-W") 'smart-copy)

(global-set-key (kbd "C-x C-x") 'delete-other-windows)

;; Comment regions
(global-set-key (kbd "s-/") 'comment-it)

;window movement
(global-set-key (kbd "C-S-<left>") 'windmove-left)
(global-set-key (kbd "C-S-<right>") 'windmove-right)
(global-set-key (kbd "C-S-<down>") 'windmove-down)
(global-set-key (kbd "C-S-<up>") 'windmove-up)

(provide 'keys)
;;; keys.el ends here
