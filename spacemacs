;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
	 haskell
	 vimscript
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     helm
     ;; auto-completion
     ;; better-defaults
     emacs-lisp
     git
     markdown
     lua
     org
     python
     html
     php
     c-c++
     csharp
     java
     latex
     nim
     rust
     scheme
     sql
     common-lisp
     yaml
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     ;; version-control
     ;;themes-megapack
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages
   '(
	 color-theme-sanityinc-tomorrow
	 hlinum
	 )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '( my-wombat
                         sanityinc-tomorrow-night
                         ;;sanityinc-tomorrow-day)
                          )
              ;;           spacemacs-dark
              ;;           spacemacs-light
              ;;           solarized-light
              ;;           solarized-dark
              ;;           leuven
              ;;           monokai
              ;;           zenburn)
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("xos4 Terminus"
                               :size 14
                               :weight normal
                               :width normal
                               :powerline-scale 1.2)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header t
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
 ;; (load-file "~/.emacs.d/private/my-wombat-theme.el")
  (add-to-list 'custom-theme-load-path "~/.emacs.d/private/")
  ;; todo wtf is this
  (setq exec-path-from-shell-check-startup-files nil)
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (setq powerline-default-separator 'arrow-fade)
  ;(spaceline-compile)
  (add-hook 'prog-mode-hook #'linum-mode)
  ;;(fringe-mode '(5 . 15))

  ;;(spacemacs/toggle-highlight-current-line-globally-off)
  (show-smartparens-global-mode -1)
  (hlinum-activate)

  (define-key evil-normal-state-map [return]
	(lambda () (interactive) (progn
							   (evil-ex-nohighlight)
							   (evil-ret))))

  (define-key spacemacs-buffer-mode-map "h" 'evil-forward-char)
  (define-key spacemacs-buffer-mode-map "n" 'evil-backward-char)
  (define-key spacemacs-buffer-mode-map "o" 'evil-previous-line)
  (define-key spacemacs-buffer-mode-map "i" 'evil-next-line)

  (define-key evil-normal-state-map "n" 'evil-backward-char)
  (define-key evil-normal-state-map "i" 'evil-next-line)
  (define-key evil-normal-state-map "o" 'evil-previous-line)
  (define-key evil-normal-state-map "h" 'evil-forward-char)
  (define-key evil-normal-state-map ";" 'evil-insert)
  (define-key evil-normal-state-map "l" 'evil-open-below)
  (define-key evil-normal-state-map "k" 'evil-ex-search-next)
  (define-key evil-normal-state-map "K" 'evil-ex-search-previous)

  (define-key evil-normal-state-map "/" 'evil-ex-search-forward)
  (define-key evil-visual-state-map "/" 'evil-ex-search-forward)

  (evil-define-key 'normal evil-org-mode-map
    "o" 'evil-previous-line
    "O" '(lambda () (interactive) (evil-org-eol-call 'org-meta-return))
    ;"O" 'org-meta-return
    "l" '(lambda () (interactive) (evil-org-eol-call 'clever-insert-item))
    "gn" 'outline-up-heading
    "gi" (if (fboundp 'org-forward-same-level) ;to be backward compatible with older org version
             'org-forward-same-level
           'org-forward-heading-same-level)
    "go" (if (fboundp 'org-backward-same-level)
             'org-backward-same-level
           'org-backward-heading-same-level)
    "gh" 'outline-next-visible-heading
    "J" 'evil-join
    )
;  (define-key evil-org-mode-map "h" 'evil-forward-char)
;  (define-key evil-org-mode-map "n" 'evil-backward-char)
;  (define-key evil-org-mode-map "o" 'evil-previous-line)
;  (define-key evil-org-mode-map "i" 'evil-next-line)
;  (define-key evil-org-mode-map ";" 'evil-insert)
;  (define-key evil-org-mode-map "l" 'evil-open-below)
;  (define-key evil-org-mode-map "k" 'evil-search-next)
;  (define-key evil-org-mode-map "K" 'evil-search-previous)


;  noremap n h
;  noremap i j
;  noremap o k
;  noremap h l
;  noremap l o
;  noremap ; i
;  noremap k n
;  noremap K N

  (define-key evil-motion-state-map "n" 'evil-backward-char)
  (define-key evil-motion-state-map "i" 'evil-next-line)
  (define-key evil-motion-state-map "o" 'evil-previous-line)
  (define-key evil-motion-state-map "h" 'evil-forward-char)
  (define-key evil-motion-state-map ";" 'evil-insert)
  (define-key evil-motion-state-map "k" 'evil-ex-search-next)
  (define-key evil-motion-state-map "K" 'evil-ex-search-previous)

  (define-key evil-visual-state-map "i" 'evil-next-line)
  (define-key evil-visual-state-map "o" 'evil-previous-line)

  (define-key evil-window-map "h" 'windmove-right)
  (define-key evil-window-map "n" 'windmove-left)
  (define-key evil-window-map "o" 'windmove-up)
  (define-key evil-window-map "i" 'windmove-down)

  (define-key evil-normal-state-map (kbd "C-p") 'helm-projectile-find-file)
  ;;(evil-define-key 'normal prog-mode-map
  ;;  (kbd "C-p") 'helm-projectile-find-file)
  ;;(add-hook 'prog-mode-hook (lambda ()
  ;;          (define-key evil-normal-state-map (kbd "C-p")
  ;;            'helm-projectile-find-file)))

  (require 'smartparens)
  (sp-pair "'" nil :actions :rem)
  (sp-pair "\"" nil :actions :rem)
  ;(add-hook 'python-mode-hook
  ;          'turn-off-smartparens-mode)

  (setq inferior-lisp-program "sbcl")

  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

  (setq org-export-backends '(beamer html latex md gfm))

;;  (setq projectile-tags-command "ctags --exclude=periphlib --exclude=build -Re -f \"%s\" %s")
  (setq-default c-basic-offset 4
                tab-width 4
                indent-tabs-mode t)

  (setq evil-search-module 'evil-search)

  ;; 1. hook flyspell into org-mode
  (add-hook 'org-mode-hook 'flyspell-mode)
  (add-hook 'org-mode-hook 'flyspell-buffer)

  ;; 2. ignore message flags
  (setq flyspell-issue-message-flag nil)

  ;; 3. ignore tex commands
  (add-hook 'org-mode-hook (lambda () (setq ispell-parser 'tex)))
  (defun flyspell-ignore-tex ()
	(interactive)
	(set (make-variable-buffer-local 'ispell-parser) 'tex))
  (add-hook 'org-mode-hook 'flyspell-ignore-tex)

  ;; font
  dotspacemacs-default-font '("terminus"
							  :size 14
							  :weight normal
							  :width normal
							  :powerline-scale 1.0)
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(custom-safe-themes
   (quote
    ("cd9b3aacc978a56c806e9440ee8d5a218b80b25f0f0921f60b91ca45ccaf161c" "75b24c84a493cc3e7020dc26bc53d4365a8fdc53de5bf513eb3be2b2fa3e817e" "815474adb35500791b25db745918e60b3fe14352d81b992dba9ab46d476ebe66" "4e31266a5f721d734b9a0340a691065af39e2cf7ca4e48bcd0e269db10e7bae9" "a8f5dc4c7897ed51e954a4a3a929f11653fa924cadd06af91b5e2eca949ffbfd" "86ed5d5a1cfc675b4044bea0ddd8467205c1445679e188016d6562109629af7f" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "73a2f0be1e371265d9f02259b80c3597c2dd2aab7955c2e8f4fc6eb80496f67e" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(org-file-apps
   (quote
    ((auto-mode . emacs)
     ("\\.mm\\'" . default)
     ("\\.x?html?\\'" . default)
     ("\\.pdf\\'" . "zathura %s"))))
 '(package-selected-packages
   (quote
    (org-mime intero hlint-refactor hindent helm-hoogle haskell-snippets flycheck-haskell company-ghci company-ghc ghc haskell-mode cmm-mode helm-gitignore gitignore-mode org-category-capture ctable dash-functional goto-chg vimrc-mode dactyl-mode winum spinner log4e shut-up concurrent deferred diminish bind-key packed bind-map haml-mode powerline org alert auto-complete markdown-mode hydra seq magit magit-popup git-commit with-editor iedit csharp-mode auctex rust-mode highlight anzu smartparens evil undo-tree flycheck request helm helm-core popup avy async projectile yasnippet php-mode f company macrostep dash s yapfify uuidgen slime-company py-isort pug-mode org-projectile pcache org-download live-py-mode link-hint hide-comnt git-link eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eclim dumb-jump column-enforce-mode cargo yaml-mode ws-butler window-numbering which-key web-mode volatile-highlights vi-tilde-fringe use-package toml-mode toc-org tagedit sql-indent spacemacs-theme spaceline smooth-scrolling smeargle slime slim-mode scss-mode sass-mode restart-emacs rainbow-delimiters racer quelpa pyvenv pytest pyenv-mode py-yapf popwin pip-requirements phpunit phpcbf php-extras php-auto-yasnippets persp-mode pcre2el paradox page-break-lines orgit org-repo-todo org-present org-pomodoro org-plus-contrib org-bullets open-junk-file omnisharp nim-mode neotree move-text mmm-mode markdown-toc magit-gitflow lua-mode lorem-ipsum linum-relative leuven-theme less-css-mode jade-mode info+ indent-guide ido-vertical-mode hy-mode hungry-delete htmlize hlinum hl-todo highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-pydoc helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-css-scss helm-ag google-translate golden-ratio gnuplot gitconfig-mode gitattributes-mode git-timemachine git-messenger gh-md geiser flycheck-rust flycheck-pos-tip flycheck-nim flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-magit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu emmet-mode emacs-eclim elisp-slime-nav drupal-mode disaster define-word cython-mode color-theme-sanityinc-tomorrow cmake-mode clean-aindent-mode clang-format buffer-move bracketed-paste auto-highlight-symbol auto-compile auctex-latexmk anaconda-mode aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(safe-local-variable-values
   (quote
    ((eval
      (setq-default c-basic-offset 4 tab-width 4 indent-tabs-mode t))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Terminus" :foundry "xos4" :slant normal :weight normal :height 105 :width normal)))))
