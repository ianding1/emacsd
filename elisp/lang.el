;;; lang.el --- Summary -*- lexical-binding: t; -*-
;;
;;; Commentary:
;; Language servers, syntax checkers, code completion
;;
;;; Code:

;; Disable eldoc mode globally.
(global-eldoc-mode -1)

(use-package flycheck
  :init
  (global-flycheck-mode)
  :config
  (setq flycheck-emacs-lisp-load-path 'inherit))

(use-package lsp-mode
  :init
  (setq lsp-keymap-prefix "C-c l")
  :hook ((vue-mode . lsp)
         (typescript-mode . lsp)
         (lsp-mode . lsp-enable-which-key-integration))
  :commands lsp
  :config
  (add-to-list 'lsp-file-watch-ignored-directories "[/\\\\]build\\'"))

(use-package lsp-ui
  :commands lsp-ui-mode
  :config
  ;; Disable sideline diagnostics and code actions since they are kind of
  ;; distracting.
  (setq lsp-ui-sideline-show-diagnostics nil
        lsp-ui-sideline-show-hover nil
        lsp-ui-sideline-show-code-actions nil
        lsp-ui-doc-show-with-cursor nil))

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

(use-package typescript-mode)

(use-package prettier
  :hook
  (typescript-mode . prettier-mode)
  (vue-mode . prettier-mode))

(defvar ianding1/lombok-jar-path
  (expand-file-name (concat user-emacs-directory ".cache/lombok.jar"))
  "The lombok jar file path.")

(use-package lsp-java
  :hook
  ((java-mode . lsp))
  :config
  (setq lsp-java-vmargs
        (list
         "-noverify"
         "-Xmx1G"
         "-XX:+UseG1GC"
         "-XX:+UseStringDeduplication"
         (concat "-javaagent:" ianding1/lombok-jar-path))))


(provide 'lang)
;;; lang.el ends here
