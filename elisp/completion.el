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
  (add-hook 'after-init-hook 'global-company-mode)
  ;; The default delay is 0.2s, reducing it to 0.05 did make the completion
  ;; pop up quicker. However, it also caused company to send too many
  ;; requests, which could get worse with the combination of a smaller
  ;; minimum prefix length, especially when the completion list may contain
  ;; all LOTS OF symbols. Completion responses would make Emacs sluggish.
  (setq company-idle-delay 0.1)
  ;; Show suggestions after entering two characters
  (setq company-minimum-prefix-length 4)
  ;; Wrap to the first of selection if reaches the end
  (setq company-selection-wrap-around t))

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
