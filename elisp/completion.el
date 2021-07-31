(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers nil))

(use-package counsel
  :bind
  ("M-x" . counsel-M-x)
  ("C-x C-m" . counsel-M-x)
  ("C-x C-f" . counsel-find-file))

(use-package company
  :config
  (add-hook 'after-init-hook 'global-company-mode))

(use-package which-key
  :defer 0
  :custom
  (which-key-setup-side-window-bottom)
  (which-key-enable-extended-define-key t)
  (which-key-idle-delay 1)
  :config
  (which-key-mode)
  (which-key-setup-minibuffer))

(provide 'completion)
