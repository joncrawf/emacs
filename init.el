;;; init.el --- My Emacs Initialisation File.
;;; Commentary:

;;; Code:
(require 'package)

(defconst base-path (file-name-directory (or load-file-name buffer-file-name)))
(setq custom-file (concat base-path "init/custom.el"))
(setq-default package-user-dir (concat base-path "packages/elpa"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize nil)

(defvar my-packages '(use-package exec-path-from-shell ido smex auto-complete company yasnippet cider shell-pop flycheck))
(dolist (p my-packages)
  (unless (package-installed-p p)
    (package-install p)))

(require 'use-package)

(use-package functions :load-path "init")

;;---------------
;; Packages
;;---------------
(use-package ido
  :demand
  :config
  (ido-mode 1)
  (setq ido-vertical-define-keys 'C-n-C-p-up-down-left-right)
  (setq ido-enable-flex-matching t)
  (setq ido-everywhere t)
  (setq ido-enable-regexp t)
  (setq ido-create-new-buffer 'always)
  (defalias 'ido-magic-forward-char 'ido-next-match)
  (defalias 'ido-magic-backward-char 'ido-prev-match)
  :bind
  ("C-x C-f" . ido-find-file)
  ("C-x f"   . ido-find-file)
  ("C-x F"   . ido-find-file-other-window)
  ("C-x B"   . ido-switch-buffer-other-window)
  ("C-x b"   . ido-switch-buffer))

(use-package smex
  :config (smex-initialize)
  :bind ("M-x" . smex)
        ("M-X" . smex-major-mode-commands)
        ("C-c M-x" . execute-extended-command))

;; Autocompleting
(use-package company
	:config
	(add-hook 'after-init-hook 'global-company-mode))

(use-package yasnippet
  :config
  (setq yas-snippet-dirs (concat base-path "/snippets"))
	(yas-global-mode 1)
  (add-hook 'after-init-hook 'yas-global-mode))

(use-package auto-complete
  :demand t
  :config
  (ac-config-default)
  (set-default 'ac-sources
               '(ac-source-yasnippet
                 ac-source-words-in-same-mode-buffers))
  (global-auto-complete-mode t)
	(bind-keys :map ac-completing-map ("\e" . ac-stop))
  (bind-keys :map ac-complete-mode-map
             ([tab] . ac-expand-common)
             ([return] . ac-complete)
             ("C-s" . ac-isearch)
             ("C-n" . ac-next)
             ("C-p" . ac-previous))
  :bind ([S-tab] . auto-complete))

(use-package flycheck
  :config (global-flycheck-mode)
  (bind-keys :map flycheck-mode-map
             ("C-c C-e" . flycheck-list-errors)
             ("C-c C-n" . flycheck-next-error)
             ("C-c C-p" . flycheck-previous-error)))

(use-package shell-pop
  :bind ("C-`" . shell-pop)
  :config
  (add-hook 'term-mode-hook '(lambda () (yas-minor-mode -1))))

;;---------------
;; Language/Framework Specific
;;---------------
(use-package cider)

;;---------------
;; Setup Values
;;---------------
(setq exec-path '("/usr/local/bin" "/usr/bin" "/bin"))

;; Startup variables
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message t)
(setq auto-save-default nil)                ; Don't autosave
(setq visible-bell nil)
(setq make-backup-files nil)                ; Don't make backup files
(setq create-lockfiles nil)                 ; Don't make lock files
(setq shift-select-mode t)                  ; Allow for shift selection mode
(setq inhibit-splash-screen t)              ; Disable splash screen
(setq ring-bell-function 'ignore)
(setq truncate-lines nil)

(setq frame-title-format "%b is changing!")
(setq-default cursor-type 'bar)             ; Change cursor to bar
(setq-default tab-width 2)

(show-paren-mode t) ; Show paranthesis matching
(delete-selection-mode 1) ; Allows for deletion when typing over highlighted text
(fset 'yes-or-no-p 'y-or-n-p)

(menu-bar-mode -1)
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Global Mode Stuff
(global-linum-mode 1) ; enable line numbers
(define-key global-map (kbd "RET") 'newline-and-indent)

(set-frame-font "Inconsolata:pixelsize=14")

;; Fix the PATH variable
(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (shell-command-to-string "TERM=vt100 $SHELL -i -c 'echo $PATH'")))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))

;;------------------
;; My Load Files
;;------------------
(setq custom-file (concat base-path "init/custom.el"))
(add-to-list 'custom-theme-load-path (concat base-path "/packages/themes"))

(when window-system
  (load-theme 'monokai t))

(use-package keys :load-path "init")
(load-file (concat base-path "init/custom.el"))

(provide 'init)
;;; init.el ends here
