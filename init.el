;;; init.el --- Ian Ding's Emacs setup. -*- lexical-binding: t; -*-
;;
;;; Commentary:
;; This file configures Emacs.
;;
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "elisp"))

(require 'base)
(require 'theme)
(require 'completion)
(require 'vcs)
(require 'workspace)
(require 'lang)

(provide 'init)
;;; init.el ends here
