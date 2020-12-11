(map!
 ;; :m = motion, for movement, equals nvo but only if they aren't already bound
  :nvo "n" #'evil-backward-char
  :nvo "i" #'evil-next-line
  :nvo "o" #'evil-previous-line
  :nvo "h" #'evil-forward-char
  :nvo "k" #'evil-ex-search-next
  :nvo "K" #'evil-ex-search-previous

  :n ";" #'evil-insert
  :n "l" #'evil-open-below
  ;; why was this here?
  ;:n "m" #'evil-open-below
  (:after evil
    (:map evil-window-map
      "C-n"     #'evil-window-left
      "n"     #'evil-window-left
      "C-i"     #'evil-window-down
      "i"     #'evil-window-down
      "C-o"     #'evil-window-up
      "o"     #'evil-window-up
      "C-h"     #'evil-window-right
      "h"     #'evil-window-right)))

(map! :nvi "C-f" #'projectile-find-file
      :nvi "C-b" #'switch-to-buffer)

;(define-key evil-motion-state-map "n" 'evil-backward-char)
;(define-key evil-motion-state-map "i" 'evil-next-line)
;(define-key evil-motion-state-map "o" 'evil-previous-line)
;(define-key evil-motion-state-map "h" 'evil-forward-char)
;(define-key evil-motion-state-map "k" 'evil-ex-search-next)
;(define-key evil-motion-state-map "K" 'evil-ex-search-previous)
;
;(define-key evil-normal-state-map ";" 'evil-insert)
;(define-key evil-normal-state-map "l" 'evil-open-below)
;
;(define-key evil-normal-state-map "i" nil)
;(define-key evil-normal-state-map "o" nil)
;
;(define-key evil-visual-state-map "i" 'evil-next-line)
;(define-key evil-visual-state-map "o" 'evil-previous-line)
;
(setq-default flycheck-disabled-checkers '(python-flake8))
;
(setq mouse-wheel-scroll-amount '(3 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(after! flycheck
  (global-flycheck-mode -1))

(add-hook 'python-mode-hook #'flycheck-mode 'append)
(add-hook 'python-mode-hook #'pipenv-activate)

(autoload 'fennel-mode (expand-file-name "~/.config/doom/fennel-mode") nil t)
(add-to-list 'auto-mode-alist '("\\.fnl\\'" . fennel-mode))

(autoload 'zen-mode (expand-file-name "~/.config/doom/zen-mode") nil t)

(defun disable-sly-in-fennel ()
  (sly-editing-mode -1)
  (sly-mode -1)
;Its value is (sly-complete-filename-maybe sly-complete-symbol)
  (setf completion-at-point-functions '(tags-completion-at-point-function)))

(add-hook 'fennel-mode-hook 'disable-sly-in-fennel)

; wider profiler
(require 'profiler)
(setf (caar profiler-report-cpu-line-format) 80
      (caar profiler-report-memory-line-format) 80)

; don't make loading big php files slow
(add-to-list 'doom-detect-indentation-excluded-modes 'php-mode nil #'eq)

(setq doom-font (font-spec :family "Terminus" :size 17 :weight 'bold))
;      doom-variable-pitch-font (font-spec :family "Fira Sans") ; inherits `doom-font''s :size
;      doom-unicode-font (font-spec :family "Input Mono Narrow" :size 12)
;      doom-big-font (font-spec :family "Fira Mono" :size 19))

(setq doom-theme 'doom-one-light)
;(load-theme 'doom-challenger-deep t)
;(load-theme 'doom-sourcerer t)
;(load-theme 'doom-dracula t)
;(load-theme 'doom-vibrant t)
;(load-theme 'wombat t)

;(custom-set-faces
; '(swiper-minibuffer-match-face-1
;   ((t :background "#ff0000" :foreground "#00ffff")))
; '(swiper-minibuffer-match-face-2
;   ((t :background "#00ff00" :weight bold)))
; '(swiper-minibuffer-match-face-3
;   ((t :background "#0000ff" :weight bold)))
; '(swiper-minibuffer-match-face-4
;   ((t :background "#ff00ff" :weight bold))))

;(custom-set-faces
; ;; custom-set-faces was added by Custom.
; ;; If you edit it by hand, you could mess it up, so be careful.
; ;; Your init file should contain only one such instance.
; ;; If there is more than one, they won't work right.
; '(font-lock-comment-face ((t (:foreground "#22ffaa")))))
