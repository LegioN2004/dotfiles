(setq package-enable-at-startup nil)
(setq package-user-dir (locate-user-emacs-file
                        (concat
                         (file-name-as-directory "elpa")
                         emacs-version)))
