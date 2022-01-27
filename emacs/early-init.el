;;; early-init.el --- touch default settings -*- lexical-binding: t -*-

;;; Commentary:

;;; Code:


;;; no more mouse

(menu-bar-mode 0)
(tool-bar-mode 0)
(set-scroll-bar-mode nil)
(toggle-scroll-bar nil)


;;; Ignore .Xresources

(advice-add #'x-apply-session-resources :override #'ignore)


;;; only utf-8

(set-language-environment 'utf-8)
(set-default-coding-systems 'utf-8)
(set-selection-coding-system 'utf-8)
(set-locale-environment ".UTF-8")
(prefer-coding-system 'utf-8)
(setq-default utf-translate-cjk-mode nil)


;;; font

(set-face-attribute 'default nil :family "Hack")
(set-face-attribute 'default nil :height 160)
(set-fontset-font t 'hangul (font-spec :name "d2coding"))
(setq-default face-font-rescale-alist
              '(("d2coding" . 1.2307692307692308)))


;;; just one press for yes or no

(fset 'yes-or-no-p 'y-or-n-p)


;;; no tabs; only spaces

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)

;;; Trim trailing whitespaces when saving files.

(add-hook 'before-save-hook 'delete-trailing-whitespace)


;;; redirect backup to separate directory; not more #

(setq-default backup-directory-alist '((".*" . "~/.emacs.d/backups/"))
              auto-save-file-name-transforms '((".*" "~/.emacs.d/backups/" t)))


;;; No issue link is needed

(bug-reference-mode nil)


;;; smooth scrolling

(setq-default redisplay-dont-pause t
              scroll-margin 1
              scroll-step 1
              scroll-conservatively 10000
              scroll-preserve-screen-position 1
              mouse-wheel-scroll-amount '(1 ((shift) . 1)))


;;; disable package.el

(setq-default package-enable-at-startup nil)


;;; Truncate exceeding lines

(setq truncate-lines 0)


;;; For source files add line number indicator

(dolist (editor '(prog-mode-hook org-mode-hook text-mode-hook yaml-mode-hook))
  (add-hook editor
            (lambda ()
              (setq indicate-empty-lines t)
              (setq display-line-numbers 'relative))))


;;; Activate narrow

(put 'narrow-to-region 'disabled nil)


;;; early-init.el ends here
