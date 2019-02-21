;; .emacs --- Emacs configuration

;; --------------------------------------
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
  '(;;auctex
    ;;auto-complete-auctex
    better-defaults
    ;;elpy
    ;;flycheck
    highlight-indentation
    ;;material-theme
    rainbow-delimiters
    ))

(mapc #'(lambda (package)
    (unless (package-installed-p package)
      (package-install package)))
      myPackages)

;; --------------------------------------
;; BASIC CUSTOMIZATION
;; --------------------------------------

(setq inhibit-startup-message t) ;; hide the startup message
(global-linum-mode t) ;; enable line numbers globally
(setq linum-format "%4d \u2502 ")
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; --------------------------------------
;; THEME
;; --------------------------------------

;;(load-theme 'material t) ;; load material theme
;;(load-theme 'monokai t) ;; load monokai theme
(load-theme 'atom-one-dark t) ;; load atom dark theme

;; --------------------------------------
;; PYTHON CONFIGURATION
;; --------------------------------------

;;(elpy-enable)

;; use flycheck not flymake with elpy
;;(when (require 'flycheck nil t)
;;  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
;;  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; .emacs ends here

