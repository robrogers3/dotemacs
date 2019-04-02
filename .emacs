(package-initialize)
(require 'tls)
(tool-bar-mode -1)                             ; No toolbar
;;(menu-bar-mode -1)                             ; No menubar
(define-key menu-bar-tools-menu [games] nil)   ; Remove games menu
(scroll-bar-mode -1)                           ; No scrollbar
(setq transient-mark-mode t)
(setq require-final-newline 't)
(global-font-lock-mode 1)                      ; Color enabled


(add-hook 'shell-mode-hook
          (lambda()
            (setq show-trailing-whitespace nil)))


(defun reload ()
  (interactive)
  (load "~/.emacs"))


(defun other-window-reverse ()
  (interactive)
  (other-window -1))

(defun copy-as-kill ()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (move-beginning-of-line 1))

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
