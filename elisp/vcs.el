;;; vcs.el --- Summary -*- lexical-binding: t; -*-
;;
;;; Commentary:
;;
;; Magit, git diff status tools
;;
;;; Code:
(use-package magit
  :config
  (setq magit-completing-read-function 'ivy-completing-read)
  :bind
  ;; Magic
  ("C-x g s" . magit-status)
  ("C-x g x" . magit-checkout)
  ("C-x g c" . magit-commit)
  ("C-x g p" . magit-push)
  ("C-x g u" . magit-pull)
  ("C-x g e" . magit-ediff-resolve)
  ("C-x g r" . magit-rebase-interactive))
(use-package magit-popup)

(use-package diff-hl
  :config
  (global-diff-hl-mode))

(provide 'vcs)
;;; vcs.el ends here
