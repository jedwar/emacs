
(setq gc-cons-threshold (* 100 1024 1024))
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message t)
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'org-mode)
(setq-default indent-tabs-mode nil)

(setq-default display-line-numbers-widen t)
(global-display-line-numbers-mode t)

(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)

(column-number-mode t)
(line-number-mode t)

(setq pop-up-windows nil)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(tooltip-mode -1)
;;(set-fringe-mode 10)
(menu-bar-mode -1)

(setq visible-bell t)
(setq ring-bell-function 'ignore)
(setq-default line-spacing 2)

(show-paren-mode t)

;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 280)
(set-face-attribute 'default nil :font "Menlo" :height 150)

;;(load-theme 'tango-dark)
(load-theme 'wombat)

;;(use-package nord-theme
;;  :config
;;  (load-theme 'nord t))

(use-package org)

;;(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(setq org-directory "~/.org/")
(setq org-default-notes-file (concat org-directory "/notes.org"))

(global-set-key (kbd "C-c l") 'org-store-link)
(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)



(use-package magit
  :bind
  ("C-x g" . magit-status)
  ("s-g" . magit-status))




(setq auto-save-default nil)
(auto-save-visited-mode +1)

(cua-mode)
 
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
;;(global-set-key (kbd "C-M-j" 'counsel-switch-buffer)
		
(setq use-package-always-ensure t)
(setq read-process-output-max (* 1024 1024)) ;; 1mb

(require 'package)

(setq package-archives '
      (("melpa" . "https://melpa.org/packages/")
       ("org" . "https://orgmode.org/elpa/")
       ("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

(use-package command-log-mode)

(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package general)

(general-define-key
"C-M-j" 'counsel-switch-buffer)

(use-package ivy
  :defer 0.1
  :diminish
;;  :bind (("C-s" . swiper)
;;	 :map ivy-minibuffer-map
;;	 ("TAB" . ivy-alt-done)
;;	 ("C-l" . ivy-alt-done)
;;	 ("C-j" . ivy-next-line)
;;	 ("C-k" . ivy-previous-line)
;;	 :map ivy-switch-buffer-map
;;	 ("C-k" . ivy-previous-line)
;;	 ("C-l" . ivy-done)
;;	 ("C-d" . ivy-switch-buffer-kill)
;;	 :map ivy-reverse-i-search-map
;;	 ("C-k" . ivy-previous-line)
;;	 ("C-d" . ivy-reverse-i-search-kill))
  :custom
  (ivy-count-format "(%d/%d) ")
  (ivy-use-virtual-buffers t)
  :config (ivy-mode 1))

(use-package ivy-rich
  :after ivy
  :init
  (setq ivy-rich-path-style 'abbrev)
  (setq ivy-virtual-abbreviate 'full)
  :config (ivy-rich-mode 1))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
	 ("C-r" . swiper)))

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :custom (doom-modeline-height 15))

(use-package plantuml-mode
  :ensure t
  :mode "\\.plu\\'"
  :custom
  (plantuml-jar-path "/usr/local/Cellar/plantuml/1.2021.0/libexec/plantuml.jar")
  (plantuml-dafult-exec-mode 'jar)
  )

(use-package yasnippet
  :hook (after-init . yas-global-mode)
  )
(use-package yasnippet-snippets)

(use-package company
  :hook
  (after-init . global-company-mode)
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-idle-delay 0.0) ;; default is 0.2
)


;; LSP CONFIGURATION
(use-package lsp-mode
	:hook
	(lsp-mode . lsp-enable-which-key-integration)
        :config
        (add-hook 'c-mode-hook #'lsp)
        (add-hook 'cpp-mode-hook #'lsp)
	(add-hook 'latex-mode-hook #'lsp)
	(setq lsp-modeline-diagnostics-enable t)
    ;; Performance tweaks, see
    ;; https://github.com/emacs-lsp/lsp-mode#performance
        (setq lsp-idle-delay 0.1)
        (setq lsp-headerline-breadcrumb-enable t)
        (setq lsp-completion-provider :capf)
)
(use-package lsp-java
  :config
  (add-hook 'java-mode-hook #'lsp))
  
(use-package lsp-ui
:config
(setq lsp-ui-doc-enable nil)
)

(use-package org-tree-slide
  :custom
  (org-image-actual-width nil))

(defvar writer-startup-message
  "
                           *Welcome to Emacs*
   Emacs is the most powerful text editor on the planet. While you
   should be able to start working with Emacs as-is, any effort you
   put into mastering its functions will reward you handsomely. Try
   to get familiar with the *Essential Commands* first, and move on
       to the *Other Commands* once you've got the hang of it.
			    *Quick Links*
[[elisp:find-file][Create a new file]]        [[elisp:find-file-existing][Open an existing file]]        [[elisp:scratchpad][Open a scratchpad]]
*Essential Commands*                             /C: Control, M: alt, S: ⌘/
  Save ........... =[C-x]= =[C-s]=    Help ..................... =[C-h]=
  Save as ........ =[C-x]= =[C-w]=    Cancel ................... =[C-g]=
  Open new file .. =[C-x]= =[C-f]=    Undo ..................... =[C-z]=
  Quit ........... =[C-x]= =[C-c]=    Undo (alternate) ......... =[C-/]=
*Other Commands*                                     /[[info:emacs#Key%2520Bindings][ Other key bindings ]]/
  Search ................. =[C-s]=    Go to line ......... =[M-g]= =[M-g]=
  Replace ................ =[M-%]=    Execute command ............ =[M-x]=
  
  Start of buffer ........ =[M-<]=    End of buffer .............. =[M->]=
  Start of line .......... =[C-a]=    End of line ................ =[C-e]=
  Mark ................. =[C-spc]=    Copy from mark.............. =[M-w]=
  Kill from mark.......... =[C-w]=    Kill from cursor............ =[C-k]=
  Paste .................. =[C-y]=    Paste older ........ =[C-y]= =[M-y]=
*Quick Preferences Settings*                         /[[elisp:(customize-group 'emacs)][ Full preferences ]]/
 [[elisp:menu-set-font][ Select ]]default font                [[elisp:display-line-numbers-mode][ Toggle ]]line numbers
 [[elisp:tool-bar-mode][ Toggle ]]tool bar                    [[elisp:toggle-truncate-lines][ Toggle ]]line wrap
 [[elisp:scroll-bar-mode][ Toggle ]]scroll bar                  [[elisp:blink-cursor-mode][ Toggle ]]blinking cursor
 [[elisp:menu-bar-mode][ Toggle ]]menu bar                     Select cursor:[[elisp:(set-default 'cursor-type  '(hbar . 2))][ HBar ]]|[[elisp:(set-default 'cursor-type  '(bar . 2))][ VBar ]]|[[elisp:(set-default 'cursor-type 'box)][ Box ]]
")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(global-command-log-mode nil)
 '(ivy-mode t)
 '(package-selected-packages
   '(magit nord-theme general org-tree-slide company yasnippet-snippets yasnippet lsp-ui lsp-java lsp-mode plantuml plantuml-mode ivy-rich counsel doom-modeline ivy command-log-mode use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
