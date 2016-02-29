;;; Org-mode
(prelude-require-packages '(ob-ipython org-bullets))

(require 'ob-ipython)

(add-hook 'org-mode-hook
          (lambda () (visual-line-mode 1)))


(setq org-default-notes-file "~/Documents/org/capture.org")
(setq org-agenda-files '("~/Documents/org/"))
(setq org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)))

(setq org-startup-indented t)
(setq org-startup-folded 'content)
(setq org-pretty-entities t)
(define-key global-map "\C-cc" 'org-capture)

(setq org-tag-alist '((:startgroup . nil)
                      ("advectas" . ?a) ("crawlica" . ?c) ("dator" . ?d) ("privat" . ?p)
                      (:endgroup . nil)))

(setq org-agenda-custom-commands
      '(("X" "Unscheduled"
       ( (todo "TODO"
               (
                (org-agenda-skip-function '(org-agenda-skip-entry-if 'scheduled 'deadline ))
                )
               )
         )
       )))

(setq org-capture-templates
    '(("j" "Journal Entry" entry
       (file+headline "~/Documents/org/journal.org" "2016")
       "\n** %T\n*** Tankar\n:PROPERTIES:\n:Mood: \n:MComment: \n:Yesterday: \n:YComment: \n:END:\n\n*** Agenda\n- [ ] \n\n*** Tacksam\n- \n" :prepend t)
      ("t" "new Task" entry
       (file+headline "~/Documents/org/capture.org" "Tasks")
       "\n** TODO \nCREATED: %U" :prepend t)
      ))

(require 'org-feed)
(setq org-feed-alist
      '(("Toodledo"
         "http://www.toodledo.com/id/td56b77f380e0a9/rss.php"
         "~/Documents/org/toodledo.org" "Tasks")))
(org-feed-update-all)

(setq org-src-fontify-natively t)

(setq org-confirm-babel-evaluate nil);don't prompt me to confirm everytime I want to evaluate a block

;;; display/update images in the buffer after I evaluate
(add-hook 'org-babel-after-execute-hook 'org-display-inline-images 'append)

(global-prettify-symbols-mode 1)
(add-hook 'org-mode-hook
            (lambda () (progn
                         (push '("- [X]" . "✓") prettify-symbols-alist)
                         (push '("- [ ]" . "✗") prettify-symbols-alist)
                         (push '(":Mood:" . "☺") prettify-symbols-alist)
                         (push '(":MComment:" . "✉") prettify-symbols-alist)
                         (push '(":Yesterday:" . "⚒") prettify-symbols-alist)
                         (push '(":YComment:" . "✎") prettify-symbols-alist)
                         (push '(":PROPERTIES:" . "⟶") prettify-symbols-alist)
                         (push '(":END:" . "⟵") prettify-symbols-alist)
              )))


(setq org-log-done 'time)

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(defun org-archive-done-tasks ()
  (interactive)
  (org-map-entries
   (lambda ()
     (org-archive-subtree)
     (setq org-map-continue-from (outline-previous-heading)))
   "/DONE" 'tree))

(setq prelude-flyspell nil)

(setq org-icalendar-use-scheduled '(todo-start event-if-todo))
