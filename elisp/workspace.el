(use-package projectile
  :diminish
  projectile-mode
  :config
  (setq projectile-completion-system 'ivy)
  (projectile-mode t)
  :bind-keymap
  ("C-c C-p" . projectile-command-map)
  :init
  (setq projectile-switch-project-action #'projectile-dired))

(use-package counsel-projectile
  :after projectile
  :config
  (counsel-projectile-mode))

(use-package treemacs
  :defer t
  :bind
  ("M-0"       . treemacs-select-window)
  ("C-x t 1"   . treemacs-delete-other-windows)
  ("C-x t t"   . treemacs)
  ("C-x t B"   . treemacs-bookmark)
  ("C-x t C-t" . treemacs-find-file)
  ("C-x t M-t" . treemacs-find-tag)
  :config
  ;; The default behavior to open a file is to double-click. This is what most UI does
  ;; but unfortunately it's inconsistent for macOS.
  (with-eval-after-load 'treemacs
    (define-key treemacs-mode-map [mouse-1] #'treemacs-single-click-expand-action)))


(use-package treemacs-projectile
  :after (treemacs projectile))

(use-package treemacs-icons-dired
  :after (treemacs dired)
  :config (treemacs-icons-dired-mode))

(use-package treemacs-magit
  :after (treemacs magit))

(provide 'workspace)
