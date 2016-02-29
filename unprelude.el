(prelude-require-packages '(base16-theme powerline))

(load-theme 'base16-tomorrow-dark t)
(setq whitespace-style '(face tabs trailing space-before-tab indentation empty space-after-tab tab-mark))

(global-set-key [S-prior] 'winner-undo)
(global-set-key [S-next] 'winner-redo)

(add-to-list 'default-frame-alist '(height . 80))
(add-to-list 'default-frame-alist '(width . 160))

(yas-global-mode 1)

;(require 'powerline)
;(powerline-default-theme)
