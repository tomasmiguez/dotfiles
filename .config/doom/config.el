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
(setq doom-font (font-spec :family "Iosevka" :size 18 :weight 'semi-light)
      doom-unicode-font (font-spec :family "IosevkaTerm Nerd Font"))
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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

;; set opacity
(add-to-list 'default-frame-alist '(alpha . 97))

(after! projectile
  (setq projectile-project-search-path '("~/repos/")))

(after! org
  (setq org-element-use-cache nil))

(use-package! org-roam
  :config
  (setq org-roam-complete-everywhere t)
  (setq org-roam-capture-templates
   '(("d" "default" plain
      "%?"
      :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
      :unnarrowed t)
   ("b" "book notes" plain
    "\n* Dramatis Personae\n\n%?* Summary\n\n* Notes"
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Book, %^{genre|Fantasy}\n#+author: %^{author}\n")
    :unnarrowed t))))

;; https://www.erichgrunewald.com/posts/setting-up-gmail-in-doom-emacs-using-mbsync-and-mu4e/
;; (after! mu4e
;;         (set-email-account!
;;         "gmail"
;;         '((mu4e-sent-folder       . "/[Gmail]/Sent Mail")
;;         (mu4e-trash-folder      . "/[Gmail]/Bin")
;;         (smtpmail-smtp-user     . "tmiguez@fu.do"))
;;         t))

;; (setq mail-host-address "fu.do"
;;       send-mail-function 'smtpmail-send-it    ; should not be modified
;;       smtpmail-smtp-server "smtp.gmail.com" ; host running SMTP server
;;       smtpmail-smtp-service 587               ; SMTP service port number
;;       smtpmail-stream-type 'starttls)         ; type of SMTP connections to use

(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-smtp-user "tmiguez@fu.do"
      smtpmail-stream-type 'starttls
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587)

(setq smtpmail-debug-info t
      smtpmail-debug-verb t)

;; don't keep message buffers around
;; (setq message-kill-buffer-on-exit t)

(setq
   user-mail-address "tmiguez@fu.do"
   user-full-name  "Tomás Miguez")

;; https://www.djcbsoftware.nl/code/mu/mu4e/Gmail-configuration.html#Gmail-configuration
(after! mu4e
        (setq mu4e-get-mail-command "mbsync gmail"
        ;; use mu4e for e-mail in emacs
        mail-user-agent 'mu4e-user-agent
        ;; don't save message to Sent Messages, Gmail/IMAP takes care of this
        mu4e-sent-messages-behavior 'delete
        ;; get emails and index every 2 minutes
        mu4e-update-interval 120
        ;; send emails with format=flowed
        mu4e-compose-format-flowed t
        ;; no need to run cleanup after indexing for gmail
        mu4e-index-cleanup nil
        mu4e-index-lazy-check t
        ;; more sensible date format
        mu4e-headers-date-format "%y.%m.%d"
        mu4e-sent-folder "/[Gmail]/Sent Mail"
        mu4e-trash-folder "/[Gmail]/Bin"
        ;; Custom bookmarks
        mu4e-bookmarks
        '((:name "Unread messages"
           :query "flag:unread AND NOT flag:trashed AND maildir:/Inbox"
           :key ?u)
          (:name "Inbox"
           :query "NOT flag:trashed AND maildir:/Inbox"
           :key ?i)))
        ;; setup some handy shortcuts
        ;; you can quickly switch to your Inbox -- press ``ji''
        ;; then, when you want archive some messages, move them to
        ;; the 'All Mail' folder by pressing ``ma''.
        mu4e-maildir-shortcuts
        '((:maildir "/INBOX"              :key ?i)
          (:maildir "/[gmail].sent mail"  :key ?s)
          (:maildir "/[gmail].trash"      :key ?t)
          (:maildir "/[gmail].all mail"   :key ?a)))

;; https://github.com/doomemacs/doomemacs/issues/4820
(with-eval-after-load "mm-decode"
  (add-to-list 'mm-discouraged-alternatives "text/html")
  (add-to-list 'mm-discouraged-alternatives "text/richtext"))

