;;; util.el -*- lexical-binding: t; -*-

(defun move-buffer-to-window (windownum)
  "Moves a buffer to a window, using the spacemacs numbering. follow-focus-p
  controls whether focus moves to new window (with buffer), or stays on current"
  (interactive)
  (if (> windownum (length (window-list-1 nil nil t)))
      (message "No window numbered %s" windownum)
    (let ((b (current-buffer))
          (w1 (selected-window))
          (w2 (winum-get-window-by-number windownum)))
      (unless (eq w1 w2)
        (set-window-buffer w2 b)
        (switch-to-prev-buffer)
        (unrecord-window-buffer w1 b))
      ;; Uncomment if you want to also move the cursor.
      (select-window (winum-get-window-by-number windownum))
      )))

(defun alternate-buffer (&optional window)
  "Switch back and forth between current and last buffer in the
current window."
  (interactive)
  (cl-destructuring-bind (buf start pos)
      (let ((buffer-list (persp-buffer-list))
            (my-buffer (window-buffer window)))
        ;; find buffer of the same persp in window
        (seq-find (lambda (it) ;; predicate
                    (and (not (eq (car it) my-buffer))
                         (member (car it) buffer-list)))
                  (window-prev-buffers)
                  ;; default if found none
                  (list nil nil nil)))
    (if (not buf)
        (message "Last buffer not found.")
      (set-window-buffer-start-and-point window buf start pos))))
(defun copy-file-name ()
  "Copy and show the file name of the current buffer."
  (interactive)
  (if-let* ((file-name (file-name-nondirectory buffer-file-name)))
      (progn
        (kill-new file-name)
        (message "%s" file-name))
    (message "WARNING: Current buffer is not attached to a file!")))
