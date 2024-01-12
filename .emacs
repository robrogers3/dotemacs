(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)
;;(require 'exec-path-from-shell) ;; if not using the ELPA package
(exec-path-from-shell-initialize)
(require 'tls)
(require 'ag)
(tool-bar-mode -1)                             ; No toolbar
(show-paren-mode 1)
;;(menu-bar-mode -1)                             ; No menubar
(define-key menu-bar-tools-menu [games] nil)   ; Remove games menu
(scroll-bar-mode -1)                           ; No scrollbar
(setq transient-mark-mode t)
(setq require-final-newline 't)
(global-font-lock-mode 1)                      ; Color enabled

(setq projectile-enable-caching t)
(setq projectile-completion-system 'grizzl)
;; Press Command-p for fuzzy find in project
(global-set-key (kbd "s-p") 'projectile-find-file)
;; Press Command-b for fuzzy switch buffer
(global-set-key (kbd "s-b") 'projectile-switch-to-buffer)
(add-hook 'shell-mode-hook
          (lambda()
            (setq show-trailing-whitespace nil)))
(add-to-list 'load-path "~/.emacs.d/site-lisp/")

(add-to-list 'exec-path "/usr/local/bin")

(defun reload ()
  (interactive)
  (load "~/.emacs"))


(defun other-window-reverse ()
  (interactive)
  (other-window -1))

(defun copy-as-kill ()
  (interactive)
  (interactive)
  (save-excursion
    (kill-line)
    (yank)))

;; (move-beginning-of-line 1)
;; (kill-line)
;; (yank)
;; (move-beginning-of-line 1))

(defun foo ()
  "Do something"
  (interactive)
  (save-excursion
    (kill-line)
    (yank)))

(defun er-indent-buffer ()
  "Indent the currently visited buffer."
  (interactive)
  (indent-region (point-min) (point-max)))

(defun er-indent-region-or-buffer ()
  "Indent a region if selected, otherwise the whole buffer."
  (interactive)
  (save-excursion
    (if (region-active-p)
        (progn
          (indent-region (region-beginning) (region-end))
          (message "Indented selected region."))
      (progn
        (er-indent-buffer)
        (message "Indented buffer.")))))

(global-set-key [(control tab)] 'delete-backward-char)
(global-set-key "\C-ck" 'copy-as-kill)
(global-set-key "\C-cr" 'revert-buffer)
(global-set-key "\C-ci" 'er-indent-region-or-buffer)
(global-set-key "\C-cc" 'comment-region)
(global-set-key "\C-cu" 'uncomment-region)
(global-set-key "\C-xp" 'other-window-reverse)
(global-set-key "\C-c\C-a" 'mark-whole-buffer)
;;(global-unset-key "\C-cb")
(global-set-key (kbd "<C-up>") 'shrink-window)
(global-set-key (kbd "<C-down>") 'enlarge-window)
(global-set-key (kbd "<C-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<C-right>") 'enlarge-window-horizontally)
(global-set-key "\M-g" 'goto-line)
(defalias 'yes-or-no-p 'y-or-n-p)



;;;;

;;; resize-frame.el --- A minor mode to resize frames easily.  -*- lexical-binding: t; -*-

;; Copyright (C) 2014  kuanyui

;; Author: kuanyui <azazabc123@gmail.com>
;; Keywords: frames, tools, convenience
;; License: WTFPL 1.0

;;; Commentary:

;; Press "ESC `" and use arrow-keys or i/j/k/l to adjust frames. press any key to done.

;;; Code:

(defvar resize-frame-map
  (let ((map (make-keymap)))
    (define-key map (kbd "<up>") 'enlarge-window)
    (define-key map (kbd "<down>") 'shrink-window)
    (define-key map (kbd "<right>") 'enlarge-window-horizontally)
    (define-key map (kbd "<left>") 'shrink-window-horizontally)
    (set-char-table-range (nth 1 map) t 'resize-frame-done)
    (define-key map (kbd "C-p") 'enlarge-window)
    (define-key map (kbd "C-n") 'shrink-window)
    (define-key map (kbd "C-f") 'enlarge-window-horizontally)
    (define-key map (kbd "C-b") 'shrink-window-horizontally)
    map))

(define-minor-mode resize-frame
  "A simple minor mode to resize-frame.
C-c C-c to apply."
  ;; The initial value.
  :init-value nil
  ;; The indicator for the mode line.
  :lighter " ResizeFrame"
  ;; The minor mode bindings.
  :keymap resize-frame-map
  :global t
  (if (<= (length (window-list)) 1)
      (progn (setq resize-frame nil)
             (message "Only root frame exists, abort."))
    (message "Use arrow-keys or i/j/k/l to adjust frames.")))

(defun resize-frame-done ()
  (interactive)
  (setq resize-frame nil)
  (message "Done."))

(global-set-key (kbd "ESC `") 'resize-frame)

(provide 'resize-frame)
;;; resize-frame.el ends here2
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(custom-enabled-themes (quote (tango-dark)))
 '(custom-safe-themes
   (quote
    ("b46ee2c193e350d07529fcd50948ca54ad3b38446dcbd9b28d0378792db5c088" default)))
 '(package-selected-packages
   (quote
    (projectile grizzl exec-path-from-shell ag enh-ruby-mode auto-complete package-build shut-up epl git commander f dash s pallet poly-erb yaml-mode dracula-theme vue-mode markdown-mode php-mode))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
