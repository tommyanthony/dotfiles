(defun pytest-accept-diffs-with-fn (pytest_fn)
  (interactive)
  (setenv "EXPECTTEST_ACCEPT" "1")
  (call-interactively pytest_fn)
  (setenv "EXPECTTEST_ACCEPT"))

(defun pytest-accept-all-diffs ()
  (interactive)
  (pytest-accept-diffs-with-fn 'python-pytest))

(defun pytest-accept-diffs-file-dwim ()
  (interactive)
  (pytest-accept-diffs-with-fn 'python-pytest-file-dwim))

(defun pytest-accept-diffs-repeat ()
  (interactive)
  (pytest-accept-diffs-with-fn 'python-pytest-repeat))

(map! :after python :map python-mode-map
      (:localleader
       :nv "tf" 'python-pytest-file-dwim
       :nv "tF" 'pytest-accept-diffs-file-dwim
       :nv "ta" 'python-pytest
       :nv "tA" 'pytest-accept-all-diffs
       :nv "tr" 'python-pytest-repeat
       :nv "tR" 'pytest-accept-diffs-repeat

       ))
