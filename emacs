(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives
	     '("marmalade" . "http://marmalade-repo.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(evil-mode 1)
(define-key evil-normal-state-map (kbd "q") nil)

; path
(add-to-list 'load-path "~/.emacs.d/stuff")

; theme
(load-theme 'wombat)
;(require 'evenhold-theme "evenhold-theme/evenhold-theme.el")

; pitch black pls
;(add-to-list 'default-frame-alist '(background-color . "black"))
;(set-background-color "black")

(when (window-system)
  (tool-bar-mode -1)
  (set-frame-size (selected-frame) 140 56)
;  (scroll-bar-mode -1)
)
(add-hook 'prog-mode-hook (lambda () (linum-mode 1)))
(linum-mode +1)
(require 'nyan-mode "nyan-mode/nyan-mode.el")
(nyan-mode +1)


;;; esc quits
(defun minibuffer-keyboard-quit ()
  "Abort recursive edit.
    In Delete Selection mode, if the mark is active, just deactivate it;
    then it takes a second \\[keyboard-quit] to abort the minibuffer."
  (interactive)
  (if (and delete-selection-mode transient-mark-mode mark-active)
      (setq deactivate-mark t)
    (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
    (abort-recursive-edit)))

(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

; lal
(show-paren-mode 1)

; fuzzy
;(require 'ido)
;(ido-mode t)

(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)

(global-set-key (kbd "C-p") 'find-file)
(define-key evil-normal-state-map "\C-p" 'find-file)

;(require 'evil-cfg)

; slime
(setq inferior-lisp-program "clisp") 
(setq slime-contribs '(slime-fancy))

; php
;(require 'php-mode)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-mode-hook (quote (turn-on-haskell-indent)))
; '(php-mode-force-pear t)
 '(tab-width 4)
 '(web-mode-code-indent-offset 4))


(defun my-web-mode-hook ()
  "Hooks for Web mode."
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 4)
)

(add-hook 'web-mode-hook  'my-web-mode-hook)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(add-hook 'html-mode-hook
    (lambda ()
      (set (make-local-variable 'sgml-basic-offset) 2)))

;;(require 'multi-mode)
;;(require 'mmm-mode)
;;(setq mmm-global-mode 'maybe)
;;(mmm-add-mode-ext-class nil "\\.php3?\\'" 'html-php)
;;(Mmm-add-classes
;; '((html-php
;;    :submode php-mode
;;    :front "<\\?\\(php\\)?"
;;    :back "\\?>")))
;;(autoload 'php-mode "php-mode" "PHP editing mode" t)
;;(add-to-list 'auto-mode-alist '("\\.php3?\\'" . sgml-html-mode))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
