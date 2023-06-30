(org-babel-load-file
	(expand-file-name
		"config.org"
		user-emacs-directory))

; ;; Initialize package sources
; (require 'package)

; (setq package-archives '(("melpa" . "https://melpa.org/packages/")
;                          ("org" . "https://orgmode.org/elpa/")
;                          ("elpa" . "https://elpa.gnu.org/packages/")))

; (package-initialize)
; (unless package-archive-contents
;  (package-refresh-contents))

; ;; Initialize use-package on non-Linux platforms
; (unless (package-installed-p 'use-package)
;    (package-install 'use-package))

; (require 'use-package)
; (setq use-package-always-ensure t)

; (use-package command-log-mode)

; (use-package ivy
;   :diminish
;   :bind (("C-s" . swiper)
;          :map ivy-minibuffer-map
;          ("TAB" . ivy-alt-done)	
;          ("C-l" . ivy-alt-done)
;          ("C-j" . ivy-next-line)
;          ("C-k" . ivy-previous-line)
;          :map ivy-switch-buffer-map
;          ("C-k" . ivy-previous-line)
;          ("C-l" . ivy-done)
;          ("C-d" . ivy-switch-buffer-kill)
;          :map ivy-reverse-i-search-map
;          ("C-k" . ivy-previous-line)
;          ("C-d" . ivy-reverse-i-search-kill))
;   :config
;   (ivy-mode 1))

; (use-package doom-modeline
;   :ensure t
;   :init (doom-modeline-mode 1)
;   :custom ((doom-modeline-height 15)))

; (column-number-mode)
; (global-display-line-numbers-mode t)

; ;; Disable line numbers for some modes
; (dolist (mode '(org-mode-hook
;                 term-mode-hook
;                 eshell-mode-hook))
;   (add-hook mode (lambda () (display-line-numbers-mode 0))))


; ;; rainbow-delimiters
; (use-package rainbow-delimiters
;   :hook (prog-mode . rainbow-delimiters-mode))


; ;; which-key
; (use-package which-key
;   :init (which-key-mode)
;   :diminish which-key-mode
;   :config
;   (setq which-key-idle-delay 0.3))


; ;; ivy-rich
; (use-package ivy-rich
;   :init
;   (ivy-rich-mode 1)
;   :config
;   (setq ivy-format-function #'ivy-format-function-line)
;   (setq ivy-rich--display-transformers-list
;         (plist-put ivy-rich--display-transformers-list
;                    'ivy-switch-buffer
;                    '(:columns
;                      ((ivy-rich-candidate (:width 40))
;                       (ivy-rich-switch-buffer-indicators (:width 4 :face error :align right)); return the buffer indicators
;                       (ivy-rich-switch-buffer-major-mode (:width 12 :face warning))          ; return the major mode info
;                       (ivy-rich-switch-buffer-project (:width 15 :face success))             ; return project name using `projectile'
;                       (ivy-rich-switch-buffer-path (:width (lambda (x) (ivy-rich-switch-buffer-shorten-path x (ivy-rich-minibuffer-width 0.3))))))  ; return file path relative to project root or `default-directory' if project is nil
;                      :predicate
;                      (lambda (cand)
;                        (if-let ((buffer (get-buffer cand)))
;                            ;; Don't mess with EXWM buffers
;                            (with-current-buffer buffer
;                              (not (derived-mode-p 'exwm-mode)))))))))

; (custom-set-variables
;  ;; custom-set-variables was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  '(package-selected-packages
;    '(which-key use-package rainbow-delimiters ivy-rich doom-modeline command-log-mode)))
; (custom-set-faces
;  ;; custom-set-faces was added by Custom.
;  ;; If you edit it by hand, you could mess it up, so be careful.
;  ;; Your init file should contain only one such instance.
;  ;; If there is more than one, they won't work right.
;  )
