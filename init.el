;;; basemental settings
(electric-pair-mode t)
(add-hook 'prog-mode-hook #' show-paren-mode)
(column-number-mode t)
(delete-selection-mode t)
(when(display-graphic-p)(toggle-scroll-bar -1))
(global-display-line-numbers-mode 1)
(tool-bar-mode -1)
(global-set-key (kbd "C-c") 'delete-backward-char)
;;;

;;;file and package load
(add-to-list 'load-path "~/.emacs.d/my_settings")

;;;package source
(require 'package)
(setq package-archives '(("ngu" . "https://mirrors.cloud.tencent.com/elpa/gnu/")
			 ("melpa" . "https://mirrors.cloud.tencent.com/elpa/melpa/")))
(package-initialize)
;;;
  
;;;use-package settings
(eval-when-compile
  (require 'use-package))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(rainbow-delimiters highlight-symbol use-package-hydra hydra counsel flycheck company-box company ivy use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;;;package require
;;(require 'elpa-settings)
(use-package helm-ag)
;;;

;;;hydra settings
(use-package hydra
  :ensure t)
(use-package use-package-hydra
  :ensure t
  :after hydra)
;;;

;;;ivy
(use-package counsel
	    :ensure t)
(use-package ivy
  :ensure t
  :init
  (ivy-mode 1)
  (counsel-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq search-default-mode #' char-fold-to-regexp)
  (setq ivy-count-format "(%d/%d) ")
  :bind
  (("C-s" . 'swiper)
   ("C-x b" . 'ivy-switch-buffer)
   ("C-c v" . 'ivy-push-view)
   ("C-c s" . 'ivy-switch-view)
   ("C-c s" . 'ivy-pop-view)
   ) 
  )
;;;

;;;highlight-symbol
(use-package highlight-symbol
  :ensure t
  :init (highlight-symbol-mode)
  :bind ("<f3>" . highlight-symbol))
;;;

;;;rainbow-delimiters
(use-package rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
;;;

;;;company
(use-package company
  :ensure t
  :init (global-company-mode)
  :config
  (setq company-minimum-prefix-length v1)
  (setq company-tooltip-align-annotations t)
  (setq company-idle-delay 0.0)
  (setq company-show-numbers t)
  (company-selection-warp-around t))
(use-package company-box
  :ensure t
  :if windows-system
  :hook (company-mode . company-box-mode))
;;;

;;;flycheck
(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))
;;;

;;;tiny
(use-package tiny
  :ensure t)
  ;;;

;;;avy
(use-package avy
  :ensure t
  )
;;;

(provide 'init)
