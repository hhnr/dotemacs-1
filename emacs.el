
(require 'package)
(setq package-archives
      '(("org" . "http://orgmode.org/elpa/")
        ("marmalade" . "http://marmalade-repo.org/packages/")
        ("gnu"  . "http://elpa.gnu.org/packages/")
        ;; ("SC"   . "http://joseito.republika.pl/sunrise-commander/")
        ;; ("ELPA" . "http://tromey.com/elpa/")
        ))

(package-initialize)

;; (prefer-coding-system 'utf-8)
;; (set-default-coding-systems 'utf-8)
;; (set-charset-priority 'unicode)
;; (setq default-process-coding-system '(utf-8-unix . utf-8-unix))

(setq debug-on-error t)
(setq redisplay-dont-pause t)
(setq default-indicate-empty-lines nil)
(setq make-backup-files nil)
(setq kill-whole-line t)
(setq kill-ring-max 100)
(setq sentence-end-double-space t)
(setq require-final-newline t)
(setq next-screen-context-lines 0)
(setq bidi-display-reordering nil)
(setq repeat-message-function 'ignore)
(setq enable-local-variables t)
(setq enable-local-eval t)
(make-variable-buffer-local 'search-ring)
(make-variable-buffer-local 'isearch-string)
(setenv "EDITOR" "emacsclient")
(setenv "CVS_RSH" "ssh")
(setq byte-compile-debug t)
(set-frame-parameter nil 'fullscreen 'fullboth)

(fset 'yes-or-no-p 'y-or-n-p)

(show-paren-mode 1)
(tool-bar-mode -1)
(display-time-mode 1)
(blink-cursor-mode -1)
(transient-mark-mode 1)
(which-function-mode -1)
(menu-bar-mode -1)

;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/")
;; (add-to-list 'load-path "/usr/share/emacs/site-lisp/org/")

(add-to-list 'exec-path "~/bin/")

(let ((default-directory "~/elisp/"))
  (normal-top-level-add-subdirs-to-load-path))

(let ((default-directory "~/install/git/gnus/"))
  (normal-top-level-add-subdirs-to-load-path))

(add-to-list 'load-path "~/install/cvs/emacs-w3m/")
(add-to-list 'load-path "~/install/git/helm/")
(add-to-list 'load-path "~/install/git/geiser/elisp/")
(add-to-list 'load-path "~/install/git/nrepl.el/")
(add-to-list 'load-path "~/install/git/magit/" t)
(add-to-list 'load-path "~/install/src/bbdb/lisp/")

(add-to-list 'load-path "~/install/git/org-mode/lisp/")
(add-to-list 'load-path "~/install/git/org-mode/contrib/lisp/")

(require 'org)
(require 'boxquote)
(require 'elscreen)
(require 'bookmark-extensions)
(require 'magit)
(require 'session)
(require 'dired)
(require 'dired-x)
(require 'wdired)
(require 'info)
(require 'register-list)
(require 'erc)
(require 'erc-services)
(require 'ox-latex)
(require 'ox-koma-letter)
(require 'nrepl)
(require 'paredit)
(require 'ibuffer)

(info-initialize)
(add-to-list 'Info-directory-list "~/install/git/org-mode/doc/")

(put 'erase-buffer 'disabled nil)
(put 'narrow-to-page 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'narrow-to-region 'disabled nil)
(put 'downcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
(put 'scroll-right 'disabled nil)
(put 'set-goal-column 'disabled nil)

(setq custom-file "~/elisp/config/emacs-custom.el")
(load custom-file)

(setq initial-frame-alist
      '(;; (left-fringe . 180)
        ;; (right-fringe . 180)
        (menu-bar-lines . 0)
        (tool-bar-lines . 0)
        (vertical-scroll-bars . nil)
        ;; (background-color . "black")
        ;; (foreground-color . "#dddddd")
        ))

(add-to-list 'custom-theme-load-path "~/install/git/cyberpunk-theme.el/")
(load-theme 'cyberpunk)

(set-frame-font "Monospace 11")
;; (set-frame-font "Inconsolata 13")

(setq-default line-spacing 0.2)
(setq fill-column 70)
(setq line-move-visual nil)
(setq show-trailing-whitespace t)
(setq initial-scratch-message "")
(setq initial-major-mode 'text-mode)
(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message t)
(setq visible-bell nil)
(setq display-time-mail-string "#")
(setq focus-follows-mouse t)
;; (mouse-avoidance-mode 'cat-and-mouse)

(setq ps-paper-type 'a4
      ps-font-size 7.0
      ps-print-header nil
      ps-print-color-p nil
      ps-landscape-mode nil
      ps-number-of-columns 1
      ps-auto-font-detect nil
      ps-default-bg "white"
      ps-default-fg "black"
      ps-left-margin 56.69291338582677
      ps-print-color-p (quote black-white))

(if window-system
    (setq browse-url-browser-function 'browse-url-generic
          ;; (setq browse-url-browser-function 'w3m-browse-url
          ;;      browse-url-generic-program "conkeror")
          ;; browse-url-generic-program "chromium")
          browse-url-generic-program "firefox")
  (setq browse-url-browser-function 'w3m-browse-url))
(setq browse-url-text-browser "w3m")

(setq dired-guess-shell-alist-user
      (list
;;       (list "\\.pdf$" "acroread")
       (list "\\.pdf$" "mupdf")
       (list "\\.docx?$" "libreoffice")
       (list "\\.aup?$" "audacity")
       (list "\\.pptx?$" "libreoffice")
       (list "\\.odf$" "libreoffice")
       (list "\\.odt$" "libreoffice")
       (list "\\.odt$" "libreoffice")
       (list "\\.kdenlive$" "kdenlive")
       (list "\\.svg$" "gimp")
       (list "\\.csv$" "libreoffice")
       (list "\\.sla$" "scribus")
       (list "\\.ods$" "libreoffice")
       (list "\\.odp$" "libreoffice")
       (list "\\.xls$" "libreoffice")
       (list "\\.xlsx$" "libreoffice")
       (list "\\.txt$" "gedit")
       (list "\\.sql$" "gedit")
       (list "\\.css$" "gedit")
       (list "\\.html$" "w3m")
       (list "\\.jpe?g$" "gqview")
       (list "\\.psd$" "gimp")
       (list "\\.png$" "gqview")
       (list "\\.gif$" "gqview")
       (list "\\.odt$" "libreoffice")
       (list "\\.xo$" "unzip")
       (list "\\.3gp$" "vlc")
       (list "\\.mp3$" "vlc")
       (list "\\.flac$" "vlc")
       (list "\\.avi$" "mplayer -fs")
       ;; (list "\\.og[av]$" "vlc")
       (list "\\.wmv$" "vlc")
       (list "\\.flv$" "mplayer -fs")
       (list "\\.mov$" "mplayer -fs")
       (list "\\.divx$" "mplayer -fs")
       (list "\\.mp4$" "mplayer -fs")
       (list "\\.mkv$" "mplayer -fs")
       (list "\\.mpe?g$" "mplayer -fs")
       (list "\\.m4[av]$" "mplayer -fs")
       (list "\\.mp2$" "vlc")
       (list "\\.pp[st]$" "libreoffice")
       (list "\\.ogg$" "vlc")
       (list "\\.ogv$" "mplayer -fs")
       (list "\\.rtf$" "libreoffice")
       (list "\\.ps$" "gv")
       (list "\\.mp3$" "play")
       (list "\\.wav$" "vlc")
       (list "\\.rar$" "unrar x")
       ))

(setq dired-tex-unclean-extensions
  '(".toc" ".log" ".aux" ".dvi" ".out" ".nav" ".snm"))

(setq inferior-lisp-program "sbcl")

(global-set-key (kbd "C-h :") 'find-function)
(global-set-key (kbd "C-x <C-backspace>") 'bzg-find-bzg)
(global-set-key (kbd "<home>") 'beginning-of-buffer)
(global-set-key (kbd "<end>") 'end-of-buffer)
(global-set-key (kbd "<insert>") (lambda() (interactive) (insert-char ?<)))
(global-set-key (kbd "<deletechar>") (lambda() (interactive) (insert-char ?>)))
(global-set-key (quote [f1]) 'gnus)
(global-set-key (quote [f5]) 'edebug-defun)
(global-set-key (quote [f6]) 'w3m)
(global-set-key (quote [f7]) 'auto-fill-mode)
(global-set-key (quote [f8]) 'occur)
(global-set-key [(shift f8)] 'multi-occur)
(global-set-key (quote [f9]) 'magit-status)
(global-set-key (quote [f10]) 'calc)
(global-set-key (quote [f11]) 'eshell)
(global-set-key (quote [f12]) 'calendar)
(global-set-key (kbd "C-&") (lambda (arg) (interactive "P") (if arg (switch-to-buffer "#twitter_bzg2") (switch-to-buffer "&bitlbee"))))
(global-set-key (kbd "M-+") 'text-scale-increase)
(global-set-key (kbd "M--") 'text-scale-decrease)
(global-set-key (kbd "M-0") 'text-scale-adjust)
(global-set-key (kbd "C-M-]") (lambda () (interactive) (org-cycle t)))
(global-set-key (kbd "M-]")
                (lambda () (interactive) (ignore-errors (end-of-defun) (beginning-of-defun)) (org-cycle)))
(global-set-key (kbd "C-x r L") 'register-list)

(define-key dired-mode-map "\C-cb" 'org-ibuffer)
(define-key dired-mode-map "\C-cg" 'grep-find)
(define-key dired-mode-map "\C-cd" 'dired-clean-tex)

(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-cL" 'org-occur-link-in-agenda-files)
(define-key global-map "\C-ca" 'org-agenda)
(define-key global-map "\C-cc" 'org-capture)

(define-key global-map "\M-n" 'next-word-at-point)
(define-key global-map "\M-n" 'current-word-search)
(define-key global-map "\M-p" 'previous-word-at-point)

;; Hook to update all blocks before saving
(add-hook 'org-mode-hook
          (lambda() (add-hook 'before-save-hook
                              'org-update-all-dblocks t t)))

;; Hook to display dormant article in Gnus
(add-hook 'org-follow-link-hook
          (lambda ()
            (if (eq major-mode 'gnus-summary-mode)
                (gnus-summary-insert-dormant-articles))))

(add-hook 'org-mode-hook (lambda () (imenu-add-to-menubar "Imenu")))

(add-hook 'org-follow-link-hook
          (lambda () (if (eq major-mode 'gnus-summary-mode)
                         (gnus-summary-insert-dormant-articles))))

(setq org-global-properties
      '(("Effort_ALL" . "0 0:10 0:20 0:30 0:40 0:50 1:00 1:30 2:00 2:30 3:00 4:00 5:00 6:00 7:00 8:00")
        ("Progress_ALL" . "10% 20% 30% 40% 50% 60% 70% 80% 90%")
        ("Status_ALL" . "Work Leisure GTD WOT"))
      org-agenda-file-regexp "\\.org\\'"
      org-agenda-files '("~/org/rdv.org" "~/org/bzg.org" "~/org/kickhub.org" "~/org/clojure.org")
      org-agenda-include-diary nil
      org-agenda-remove-tags t
      org-agenda-restore-windows-after-quit t
      org-agenda-skip-deadline-if-done t
      org-agenda-skip-scheduled-if-done t
      org-agenda-skip-timestamp-if-done t
      org-agenda-sorting-strategy '((agenda time-up) (todo time-up) (tags time-up) (search time-up))
      org-agenda-start-on-weekday 1
      org-confirm-elisp-link-function nil
      org-confirm-shell-link-function nil
      org-context-in-file-links t
      org-cycle-include-plain-lists nil
      org-deadline-warning-days 7
      org-default-notes-file "~/org/notes.org"
      org-directory "~/org/"
      org-ellipsis nil
      org-email-link-description-format "%c: %.50s"
      org-export-default-language "fr"
      org-export-highlight-first-table-line t
      org-export-html-extension "html"
      org-html-head ""
      org-html-head-include-default-style nil
      org-export-html-with-timestamp nil
      org-export-skip-text-before-1st-heading nil
      org-export-with-LaTeX-fragments t
      org-export-with-archived-trees nil
      org-export-with-drawers '("HIDE")
      org-export-with-section-numbers nil
      org-export-with-sub-superscripts '{}
      org-export-with-tags 'not-in-toc
      org-export-with-timestamps t
      org-fast-tag-selection-single-key 'expert
      org-fontify-done-headline t
      org-fontify-emphasized-text t
      org-footnote-auto-label 'confirm
      org-footnote-auto-adjust t
      org-footnote-define-inline nil
      org-hide-emphasis-markers nil
      org-icalendar-include-todo 'all
      org-link-frame-setup '((gnus . gnus) (file . find-file-other-window))
      org-link-mailto-program '(browse-url-mail "mailto:%a?subject=%s")
      org-log-note-headings '((done . "CLOSING NOTE %t") (state . "State %-12s %t") (clock-out . ""))
      org-priority-start-cycle-with-default nil
      org-refile-targets '((org-agenda-files . (:maxlevel . 3))
                           (("~/org/garden.org") . (:maxlevel . 3))
                           (("~/org/libre.org") . (:maxlevel . 3)))
      org-refile-use-outline-path t
      org-refile-use-cache t
      org-return-follows-link t
      org-reverse-note-order t
      org-scheduled-past-days 100
      org-show-following-heading '((default nil) (occur-tree t))
      org-show-hierarchy-above '((default nil) (tags-tree . t))
      org-special-ctrl-a/e 'reversed
      org-special-ctrl-k t
      org-stuck-projects '("+LEVEL=1" ("NEXT" "TODO" "DONE"))
      org-tag-alist '((:startgroup . nil) ("Write" . ?w) ("Trad" . ?t) ("Read" . ?r) ("RDV" . ?R) ("View" . ?v) ("Listen" . ?l) (:endgroup . nil) (:startgroup . nil) ("@Online" . ?O) ("@Offline" . ?F) (:endgroup . nil) ("Print" . ?P) ("Code" . ?c) ("Patch" . ?p) ("Bug" . ?b) ("Twit" . ?i) ("Tel" . ?T) ("Buy" . ?B) ("Doc" . ?d) ("Mail" . ?@))
      org-tags-column -74
      org-tags-match-list-sublevels t
      org-todo-keywords '((type "NEXT" "TODO" "STRT" "WAIT" "|" "DONE" "DELEGATED" "CANCELED"))
      org-use-property-inheritance t
      org-clock-persist t
      org-clock-history-length 35
      org-clock-in-resume t
      org-clock-out-remove-zero-time-clocks t
      org-clock-sound t
      org-insert-heading-respect-content t
      org-id-method 'uuidgen
      org-combined-agenda-icalendar-file "~/org/bzg.ics"
      org-icalendar-combined-name "Bastien Guerry ORG"
      org-icalendar-use-scheduled '(todo-start event-if-todo event-if-not-todo)
      org-icalendar-use-deadline '(todo-due event-if-todo event-if-not-todo)
      org-icalendar-timezone "Europe/Paris"
      org-icalendar-store-UID t
      org-agenda-skip-deadline-prewarning-if-scheduled t
      org-agenda-tags-todo-honor-ignore-options t
      org-timer-default-timer 20
      org-confirm-babel-evaluate nil
      org-agenda-diary-file "/home/guerry/org/rdv.org"
      org-archive-default-command 'org-archive-to-archive-sibling
      org-clock-idle-time 15
      org-id-uuid-program "uuidgen"
;;      org-modules '(org-bbdb org-bibtex org-docview org-gnus org-id org-protocol org-info org-jsinfo org-habit org-irc org-w3m org-taskjuggler org-learn)
      org-modules '(org-bbdb org-bibtex org-docview org-gnus org-id org-protocol org-info org-jsinfo org-irc org-w3m org-taskjuggler org-learn)
      org-use-speed-commands t
      org-src-tab-acts-natively t
      org-hide-block-startup t
      org-export-with-priority t
      org-highlight-latex-and-related '(latex)
      org-log-into-drawer "LOGBOOK"
      org-goto-auto-isearch nil
      org-agenda-use-tag-inheritance nil
      org-agenda-show-inherited-tags nil
      org-beamer-outline-frame-title "Survol"
      org-image-actual-width 600
      org-export-dispatch-use-expert-ui nil
      org-refile-allow-creating-parent-nodes t
      org-src-fontify-natively t
      org-todo-keyword-faces '(("STRT" . "lightgoldenrod1")
                               ("NEXT" . "Cyan3")
                               ("WAIT" . "lightgoldenrod3")))

(setq org-export-backends '(latex odt icalendar html ascii rss koma-letter))
(setq org-mobile-directory "~/Dropbox/org/")
(setq org-mobile-files '("~/Dropbox/org/" "~/org/from-mobile.org"))
(setq org-publish-list-skipped-files nil)
(setq org-fontify-whole-heading-line t)
(setq org-export-with-toc nil)
(setq org-agenda-dim-blocked-tasks nil)
(setq org-agenda-text-search-extra-files '("~/org/clojure.org"))
(add-to-list 'org-latex-classes
             '("my-letter"
               "\\documentclass\{scrlttr2\}
\\usepackage[english,frenchb]{babel}
\[NO-DEFAULT-PACKAGES]
\[NO-PACKAGES]
\[EXTRA]"))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (sh . t)
   (dot . t)
   (clojure . t)
   (org . t)
   (ditaa . t)
   (org . t)
;;   (ledger . t)
   (scheme . t)
   (plantuml . t)
   (R . t)
   (gnuplot . t)))

(org-clock-persistence-insinuate)
(appt-activate t)

(setq org-capture-templates
      ;; for org/rdv.org
      '(

        ;; for org/rdv.org
        ("r" "Bzg RDV" entry (file+headline "~/org/rdv.org" "RDV")
         "* %a :RDV:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i%?" :prepend t)

        ;; Basement et garden
        ("b" "Basement" entry (file+headline "~/org/bzg.org" "Basement")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ;; Basement et garden
        ("C" "Coursera" entry (file+headline "~/org/bzg.org" "Coursera")
         "* NEXT %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ("g" "Garden" entry (file+headline "~/org/garden.org" "Garden")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ;; Boite (lml) et cours
        ("b" "Boîte" entry (file+headline "~/org/bzg.org" "Boîte")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ("c" "Cours" entry (file+headline "~/org/bzg.org" "Cours")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ("O" "OLPC" entry (file+headline "~/org/libre.org" "OLPC")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ("e" "Emacs" entry (file+headline "~/org/libre.org" "Emacs")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend nil)

        ("w" "Wikipedia" entry (file+headline "~/org/libre.org" "Wikipedia")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ("i" "ITIC" entry (file+headline "~/org/libre.org" "itic")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ("k" "Krowdfounding" entry (file+headline "~/org/bzg.org" "Kickhub")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ("s" "Spark" entry (file+headline "~/org/bzg.org" "Spark")
         "* TODO %?%a\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)

        ;; Informations
        ("I" "Information")
        ("Ir" "Information read" entry (file+headline "~/org/garden.org" "Infos")
         "* TODO %?%a :Read:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)
        ("IR" "Information read (!)" entry (file+headline "~/org/garden.org" "Infos")
         "* TODO %?%a :Read:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t :immediate-finish t)
        ("Ic" "Information read (clocking)" entry (file+headline "~/org/garden.org" "Infos")
         "* TODO %?%a :Read:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t :clock-in t)
        ("IC" "Information read (keep clocking)" entry (file+headline "~/org/garden.org" "Infos")
         "* TODO %?%a :Read:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i"
         :prepend t :clock-in t :immediate-finish t :clock-keep t :jump-to-captured t)
        
        ("o" "Org")
        ("of" "Org FR" entry (file+headline "~/org/org.org" "Current ideas")
         "* TODO %?%a :Code:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)
        ("ob" "Org Bug" entry (file+headline "~/org/org.org" "Mailing list")
         "* NEXT %?%a :Bug:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)
        ("op" "Org Patch" entry (file+headline "~/org/org.org" "Mailing list")
         "* NEXT [#A] %?%a :Patch:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)
        ("ow" "Worg" entry (file+headline "~/org/org.org" "Worg")
         "* TODO [#A] %?%a :Worg:\n  :PROPERTIES:\n  :CAPTURED: %U\n  :END:\n\n%i" :prepend t)
        ))

(setq org-agenda-custom-commands
      `(

        ;; list of WP tasks for today
        (" " "Aujourd'hui" agenda "List of rendez-vous and tasks for today"
         ((org-agenda-span 1)
          (org-agenda-files '("~/org/rdv.org" "~/org/bzg.org"))
          (org-deadline-warning-days 10)
          (org-agenda-sorting-strategy
           '(todo-state-up time-up priority-up))))

        ;; list of WP tasks for today
        ("%" "Rendez-vous" agenda* "Week RDV"
         ((org-agenda-span 'week)
          (org-agenda-files '("~/org/rdv.org"))
          (org-deadline-warning-days 10)
          (org-agenda-sorting-strategy
           '(todo-state-up time-up priority-up))))

        ("n" todo "NEXT|TODO"
         (;; (org-agenda-max-tags -1)
          (org-agenda-sorting-strategy
           '(timestamp-up))
          (org-agenda-max-entries 7)
          )) ;; todo-state-up time-up priority-up))))

        ("x" "Scheduled all" agenda "List of scheduled tasks for today"
         ((org-agenda-span 1)
          (org-agenda-entry-types '(:timestamp :scheduled))
          (org-agenda-sorting-strategy
           '(time-up todo-state-up priority-up))))

        ;; list of WP tasks for today
        ("X" "Upcoming deadlines" agenda "List of past and upcoming deadlines"
         ((org-agenda-span 1)
          (org-deadline-warning-days 15)
          (org-agenda-entry-types '(:deadline))
          (org-agenda-sorting-strategy
           '(time-up todo-state-up priority-up))))

        ;; list of Old deadlines
        ("Y" tags-todo "+SCHEDULED<=\"<now>\"")
        ("Z" tags-todo "+DEADLINE<=\"<now>\"")

        ;; Everything that has a "Read" tag
        ("r" . "Read")
        ("rr" tags-todo "+Read+TODO={TODO\\|NEXT}" nil)
        ("r," tags-todo "+Read/STRT" nil)
        ("rF" tags "+Read+@Offline" nil)

        ;; Everything that has a "Write" tag
        ("w" . "write")
        ("ww" tags-todo "+Write/NEXT|TODO|STRT" nil)
        ("w," tags-todo "+Write/STRT" nil)
        ("wt" tags-tree "+Write/STRT" nil)
        ("w;" tags-todo "+Write+@Offline" nil)

        ;; Everything that has a "Write" tag
        ("c" . "Code")
        ("cc" tags-todo "+Code/NEXT|TODO|STRT" nil)
        ("c," tags-todo "+Code/STRT" nil)
        ))

(setq org-publish-project-alist
      `(
        ("cours"
         :base-directory "~/install/git/CoursCreationSiteWeb/"
         :base-extension "org"
         :publishing-directory "~/public_html/org/homepage/cours-creation-site-web/"
         :publishing-function org-html-publish-to-html
         :auto-sitemap nil
         :makeindex t
         :section-numbers nil
         :with-toc nil
         :html-head "<link rel=\"stylesheet\" href=\"http://lumiere.ens.fr/~guerry/u/org.css\" type=\"text/css\" />"
         :html-preamble nil
         :html-postamble
         "<div id=\"disqus_thread\"></div>
<script type=\"text/javascript\">
    var disqus_shortname = 'coursdecrationdesitewebscriptparis7';
    (function() {
        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
    })();
</script>")
        ("cours-images"
         :base-directory "~/install/git/CoursCreationSiteWeb/images/"
         :base-extension "png\\|jpg\\|gif"
         :publishing-directory "~/public_html/org/homepage/cours-creation-site-web/images/"
         :publishing-function org-publish-attachment)

        ("dotemacs"
         :base-directory "~/install/git/dotemacs/"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory "/home/guerry/public_html/org/homepage/"
         :publishing-function (org-html-publish-to-html)
         :auto-sitemap nil
         :recursive t
         :makeindex t
         :preserve-breaks nil
         :sitemap-sort-files chronologically
         :section-numbers nil
         :with-toc nil
         :html-head-extra "<link rel=\"stylesheet\" href=\"http://lumiere.ens.fr/~guerry/u/org.css\" type=\"text/css\" />"
         :html-preamble nil
         :htmlized-source t
         :html-postamble nil)

        ("homepage"
         :base-directory "~/install/git/homepage/"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory "/home/guerry/public_html/org/homepage/"
         :publishing-function (org-html-publish-to-html)
         :auto-sitemap nil
         :recursive t
         :makeindex t
         :preserve-breaks nil
         :sitemap-sort-files chronologically
         :section-numbers nil
         :with-toc nil
         :html-head-extra "<link rel=\"stylesheet\" href=\"http://lumiere.ens.fr/~guerry/u/org.css\" type=\"text/css\" />"
         :html-preamble nil
         :htmlized-source t
         :html-postamble nil)
        ("homepagerss"
         :base-directory "~/install/git/homepage/"
         :base-extension "org"
         :html-link-home "http://lumiere.ens.fr/~guerry/"
         :publishing-directory "/home/guerry/public_html/org/homepage/"
         :publishing-function (org-rss-publish-to-rss)
         :section-numbers nil
         :exclude ".*"
         :include ("blog.org")
         :with-toc nil)
        ("homepage-attachments"
         :base-directory "~/install/git/homepage"
         :base-extension "png\\|jpg\\|gif\\|atom"
         :publishing-directory "/home/guerry/public_html/org/homepage/u/"
         :publishing-function org-publish-attachment)

        ("dll"
         :base-directory "~/install/git/dunlivrelautre/"
         :html-extension "html"
         :base-extension "org"
         :publishing-directory "/home/guerry/public_html/org/dunlivrelautre/"
         :publishing-function (org-html-publish-to-html)
         :auto-sitemap nil
         :recursive t
         :makeindex t
         :preserve-breaks nil
         :sitemap-sort-files chronologically
         :section-numbers nil
         :with-toc nil
         :html-head-extra "<link rel=\"stylesheet\" href=\"http://lumiere.ens.fr/~guerry/u/org.css\" type=\"text/css\" />"
         :html-preamble nil
         :htmlized-source t
         :html-postamble nil)
        ("dllrss"
         :base-directory "~/install/git/dunlivrelautre/"
         :base-extension "org"
         :html-link-home "http://lumiere.ens.fr/~guerry/"
         :publishing-directory "/home/guerry/public_html/org/dunlivrelautre/"
         :publishing-function (org-rss-publish-to-rss)
         :section-numbers nil
         :exclude ".*"
         :include ("blog.org")
         :with-toc nil)
        ("dll-attachments"
         :base-directory "~/install/git/dunlivrelautre"
         :base-extension "png\\|jpg\\|gif\\|atom"
         :publishing-directory "/home/guerry/public_html/org/dunlivrelautre/u/"
         :publishing-function org-publish-attachment)

        ;; Meta projects
        ("hp" :components ("homepage" "homepage-attachments" "homepagerss" "homepage_articles"))
        ("dll" :components ("dll" "dll-attachments" "dllrss" "dll_articles"))
        ("CoursWeb" :components ("cours" "cours-images"))
        ))

(require 'message)
(require 'gnus)
(require 'bbdb-config)
(require 'starttls)
(require 'epg)
(require 'epa)
(require 'smtpmail)
(require 'spam)

(setq spam-use-spamassassin t)

(setq send-mail-function 'sendmail-send-it)
(setq message-send-mail-function 'message-send-mail-with-sendmail)

;; Sources and methods
(setq mail-sources '((file :path "/var/mail/guerry")
                     (maildir :path "~/Maildir/" :subdirs ("cur" "new")))
      mail-source-delete-incoming nil
      gnus-select-method '(nnmaildir "Bastien" (directory "~/Maildir/"))
      gnus-secondary-select-methods
      '((nnml "")
        ;; (nntp "news" (nntp-address "news.gmane.org"))
        ;; (nntp "news" (nntp-address "news.gwene.org"))
        (nnimap "imap.cnam.fr")
        (nnimap "obm-front.u-paris10.fr")
        ))

(setq gnus-check-new-newsgroups nil)
(setq gnus-read-active-file 'some)
(setq gnus-agent t)
(setq gnus-agent-consider-all-articles t)
(setq gnus-agent-enable-expiration 'disable)

(setq read-mail-command 'gnus
      message-mail-user-agent 'gnus-user-agent
      message-kill-buffer-on-exit t
      user-mail-address "bzg@altern.org"
      mail-envelope-from "bzg@altern.org"
      mail-user-agent 'gnus-user-agent
      mail-specify-envelope-from nil
      gnus-directory "~/News/"
      gnus-novice-user nil
      gnus-inhibit-startup-message t
      gnus-play-startup-jingle nil
      gnus-interactive-exit nil
      gnus-no-groups-message "No news, good news."
      gnus-show-all-headers nil
      gnus-use-correct-string-widths nil
      gnus-use-cross-reference nil
      gnus-asynchronous t
      gnus-interactive-catchup nil
      gnus-inhibit-user-auto-expire t
      gnus-gcc-mark-as-read t
      gnus-verbose 6
      gnus-backup-startup-file t
      gnus-use-tree t
      gnus-use-header-prefetch t
      gnus-large-newsgroup 10000
      nnmail-expiry-wait 'never
      nnimap-expiry-wait 'never
      nnmail-crosspost nil
      nnmail-expiry-target "nnml:expired"
      nnmail-split-methods 'nnmail-split-fancy
      nnmail-treat-duplicates 'delete
      nnml-marks nil
      gnus-nov-is-evil nil
      nnml-marks-is-evil t
      nntp-marks-is-evil t)

(setq gnus-ignored-from-addresses
      (regexp-opt '("Bastien.Guerry@ens.fr"
                    "bastien.guerry@free.fr"
                    "bastien.guerry@cnam.fr"
                    "bastien.guerry@wikimedia.fr"
                    "bastien@olpc-france.org"
                    "bastienguerry@gmail.com"
                    "bastienguerry@googlemail.com"
                    "bastien1@free.fr"
                    "bzg@altern.org"
                    "bzg@gnu.org"
                    "bzg@laptop.org"
                    "bastien.guerry@u-paris10.fr"
                    "bastienguerry@hotmail.com"
                    "bastienguerry@yahoo.fr"
                    "b.guerry@philosophy.bbk.ac.uk"
                    "castle@philosophy.bbk.ac.uk"
                    "guerry@lumiere.ens.fr")))

(setq message-dont-reply-to-names gnus-ignored-from-addresses)

;; Start the topic view
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Levels and subscription
(setq gnus-subscribe-newsgroup-method 'gnus-subscribe-interactively
      gnus-group-default-list-level 3
      gnus-level-default-subscribed 3
      gnus-level-default-unsubscribed 7
      gnus-level-subscribed 6
      gnus-level-unsubscribed 7
      gnus-activate-level 5)

;; Archives
(setq gnus-message-archive-group
      '((if (message-news-p)
            (concat "nnfolder+archive:" (format-time-string "%Y-%m")
                    "-divers-news")
          (concat "nnfolder+archive:" (format-time-string "%Y-%m")
                  "-divers-mail"))))

;; Delete mail backups older than 3 days
(setq mail-source-delete-incoming 3)

;; Select the first mail when entering a group
(setq gnus-auto-select-first t)

;; Group sorting
(setq gnus-group-sort-function
      '(gnus-group-sort-by-unread
        gnus-group-sort-by-alphabet
        gnus-group-sort-by-score
        gnus-group-sort-by-level))

;; Thread sorting
(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-number))

;; Display the thread by default
(setq gnus-thread-hide-subtree nil)

;; Headers we wanna see:
(setq gnus-visible-headers
      "^From:\\|^Subject:\\|^X-Mailer:\\|^X-Newsreader:\\|^Date:\\|^To:\\|^Cc:\\|^User-agent:\\|^Newsgroups:\\|^Comments:")

;;; [En|de]coding
(setq mm-body-charset-encoding-alist
      '((utf-8 . 8bit)
        (iso-8859-1 . 8bit)
        (iso-8859-15 . 8bit)))

(setq mm-coding-system-priorities
      '(iso-8859-1 iso-8859-9 iso-8859-15 utf-8
                   iso-2022-jp iso-2022-jp-2 shift_jis))

;; bbdb
(setq gnus-use-generic-from t
      gnus-use-bbdb t
      bbdb/gnus-split-crosspost-default nil
      bbdb/gnus-split-default-group nil
      bbdb/gnus-split-myaddr-regexp gnus-ignored-from-addresses
      bbdb-user-mail-names gnus-ignored-from-addresses
      bbdb/gnus-split-nomatch-function nil
      bbdb/gnus-summary-known-poster-mark "+"
      bbdb/gnus-summary-mark-known-posters t)

(defalias 'bbdb-y-or-n-p '(lambda (prompt) t))

;;; Trier les mails
(setq nnmail-split-abbrev-alist
      '((any . "From\\|To\\|Cc\\|Sender\\|Apparently-To\\|Delivered-To\\|X-Apparently-To\\|Resent-From\\|Resent-To\\|Resent-Cc")
        (mail . "Mailer-Daemon\\|Postmaster\\|Uucp")
        (to . "To\\|Cc\\|Apparently-To\\|Resent-To\\|Resent-Cc\\|Delivered-To\\|X-Apparently-To")
        (from . "From\\|Sender\\|Resent-From")
        (nato . "To\\|Cc\\|Resent-To\\|Resent-Cc\\|Delivered-To\\|X-Apparently-To")
        (naany . "From\\|To\\|Cc\\|Sender\\|Resent-From\\|Resent-To\\|Delivered-To\\|X-Apparently-To\\|Resent-Cc")))

;; Load nnmail-split-fancy (private)
(load "~/elisp/config/gnus_.el")

;; Simplify the subject lines
(setq gnus-simplify-subject-functions
      '(gnus-simplify-subject-re
        gnus-simplify-whitespace))

;; Display faces
(setq gnus-treat-display-face 'head)

;; Thread by Xref, not by subject
(setq gnus-thread-ignore-subject t)
(setq gnus-summary-thread-gathering-function
      'gnus-gather-threads-by-references)

;; Dispkay a button for MIME parts
(setq gnus-buttonized-mime-types '("multipart/alternative"))

;; Use w3m to display HTML mails
(setq mm-text-html-renderer 'gnus-w3m
      mm-inline-text-html-with-images t
      mm-inline-large-images nil
      mm-attachment-file-modes 420)

;; Avoid spaces when saving attachments
(setq mm-file-name-rewrite-functions
      '(mm-file-name-trim-whitespace
        mm-file-name-collapse-whitespace
        mm-file-name-replace-whitespace))

(setq gnus-user-date-format-alist
      '(((gnus-seconds-today) . "     %k:%M")
        ((+ 86400 (gnus-seconds-today)) . "hier %k:%M")
        ((+ 604800 (gnus-seconds-today)) . "%a  %k:%M")
        ((gnus-seconds-month) . "%a  %d")
        ((gnus-seconds-year) . "%b %d")
        (t . "%b %d '%y")))

;; Add a time-stamp to a group when it is selected
(add-hook 'gnus-select-group-hook 'gnus-group-set-timestamp)

;; Format group line
(setq gnus-group-line-format
      ;;      "%M\%S\%p\%P\%5T>%5y: %(%-40,40g%) %ud\n")
      ;;      "%M\%S\%p\%P\%y: %(%-40,40g%) %T/%i\n")
      ;;      "%M\%S\%p\%P %(%-30,30G%) %-3y %-3T %-3I\n")
      "%M\%S\%p\%P %(%-40,40G%)\n")

(setq gnus-topic-indent-level 3)

(defun bzg-gnus-toggle-group-line-format ()
  (interactive)
  (if (equal gnus-group-line-format
             "%M\%S\%p\%P %(%-40,40G%) %-3y %-3T %-3I\n")
      (setq gnus-group-line-format
             "%M\%S\%p\%P %(%-40,40G%)\n")
    (setq gnus-group-line-format
          "%M\%S\%p\%P %(%-40,40G%) %-3y %-3T %-3I\n")))

(defun bzg-gnus-add-gmane ()
  (add-to-list 'gnus-secondary-select-methods '(nntp "news" (nntp-address "news.gmane.org"))))

(define-key gnus-group-mode-map "x"
  (lambda () (interactive) (bzg-gnus-toggle-group-line-format) (gnus)))

(define-key gnus-group-mode-map "X"
  (lambda () (interactive) (bzg-gnus-add-gmane) (gnus)))

(define-key gnus-summary-mode-map "$" 'gnus-summary-mark-as-spam)

;; Scoring
(setq gnus-use-adaptive-scoring 'line
      ;; gnus-score-expiry-days 14
      gnus-default-adaptive-score-alist
      '((gnus-dormant-mark (from 20) (subject 100))
        (gnus-ticked-mark (subject 30))
        (gnus-read-mark (subject 30))
        (gnus-del-mark (subject -150))
        (gnus-catchup-mark (subject -150))
        (gnus-killed-mark (subject -1000))
        (gnus-expirable-mark (from -1000) (subject -1000)))
      gnus-score-decay-constant 1    ;default = 3
      gnus-score-decay-scale 0.03    ;default = 0.05
      gnus-decay-scores t)           ;(gnus-decay-score 1000)

(setq gnus-face-0 '((t (:foreground "grey60"))))
(setq gnus-face-1 '((t (:foreground "grey30"))))
(setq gnus-face-2 '((t (:foreground "grey90"))))

;; Prompt for the right group
(setq gnus-group-jump-to-group-prompt
      '((0 . "nnml:mail.")
        (1 . "nnfolder+archive:2013-")
        (2 . "nnfolder+archive:2012-")
        (3 . "nntp+news:gmane.")))

(setq gnus-summary-line-format
      (concat "%*%0{%U%R%z%}"
              "%0{ %}(%2t)"
              "%2{ %}%-23,23n"
              "%1{ %}%1{%B%}%2{%-102,102s%}%-140="
              "\n"))

(require 'ecomplete)
(setq message-mail-alias-type 'ecomplete)

(add-hook 'message-mode-hook 'turn-on-orgstruct++)
(add-hook 'message-mode-hook 'turn-on-orgtbl)

(require 'gnus-gravatar)

;; Hack to store Org links upon sending Gnus messages

(defun bzg-message-send-and-org-gnus-store-link (&optional arg)
  "Send message with `message-send-and-exit' and store org link to message copy.
If multiple groups appear in the Gcc header, the link refers to
the copy in the last group."
  (interactive "P")
    (save-excursion
      (save-restriction
        (message-narrow-to-headers)
        (let ((gcc (car (last
                         (message-unquote-tokens
                          (message-tokenize-header
                           (mail-fetch-field "gcc" nil t) " ,")))))
              (buf (current-buffer))
              (message-kill-buffer-on-exit nil)
              id to from subject desc link newsgroup xarchive)
        (message-send-and-exit arg)
        (or
         ;; gcc group found ...
         (and gcc
              (save-current-buffer
                (progn (set-buffer buf)
                       (setq id (org-remove-angle-brackets
                                 (mail-fetch-field "Message-ID")))
                       (setq to (mail-fetch-field "To"))
                       (setq from (mail-fetch-field "From"))
                       (setq subject (mail-fetch-field "Subject"))))
              (org-store-link-props :type "gnus" :from from :subject subject
                                    :message-id id :group gcc :to to)
              (setq desc (org-email-link-description))
              (setq link (org-gnus-article-link
                          gcc newsgroup id xarchive))
              (setq org-stored-links
                    (cons (list link desc) org-stored-links)))
         ;; no gcc group found ...
         (message "Can not create Org link: No Gcc header found."))))))

(define-key message-mode-map [(control c) (control meta c)]
  'bzg-message-send-and-org-gnus-store-link)

;; (defun gnus-thread-sort-by-length (h1 h2)
;;   "Sort threads by the sum of all articles in the thread."
;;   (> (gnus-thread-length h1)
;;      (gnus-thread-length h2)))

;; (defun gnus-thread-length (thread)
;;   "Find the total number of articles in THREAD."
;;   (cond
;;    ((null thread) 0)
;;    ((listp thread) (length thread))))

(setq message-fill-column 70)
(setq message-use-mail-followup-to nil)

(setq erc-modules '(autoaway autojoin irccontrols log netsplit noncommands notify pcomplete completion ring services stamp track truncate)
      erc-keywords nil
      erc-prompt-for-nickserv-password nil
      erc-hide-timestamps t
      erc-log-insert-log-on-open nil
      erc-log-channels t
      erc-log-write-after-insert nil
      erc-save-buffer-on-part t
      erc-input-line-position 0
      ;; erc-fill-function (quote erc-fill-static)
      ;; erc-fill-mode t
      erc-insert-timestamp-function 'erc-insert-timestamp-left
      erc-insert-away-timestamp-function 'erc-insert-timestamp-left
      erc-notify-list nil
      erc-whowas-on-nosuchnick t
      erc-public-away-p nil
      erc-save-buffer-on-part t
      erc-echo-notice-always-hook '(erc-echo-notice-in-minibuffer)
      erc-autoaway-message "%i seconds out..."
      erc-away-nickname "bz_g"
      erc-kill-queries-on-quit nil
      erc-kill-server-buffer-on-quit t
      erc-log-channels-directory "~/.erc_log"
      erc-query-on-unjoined-chan-privmsg t
      erc-auto-query 'window-noselect
      erc-server-coding-system '(utf-8 . utf-8)
      erc-encoding-coding-alist '(("#emacs" . utf-8)
                                  ("#frlab" . iso-8859-1)
                                  ("&bitlbee" . utf-8)))

(defun bzg-erc-connect-bitlbee ()
  "Connect to &bitlbee channel with ERC."
  (interactive)
  (erc-select :server "bzg.ath.cx"
              :port 6667
              :nick "bz_g"
              :full-name "Bastien"))

(defun bzg-erc-connect-bitlbee-2 ()
  "Connect to &bitlbee channel with ERC."
  (interactive)
  (erc-select :server "bzg.ath.cx"
              :port 6667
              :nick "lml"
              :full-name "Le_ Musée_ Libre_"))

(defun bzg-erc-connect-freenode ()
  "Connect to Freenode server with ERC."
  (interactive)
  (erc-select :server "irc.freenode.net"
              :port 6666
              :nick "bz_g"
              :full-name "Bastien"))

(add-hook 'erc-mode-hook
          '(lambda ()
             (auto-fill-mode 0)
             (pcomplete-erc-setup)
             (erc-completion-mode 1)
             (erc-ring-mode 1)
             (erc-log-mode 1)
             (erc-netsplit-mode 1)
             (erc-button-mode -1)
             (erc-match-mode 1)
             (erc-autojoin-mode 1)
             (erc-nickserv-mode 1)
             (erc-timestamp-mode 1)
             (erc-services-mode 1)))

;; (add-hook 'erc-server-PRIVMSG-functions 'erc-bot-remote t)
;; (add-hook 'erc-send-completed-hook 'erc-bot-local t)
;; (add-hook 'erc-server-PRIVMSG-functions 'erc-warn-me-PRIVMSG t)

;; (defun erc-warn-me-PRIVMSG (proc parsed)
;;   (let* ((nick (car (erc-parse-user (erc-response.sender parsed))))
;;          (msg (erc-response.contents parsed)))
;;     ;; warn me if I'm in bitlbee or #org-mode
;;     (when (string-match "bitlbee\\|org-mode"
;;                      (buffer-name (window-buffer)))
;;       (let ((minibuffer-message-timeout 3))
;;      (minibuffer-message (format "%s: %s" nick msg))))))

(load "~/elisp/config/erc_.el")

(setq org-plantuml-jar-path "~/bin/plantuml.jar")
(setq org-export-babel-evaluate t)
(setq org-lparse-use-flashy-warning nil)
(setq org-babel-default-header-args
      '((:session . "none")
        (:results . "replace")
        (:exports . "code")
        (:cache . "no")
        (:noweb . "yes")
        (:hlines . "no")
        (:tangle . "no")
        (:padnewline . "yes")))

(setq org-link-abbrev-alist
      '(("bugzilla" . "http://10.1.2.9/bugzilla/show_bug.cgi?id=")
        ("google"   . "http://www.google.com/search?q=%s")
        ("gmap"     . "http://maps.google.com/maps?q=%s")
        ("omap"     . "http://nominatim.openstreetmap.org/search?q=%s&polygon=1")
        ("ads"      . "http://adsabs.harvard.edu/cgi-bin/nph-abs_connect?author=%s&db_key=AST")))

(setq org-export-taskjuggler-default-project-duration 2000)
(setq org-export-taskjuggler-target-version 3.0)
(setq org-attach-directory "~/org/data/")
(setq org-export-latex-listings 'minted)
(setq org-link-display-descriptive nil)
(setq org-loop-over-headlines-in-active-region t)

(setq org-gnus-prefer-web-links nil)
(setq org-html-head-include-default-style nil)
(setq org-html-head-include-scripts nil)
(setq org-export-allow-BIND-local t)
(setq org-agenda-window-frame-fractions '(0.0 . 0.5))
(setq org-create-formula-image-program 'dvipng) ;; imagemagick
(setq org-allow-promoting-top-level-subtree t)
(setq org-agenda-deadline-faces
      '((1.0001 . org-warning)              ; due yesterday or before
        (0.0    . org-upcoming-deadline)))  ; due today or later
(setq org-description-max-indent 5)
(setq org-agenda-sticky nil)

(defvar buffer-length-goal nil)
(defvar buffer-length-to-goal nil)
(make-variable-buffer-local 'buffer-length-goal)
(make-variable-buffer-local 'buffer-length-to-goal)

(defun bzg-set-buffer-length-goal ()
  (interactive)
  (setq buffer-length-goal
        (string-to-number (read-from-minibuffer "Buffer length goal: ")))
  (setq buffer-length-to-goal (bzg-update-buffer-length-goal))
  (add-to-list 'global-mode-string 'buffer-length-to-goal t)
  (run-at-time nil 3 'bzg-update-buffer-length-goal))

(defun bzg-update-buffer-length-goal ()
  (setq buffer-length-to-goal
        (concat " Done: "
                (number-to-string
                 (round
                  (- 100
                     (* 100
                        (/ (float (- buffer-length-goal (buffer-size)))
                           buffer-length-goal))))) "%"))
  (force-mode-line-update))

(setq french-holiday
      '((holiday-fixed 1 1 "Jour de l'an")
        (holiday-fixed 5 8 "Victoire 45")
        (holiday-fixed 7 14 "Fête nationale")
        (holiday-fixed 8 15 "Assomption")
        (holiday-fixed 11 1 "Toussaint")
        (holiday-fixed 11 11 "Armistice 18")
        (holiday-easter-etc 1 "Lundi de Pâques")
        (holiday-easter-etc 39 "Ascension")
        (holiday-easter-etc 50 "Lundi de Pentecôte")
        (holiday-fixed 1 6 "Épiphanie")
        (holiday-fixed 2 2 "Chandeleur")
        (holiday-fixed 2 14 "Saint Valentin")
        (holiday-fixed 5 1 "Fête du travail")
        (holiday-fixed 5 8 "Commémoration de la capitulation de l'Allemagne en 1945")
        (holiday-fixed 6 21 "Fête de la musique")
        (holiday-fixed 11 2 "Commémoration des fidèles défunts")
        (holiday-fixed 12 25 "Noël")
        ;; fêtes à date variable
        (holiday-easter-etc 0 "Pâques")
        (holiday-easter-etc 49 "Pentecôte")
        (holiday-easter-etc -47 "Mardi gras")
        (holiday-float 6 0 3 "Fête des pères") ;; troisième dimanche de juin
        ;; Fête des mères
        (holiday-sexp
         '(if (equal
               ;; Pentecôte
               (holiday-easter-etc 49)
               ;; Dernier dimanche de mai
               (holiday-float 5 0 -1 nil))
              ;; -> Premier dimanche de juin si coïncidence
              (car (car (holiday-float 6 0 1 nil)))
            ;; -> Dernier dimanche de mai sinon
            (car (car (holiday-float 5 0 -1 nil))))
         "Fête des mères")))

(setq calendar-date-style 'european
      calendar-holidays (append french-holiday)
      calendar-mark-holidays-flag t)
(setq calendar-mark-diary-entries-flag nil)

(setq TeX-master 'dwim)
(setq doc-view-scale-internally nil)

(defun bzg-find-bzg nil
  "Find the bzg.org file."
  (interactive)
  (find-file "~/org/bzg.org"))

(defun org-ibuffer ()
  "Open an `ibuffer' window showing only `org-mode' buffers."
  (interactive)
  (ibuffer nil "*Org Buffers*" '((used-mode . org-mode))))

(defun kill-line-save (&optional arg)
  "Save the rest of the line as if killed, but don't kill it."
  (interactive "P")
  (let ((buffer-read-only t))
    (kill-line arg)
    (message "Line(s) copied to the kill ring")))

(defun copy-line (&optional arg)
  "Copy the current line."
  (interactive "P")
  (copy-region-as-kill
   (point-at-bol)
   (+ (if kill-whole-line 1 0) (point-at-eol arg))))

(defun racket-enter! ()
  (interactive)
  (comint-send-string (scheme-proc)
        (format "(enter! (file \"%s\") #:verbose)\n" buffer-file-name))
  (switch-to-scheme t))

(defun unfill-paragraph ()
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive)
  (let ((fill-column (point-max)))
    (fill-paragraph nil)))
;; Handy key definition
(define-key global-map "\M-Q" 'unfill-paragraph)

(defun uniquify-all-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun uniquify-all-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

(defun my-copy-rectangle-to-primary ()
  (interactive)
  (when (region-active-p)
    (let ((text (mapconcat 'identity
                           (extract-rectangle
                            (region-beginning)
                            (region-end)) "\n")))
      (deactivate-mark) ;; lost 30mn because of this
      (x-set-selection 'PRIMARY text)
      (message "%s" text))))

(defun insert-xo () (interactive) (insert "⨰"))

(defun org-dblock-write:amazon (params)
  "Dynamic block for inserting the cover of a book."
  (interactive)
  (let* ((asin (plist-get params :asin))
         (tpl "<a href=\"http://www.amazon.fr/gp/product/%s/ref=as_li_qf_sp_asin_il?ie=UTF8&tag=bastguer-21&linkCode=as2&camp=1642&creative=6746&creativeASIN=%s\"><img border=\"0\" src=\"http://ws.assoc-amazon.fr/widgets/q?_encoding=UTF8&Format=_SL160_&ASIN=%s&MarketPlace=FR&ID=AsinImage&WS=1&tag=bastguer-21&ServiceVersion=20070822\" ></a><img src=\"http://www.assoc-amazon.fr/e/ir?t=bastguer-21&l=as2&o=8&a=%s\" width=\"1\" height=\"1\" border=\"0\" alt=\"\" style=\"border:none !important; margin:0px !important;\" />")
         (str (format tpl asin asin asin asin)))
    (insert "#+begin_html\n" str "\n#+end_html")))

(defun benchmark-two-defuns (defa defb)
  (interactive
   (list (intern (completing-read "First function: " obarray))
         (intern (completing-read "Second function: " obarray))))
  (message "%d"
           (/ (/ (car (benchmark-run 10 (funcall defa))) 10)
              (/ (car (benchmark-run 10 (funcall defb))) 10))))

(defun next-word-at-point (previous)
  "Jump to the next occurrence of the word at point."
  (interactive "P")
  (let* ((w (thing-at-point 'word))
         (w (mapconcat
             (lambda(c) (if (eq (char-syntax c) ?w)
                            (char-to-string c))) w ""))
         (wre (concat "\\<" w "\\>"))
         (s (if previous #'re-search-backward #'re-search-forward)))
    (unless previous (forward-word 1))
    (funcall s wre nil t)
    (unless previous (re-search-backward wre nil t))))

(defun previous-word-at-point ()
  "Jump to the previous occurrence of the word at point."
  (interactive)
  (next-word-at-point t))

(defun current-word-search ()
    "search forward for word under cursor"
    (interactive)
    (word-search-forward (current-word)))

(defun increase-srt (n)
  "Increase srt timestamp by N seconds."
  (interactive "p")
  (goto-char (point-min))
  (while (re-search-forward "\\([0-9]+:[0-9]+:[0-9]+\\)," nil t)
    (let ((s (save-match-data (org-hh:mm:ss-string-to-seconds (match-string 1)))))
      (replace-match (save-match-data (org-format-seconds "%.2h:%.2m:%.2s," (+ s n))) t t))))

(add-hook 'emacs-lisp-mode-hook 'turn-on-orgstruct++)
(add-hook 'emacs-lisp-mode-hook 'fontify-todo)
(add-hook 'emacs-lisp-mode-hook 'fontify-headline)

;; (add-hook 'emacs-lisp-mode-hook 'electric-pair-mode)
;; (add-hook 'emacs-lisp-mode-hook 'electric-indent-mode)
;; (add-hook 'emacs-lisp-mode-hook 'electric-layout-mode)

(defvar todo-comment-face 'todo-comment-face)
(defvar headline-face 'headline-face)

;; Fontifying todo items outside of org-mode
(defface todo-comment-face
  '((t (:background "#3f3f3f"
        :foreground "white"
        :weight bold
        :bold t)))
  "Face for TODO in code buffers."
  :group 'org-faces)

(defface headline-face
  '((t (:foreground "white"
        :background "#3f3f3f"
        :weight bold
        :bold t)))
  "Face for headlines."
  :group 'org-faces)

(defun fontify-todo ()
  (font-lock-add-keywords
   nil '((";;.*\\(TODO\\|FIXME\\)"
          (1 todo-comment-face t)))))

(defun fontify-headline ()
  (font-lock-add-keywords
   nil '(("^;;;;* ?\\(.*\\)\\>"
          (1 headline-face t)))))

(setq geiser-active-implementations '(racket))
(setq geiser-repl-startup-time 20000)

(setq magit-save-some-buffers 'dontask)
(setq magit-commit-all-when-nothing-staged 'ask)

;; Local variables:
;; eval: (orgstruct-mode 1)
;; orgstruct-heading-prefix-regexp: "^;;; +"
;; End:
