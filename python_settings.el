(add-hook 'python-mode 'run-python)
(require 'company-anaconda)
(eval-after-load "company"
  '(progn
     (add-to-list 'company-backends 'company-anaconda)))

(add-hook 'python-mode-hook 'anaconda-mode)
(add-hook 'python-mode-hook 'anaconda-eldoc-mode)

(require 'py-yapf)
(add-hook 'python-mode-hook 'py-yapf-enable-on-save)
