;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Igor Kislitsyn"
      user-mail-address "igor.kislitsyn@health-samurai.io")

(add-load-path! "vendor/")
(setq doom-font (font-spec :family "iosevka" :size 20 ;:antialias="off"
                           ))
(setq doom-variable-pitch-font (font-spec :family "iosevka" :size 20 :antialias="off"))

(setq doom-theme 'doom-challenger-deep)
;(setq doom-theme 'jbeans)
;(setq doom-theme 'jellybeans-plus)

(setq org-directory "~/Documents/org")

(setq display-line-numbers-type t)

(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq initial-frame-alist
      '((top . 30) (left . 15) (width . 150) (height . 38)))

(setq-default delete-by-moving-to-trash t                      ; Delete files to trash
              uniquify-buffer-name-style 'forward              ; Uniquify buffer names
              window-combination-resize t                      ; take new window space from all other windows (not just current)
              ;; x-stretch-cursor t
              )                              ; Stretch cursor to the glyph width

(setq undo-limit 80000000                         ; Raise undo-limit to 80Mb
      evil-want-fine-undo t                       ; By default while in insert all changes are one big blob. Be more granular
      auto-save-default t                         ; Nobody likes to loose work, I certainly don't
      inhibit-compacting-font-caches t            ; When there are lots of glyphs, keep them in memory
      truncate-string-ellipsis "…"
      )

(after! cider
  (setq cider-repl-pop-to-buffer-on-connect nil)
  (set-popup-rule! "^\\*cider*" :size 0.45 :side 'right :select t :quit nil :ttl nil)
  (setq cljr-magic-requires nil)
  (setq cljr-assume-language-context 'clj))

(after! solaire-mode
  (solaire-global-mode -1))

(set-popup-rule! "^\\*help*" :size 0.4 :side 'bottom :select t :quit t)
(set-popup-rule! "^\\*info*" :size 0.7 :side 'bottom :select t :quit t)
(set-popup-rule! "^sql-result*" :size 0.6 :side 'right :select nil :quit nil)
(set-popup-rule! "^\\*Flycheck*" :size 0.3 :side 'bottom :select t :quit t)

(map! (:localleader
       (:map (clojure-mode-map clojurescript-mode-map)
        "=" #'cider-format-defun
        "+" #'clojure-align
        (:prefix ("e" . "eval")
         "f" #'cider-eval-defun-at-point
         "F" #'cider-insert-defun-in-repl
         ";" #'cider-pprint-eval-last-sexp)
        (:prefix ("i")
         "p" #'cider-inspector-pop))
       (:map (sql-mode-map)
        "e" #'run-sql))
      (:leader
       (:map (clojure-mode-map clojurescript-mode-map emacs-lisp-mode-map)
        (:prefix ("k" . "lisp")
         "t" #'sp-transpose-sexp
         "j" #'paredit-join-sexps
         "c" #'paredit-split-sexp
         "s" #'paredit-split-sexp
         "d" #'sp-kill-sexp
         "D" #'paredit-kill
         "<" #'paredit-backward-barf-sexp
         ">" #'paredit-backward-slurp-sexp
         "." #'paredit-forward-slurp-sexp
         "," #'paredit-forward-barf-sexp
         "r" #'paredit-raise-sexp
         "w" #'paredit-wrap-sexp
         "(" #'paredit-wrap-round
         "[" #'paredit-wrap-square
         "'" #'paredit-meta-doublequote
         "{" #'paredit-wrap-curly
         "y" #'sp-copy-sexp)))
      (:after ivy
       :map ivy-minibuffer-map
       "C-d" #'ivy-switch-buffer-kill))


(map! :leader
      ;;; <leader> p --- project
      (:prefix-map ("p" . "project")
       :desc "Add new project"              "A" #'projectile-add-known-project
       :desc "implementation <-> test"      "a" #'projectile-toggle-between-implementation-and-test))

(define-key evil-normal-state-map "x" 'delete-forward-char)     ; delete to the black hole
(define-key evil-normal-state-map "X" 'delete-backward-char)

(define-key evil-normal-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-visual-state-map (kbd "C-a") 'evil-numbers/inc-at-pt)
(define-key evil-normal-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)
(define-key evil-visual-state-map (kbd "C-x") 'evil-numbers/dec-at-pt)

;(global-unset-key (kbd "C-n"))
;(define-key evil-normal-state-map (kbd "C-n d") 'narrow-to-defun)
;(define-key evil-normal-state-map (kbd "C-n p") 'narrow-to-page)
;(define-key evil-normal-state-map (kbd "C-n w") 'widen)

(setq prescient-use-char-folding nil)

;(add-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(add-hook 'doom-first-buffer-hook #'enable-paredit-mode)
(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(defun remove-sp-pairs ()
  (interactive)
  (sp-pair "(" nil :actions :rem)
  (sp-pair "\"" nil :actions :rem)
  (sp-pair "[" nil :actions :rem)
  (sp-pair "{" nil :actions :rem))

(add-hook 'doom-first-buffer-hook 'remove-sp-pairs)

(with-eval-after-load 'evil
    (defalias #'forward-evil-word #'forward-evil-symbol)
    ;; make evil-search-word look for symbol rather than word boundaries
    (setq-default evil-symbol-word-search t))

;(setq lsp-completion-enable nil) ; use cider completion
;(setq lsp-enable-indentation nil)
;(setq lsp-indentation-enable nil)
;(setq lsp-enable-completion-at-point nil)
