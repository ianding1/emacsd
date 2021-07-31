;;; lang.el --- Summary -*- lexical-binding: t; -*-
;;
;;; Commentary:
;; Language servers, syntax checkers, code completion
;;
;;; Code:
(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((vue-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp)

(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-ivy :commands lsp-ivy-workspace-symbol)
;; (use-package lsp-treemacs :commands lsp-treemacs-errors-list)

;; (use-package dap-mode)
;; (use-package dap-LANGUAGE) to load the dap adapter for your language

(use-package lsp-pyright
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

(use-package vue-mode
  :config
  ;; The default value is 1, which gives a different shade of background on
  ;; the submode. But as Vue SFC is submodes everywhere, this looks pretty
  ;; bad.
  (setq mmm-submode-decoration-level 0))

(provide 'lang)
;;; lang.el ends here
