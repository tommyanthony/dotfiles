;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; Rebind keys for kinesis.
(setq mac-command-modifier 'control)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
(load! "util.el")
(load! "python.el")

(after! evil
  (setq-default evil-kill-on-visual-paste nil))
(setq doom-localleader-key ",")

;; Compilation buffer wrap lines.
(defun my-compilation-mode-hook ()
  (setq truncate-lines nil) ;; automatically becomes buffer local
  (set (make-local-variable 'truncate-partial-width-windows) nil))
(add-hook 'compilation-mode-hook 'my-compilation-mode-hook)

(after! evil (map!
              :map 'evil-normal-state-map
              (:leader
               :nv "0" #'winum-select-window-0-or-10
               :nv "1" #'winum-select-window-1
               :nv "2" #'winum-select-window-2
               :nv "3" #'winum-select-window-3
               :nv "4" #'winum-select-window-4
               :nv "5" #'winum-select-window-5
               :nv "6" #'winum-select-window-6
               :nv "7" #'winum-select-window-7
               :nv "8" #'winum-select-window-8
               :nv "9" #'winum-select-window-9
               :nv "SPC" #'execute-extended-command
               (:prefix-map ("b" . "buffer")
                :desc "Move buffer to window 1" :nv "1" (lambda () (interactive) (move-buffer-to-window 1))
                :desc "Move buffer to window 2" :nv "2" (lambda () (interactive) (move-buffer-to-window 2))
                :desc "Move buffer to window 3" :nv "3" (lambda () (interactive) (move-buffer-to-window 3))
                :desc "Move buffer to window 4" :nv "4" (lambda () (interactive) (move-buffer-to-window 4))
                :desc "Move buffer to window 5" :nv "5" (lambda () (interactive) (move-buffer-to-window 5))
                :desc "Move buffer to window 6" :nv "6" (lambda () (interactive) (move-buffer-to-window 6))
                :desc "Move buffer to window 7" :nv "7" (lambda () (interactive) (move-buffer-to-window 7))
                :desc "Move buffer to window 8" :nv "8" (lambda () (interactive) (move-buffer-to-window 8))
                :desc "Move buffer to window 9" :nv "9" (lambda () (interactive) (move-buffer-to-window 9)))
               :nv "cl" #'comment-line

               :nv "fy" #'+default/yank-buffer-path-relative-to-project
               :nv "fn" #'copy-file-name
               :nv "ck" #'kill-compilation
               :nv "cn" #'next-error
               :nv "cr" #'recompile
               :nv "cp" #'previous-error
               :nv "rl" #'vertico-repeat
               :nv "TAB" #'alternate-buffer
               :nv "dn" #'smerge-next
               :nv "dp" #'smerge-prev
               :nv "dku" #'smerge-keep-upper
               :nv "dkl" #'smerge-keep-lower
               :nv "dkb" #'smerge-keep-base
               :nv "dkc" #'smerge-keep-current
               :nv "dka" #'smerge-keep-all
               :nv "dbu" #'smerge-diff-base-upper
               :nv "dbl" #'smerge-diff-base-lower
               :nv "dul" #'smerge-diff-upper-lower
               )))

;; Let alternate buffer show temporary buffers.
(after! persp-mode
  (remove-hook 'persp-add-buffer-on-after-change-major-mode-filter-functions #'doom-unreal-buffer-p))

(after! evil
  (defalias #'forward-evil-word #'forward-evil-symbol)
  ;; make evil-search-word look for symbol rather than word boundaries
  (setq-default evil-symbol-word-search t))

(use-package! company :config (define-key company-active-map (kbd "RET") 'company-complete-selection))

(defun my-autoload-venv ()
  (message (format "file: %s exists: %s" (concat (projectile-project-root) "venv/") (file-exists-p (concat (projectile-project-root) "venv/"))))
  (if (file-exists-p (concat (projectile-project-root) "venv/"))
      (pyvenv-activate (concat (projectile-project-root) "venv/")) ())
  )

(defun my-init-projectile ()
  (my-autoload-venv)
  (add-hook 'projectile-after-switch-project-hook #'my-autoload-venv))

(use-package! projectile :defer t :config  (my-init-projectile))

(global-auto-revert-mode)

;; q closes transient buffers
(after! transient (transient-bind-q-to-quit))
(setq doom-modeline-buffer-file-name-style 'file-name)

(after! evil (map!
              (:localleader
               :nv "gg" #'xref-find-definitions
               :nv "gG" #'xref-find-definitions-other-window
               :nv "gr" #'xref-find-references
               :nv "gb" #'xref-pop-marker-stack
               :nv "gf" #'xref-go-forward
               :nv "hh" #'eldoc-print-current-symbol-info
               :nv "en" #'flycheck-next-error
               :nv "ep" #'flycheck-previous-error
               :nv "ec" #'eglot-code-actions
               )
              ))
