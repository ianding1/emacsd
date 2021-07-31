;;; base.el --- Summary -*- lexical-binding: t; -*-
;;
;;; Commentary:
;; Basic settings for Emacs. Package manager, better defaults, ...
;;
;;; Code:

(require 'package)

(setq package-enable-at-startup nil)

(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package better-defaults)

(when (boundp 'comp-speed)
  (setq comp-speed 2))

(setq max-lisp-eval-depth 2000)

(setq gc-cons-threshold 100000000)

(use-package exec-path-from-shell
	     :init (exec-path-from-shell-initialize))

(setq inhibit-startup-screen t
      initial-scratch-message nil
      sentence-end-double-space nil
      ring-bell-function 'ignore
      use-dialog-box nil
      mark-even-if-inactive nil
      kill-whole-line t
      case-fold-search nil)

(setq read-process-output-max (* 1024 1024))

(setq fill-column 79)

(defalias 'yes-or-no-p 'y-or-n-p)

(set-charset-priority 'unicode)
(setq locale-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
(setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(delete-selection-mode t)
(global-display-line-numbers-mode t)
(column-number-mode)

(require 'hl-line)
(add-hook 'prog-mode-hook #'hl-line-mode)
(add-hook 'text-mode-hook #'hl-line-mode)

(setq make-backup-files nil
      auto-save-default nil
      create-lockfiles nil)

(require 'recentf)
(add-to-list 'recentf-exclude "\\elpa")

(if ( version< "27.0" emacs-version ) ; )
    (set-fontset-font "fontset-default" 'unicode "Apple Color Emoji" nil 'prepend)
  (warn "This Emacs version is too old to properly support emoji."))

(unbind-key "C-x C-d") ;; list-directory
(unbind-key "C-z") ;; suspend-frame
(unbind-key "M-o") ;; facemenu-mode
(unbind-key "<mouse-2>") ;; pasting with mouse-wheel click
(unbind-key "<C-wheel-down>") ;; text scale adjust
(unbind-key "<C-wheel-up>") ;; ditto
(unbind-key "s-t") ;; ns-popup-font-panel

(add-hook 'before-save-hook #'delete-trailing-whitespace)
(setq require-final-newline t)

(show-paren-mode)

(use-package iedit)

(use-package sudo-edit)

(global-so-long-mode)

(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode)

(use-package all-the-icons)

(use-package all-the-icons-dired
  :after all-the-icons
  :diminish all-the-icons-dired-mode
  :hook (dired-mode . all-the-icons-dired-mode))

(defvar ianding1/custom-file
  (expand-file-name "custom.el" user-emacs-directory))

(if (file-exists-p ianding1/custom-file)
    (load custom-file))

(provide 'base)
;;; base.el ends here
