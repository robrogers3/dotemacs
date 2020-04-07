
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)

(require 'projectile)
(require 'exec-path-from-shell)
(require 'helm-swoop)
(require 'helm-config)
(require 'ag)
(require 'ws-butler)
(require 'flymake-php)
(add-hook 'php-mode-hook 'flymake-php-load)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
(if (display-graphic-p)
    (progn


    (tool-bar-mode -1)                             ; No toolbar
    (menu-bar-mode 't)                             ; menubar
    (define-key menu-bar-tools-menu [games] nil)   ; Remove games menu
    (scroll-bar-mode -1)         ; No scrollbar
  ))

(show-paren-mode 1)
(load-theme 'material t)
(setq transient-mark-mode t)
(setq require-final-newline 't)
(exec-path-from-shell-initialize)
(global-font-lock-mode 1)                      ; Color enabled

(setq-default show-trailing-whitespace t)
(add-hook 'prog-mode-hook #'ws-butler-mode)
(add-hook 'flycheck-mode-hook #'flycheck-haskell-setup)

(defun reload ()
  "reload dotemacs."
  (interactive)
  (load "~/.emacs.d/init.el"))


(defun other-window-reverse ()
  "Yep."
  (interactive)
  (other-window -1))

(defun copy-as-kill ()
  "Copy line as kill."
  (interactive)
  (save-excursion
    (kill-ring-save (point) (progn (move-end-of-line nil) (point)))))

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


(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(projectile-mode +1)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)
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
(global-set-key (kbd "C-x b") 'helm-buffers-list)
(global-set-key (kbd "C-x r b") 'helm-bookmarks)
(global-set-key (kbd "C-x m") 'helm-M-x)
(global-set-key (kbd "C-x C-f") 'helm-find-files)
(global-set-key (kbd "C-c C-e") 'xref-find-definitions-other-window)
(defalias 'yes-or-no-p 'y-or-n-p)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (flycheck-haskell haskell-mode magit flycheck use-package flymake-php helm-ag helm-projectile projectile helm-swoop helm ag web-mode php-mode ws-butler material-theme markdown-mode exec-path-from-shell)))
 '(ws-butler-global-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
