(evil-mode)

(defun nmap(keys function)
  (define-key evil-normal-state-map (kbd keys) function)
  )

(defun local-nmap(keys function)
  (define-key evil-normal-state-local-map (kbd keys) function)
  )

(defun imap(keys function)
  (define-key evil-insert-state-map (kbd keys) function)
  )

(defun vmap(keys function)
  (define-key evil-visual-state-map (kbd keys) function)
  )

(defun rmap(keys function)
  (define-key evil-replace-state-map (kbd keys) functions)
  )

(tool-bar-mode -1) ;; Disable toolbar
(menu-bar-mode -1) ;; Disable Menu

(global-display-line-numbers-mode) ;; Enable line numbers
(setq global-display-line-numbers 'relative) ;; :( Enable relative numbers
(global-hl-line-mode t) ;; Enable Highlighted current line

(setq company-minimum-prefix-length 1
      company-idle-delay 0.0)
(add-hook 'after-init-hook 'global-company-mode)

(add-hook 'rust-mode-hook 'eglot-ensure)
(add-hook 'java-mode-hook 'eglot-ensure)
(nmap "åeg" 'xref-find-definitions)
(nmap "åeh" 'eglot-help-at-point)
(nmap "åer" 'eglot-rename)

(setq inhibit-startup-message t) ;; Disable start message
(setq vc-follow-symlinks t) ;; Automaticly follow symlinks
(setq scroll-conservatively 100) ;; Scroll line for line
(setq ring-bell-function 'ignore) ;; Disable bell sound
(global-prettify-symbols-mode t) ;; Enable icons
(setq make-backup-file nil) ;; Disable backup files
(setq auto-save-default nil) ;; Disable auto save
