
;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(require 'package)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")

(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(require 'ido)
(ido-mode t)
(show-paren-mode 1)
(global-visual-line-mode 1)

(package-initialize)
(when (not package-archive-contents)
  (package-refresh-contents))

(defvar myPackages
  '(auctex
    ;;auto-complete-auctex
    better-defaults
    elpy
    company
    find-file-in-project
    flycheck
    dash
    highlight-indentation
    ivy
    ;;jedi
    ;;auto-complete
    ;;jedi-core
    epc
    ctable
    concurrent
    julia-mode
    julia-repl
    material-theme
    pkg-info
    epl
    popup
    py-autopep8
    python-environment
    deferred
    pyvenv
    rainbow-delimiters
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message

;; (CHOOSE THEME)
;;(load-theme 'material t) ;; load material theme
(load-theme 'monokai t) ;; load monokai theme

(global-linum-mode t) ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; PYTHON CONFIGURATION
;; --------------------------------------
;; Standard Jedi.el setting
;;(add-hook 'python-mode-hook 'jedi:setup)
;;(setq jedi:complete-on-dot t)
;;(autoload 'jedi:setup "jedi" nil t)

  ;;(add-hook 'python-mode-hook
	;;    (lambda ()
	;;	    (setq-default indent-tabs-mode t)
	;;	    (setq-default tab-width 4)
	;;	    (setq-default py-indent-tabs-mode t)
	;;	    (tabify (point-min) (point-max))))

;(elpy-enable)


;; use flycheck not flymake with elpy
;(when (require 'flycheck nil t)
;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
;(require 'py-autopep8)
;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

;(add-hook 'python-mode-hook 'guess-style-guess-tabs-mode)
;   (add-hook 'python-mode-hook (lambda ()
;                                    (guess-style-guess-tab-width)))


;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (auto-complete-auctex jedi julia-repl julia-mode better-defaults py-autopep8 material-theme flycheck elpy auctex)))
 '(python-shell-interpreter "python3"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
