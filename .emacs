(setq load-path (cons "/usr/home/axs/elisp" load-path))
;;(require 'ibs)
(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.6.6.4/emacs"
                       load-path))
(setq erlang-root-dir "/usr/local/otp")
(setq exec-path (cons "/usr/local/otp/bin" exec-path))
(require 'erlang-start)

(require 'cycle-buffer)
(autoload 'cycle-buffer "cycle-buffer" "Cycle forward." t)
(autoload 'cycle-buffer-backward "cycle-buffer" "Cycle backward." t)
(autoload 'cycle-buffer-permissive "cycle-buffer" "Cycle forward allowing *buffers*." t)
(autoload 'cycle-buffer-backward-permissive "cycle-buffer" "Cycle backward allowing *buffers*." t)
(autoload 'cycle-buffer-toggle-interesting "cycle-buffer" "Toggle if this buffer will be considered." t)
;;the man page for the library call at the current cursor position.
(global-set-key  "\M-m" ( lambda () (interactive) (manual-entry(current-word))))
(global-set-key [f11]       'cycle-buffer-backward)
(global-set-key [f12]       'cycle-buffer)
(global-set-key [shift f11]  'cycle-buffer-backward-permissive)
(global-set-key [shift f12] 'cycle-buffer-permissive)
;;
;; highlight marked  area
(setq transient-mark-mode 't)
;; Enable wheelmouse support by default
(cond (window-system
       (mwheel-install)
))

;;never use tabs
(setq-default indent-tabs-mode nil)


;; Useful key strokes
(global-set-key "\C-z" 'undo)
(global-set-key [f1] 'help)
(global-set-key [f2] 'other-window)
(global-set-key [f3] 'kill-buffer)
(setq diff-switches "-u -b")
(global-set-key [f4] 'diff)
(global-set-key [f5] 'ediff-buffers)
(global-set-key [f6] 'query-replace)
(global-set-key [f7] 'find-file)
(global-set-key [f8] 'switch-to-buffer)
(global-set-key [f9] 'list-buffers)
(global-set-key [f10] 'compile)
(global-set-key [home] 'beginning-of-line)
(global-set-key [end] 'end-of-line)
(global-set-key "\C-v" 'yank)
;;
(defun my-perl-indent-setup ()
  (setq-default tab-width 4)
  (setq cperl-indent-level 4)
)
(add-hook 'cperl-mode-hook 'my-perl-indent-setup)
;;tab
(setq-default tab-width 4)
;;turn off jumpy scroll
(setq-default scroll-step 1)
;; expands for keywords such as foreach, while, etc...
(setq cperl-electric-keywords t)
;;(setq cperl-electric-parens t)
;;(setq cperl-electric-lbrace-space t)
(setq cperl-lazy-help-time 3)
(setq cperl-help t)
;; Use cperl-mode instead of the default perl-mode
(add-to-list 'auto-mode-alist '("\\.\\([pP][Llm]\\|al\\|t\\)\\'" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("perl5" . cperl-mode))
(add-to-list 'interpreter-mode-alist '("miniperl" . cperl-mode))
;;
;;perldoc documentation
(global-set-key "\M-p" (lambda () (interactive) (cperl-perldoc (current-word))))
(global-set-key "\M-c" 'cperl-comment-region)
(global-set-key "\M-u" 'cperl-uncomment-region)
(global-set-key "\M-j" 'goto-line)
(global-set-key "\C-f" 'isearch-forward)
(global-set-key "\C-s" 'save-buffer)
(global-set-key "\M-r" 'replace-regexp)
(global-set-key "\M-f" 'isearch-forward-regexp)

;; whitespace
(whitespace-global-mode t)
(setq whitespace-auto-cleanup t)
(setq whitespace-silent t)
(add-hook 'write-file-hooks 'whitespace-write-file-hook)

;;;;to set foreground color to white
;;(set-foreground-color "snow")

;;;;to set background color to black
;;(set-background-color "gray32")

;;python stuff
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
				   interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)



;;ruby
(add-to-list 'load-path "/home/axs/elisp/ruby-mode")
(autoload 'ruby-mode "ruby-mode" "Major mode for ruby files" t)
(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))
(add-to-list 'interpreter-mode-alist '("ruby" . ruby-mode))
(add-hook 'ruby-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion
                           (untabify (point-min) (point-max))
                           (delete-trailing-whitespace)
                           )))
            (set (make-local-variable 'indent-tabs-mode) 'nil)
            (set (make-local-variable 'tab-width) 2)
            (imenu-add-to-menubar "IMENU")
            (define-key ruby-mode-map "C-m" 'newline-and-indent) ;Not sure if this line is 100% right but it works!
            (require 'ruby-electric)
            (ruby-electric-mode t)
            ))


(custom-set-variables

;; custom-set-variables was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
'(case-fold-search t)
'(current-language-environment "ASCII")
'(global-font-lock-mode t nil (font-lock))
'(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom -- don't edit or cut/paste it!
  ;; Your init file should contain only one such instance.
)

(require 'color-theme)
;;(color-theme-initialize)
(color-theme-arjen)
