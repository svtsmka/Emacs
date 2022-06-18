;                                                                                         
;																										                               					
;							██╗██╗  ███████╗███╗░░░███╗░█████╗░░█████╗░░██████╗  ██╗██╗								
;							╚═╝╚═╝  ██╔════╝████╗░████║██╔══██╗██╔══██╗██╔════╝  ╚═╝╚═╝								
;							░░░░░░  █████╗░░██╔████╔██║███████║██║░░╚═╝╚█████╗░  ░░░░░░								
;							██╗██╗  ██╔══╝░░██║╚██╔╝██║██╔══██║██║░░██╗░╚═══██╗  ██╗██╗								
;							╚█║╚█║  ███████╗██║░╚═╝░██║██║░░██║╚█████╔╝██████╔╝  ╚█║╚█║								
;							░╚╝░╚╝  ╚══════╝╚═╝░░░░░╚═╝╚═╝░░╚═╝░╚════╝░╚═════╝░  ░╚╝░╚╝								
;																											                               				
;																											    	                            
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    Determining the type of system   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; System-type definition
(defun system-is-linux()
    (string-equal system-type "gnu/linux"))
(defun system-is-windows()
    (string-equal system-type "windows-nt"))

;; Start Emacs as a server
(when (system-is-linux)
    (require 'server)
    (unless (server-running-p)
        (server-start))) ;; run Emacs as server if OS - GNU/Linux

;; MS Windows path-variable
(when (system-is-windows)
    (setq win-init-path         "C:/.emacs.d")
    (setq win-init-ct-path      "C:/.emacs.d/plugins/color-theme")
    (setq win-init-ac-path      "C:/.emacs.d/plugins/auto-complete")
    (setq win-init-ac-dict-path "C:/.emacs.d/plugins/auto-complete/dict"))
	
	


;; Unix path-variable
(when (system-is-linux)
    (setq unix-init-path         "~/.emacs.d")
    (setq unix-init-ct-path      "~/.emacs.d/plugins/color-theme")
    (setq unix-init-ac-path      "~/.emacs.d/plugins/auto-complete")
    (setq unix-init-ac-dict-path "~/.emacs.d/plugins/auto-complete/dict"))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    Cursor options   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;	This frame setting controls how the cursor looks.
;;  cursor-type
;;  box -	 Display the completed box. (This is the default.)
;;  hollow - Show me an empty box.
;;  bar - 	 Display a vertical bar between characters.
;;  hbar - 	 Display a horizontal bar.
;;(setq-default cursor-type 'bar)


;;  Cursor color
;;(set-cursor-color "green")


;;  Turn off blinking cursor!
(if (fboundp 'blink-cursor-mode)
    (blink-cursor-mode -1))


;;  You might like this... the following code changes the color of the cursor on each blink
;; 	Using in Emacs 24.0 

;(defvar blink-cursor-colors (list  "#92c48f" "#6785c5" "#be369c" "#d9ca65")
;  "On each blink the cursor will cycle to the next color in this list.")

;(setq blink-cursor-count 0)
;(defun blink-cursor-timer-function ()
;  "Zarza wrote this cyberpunk variant of timer `blink-cursor-timer'. 
;Warning: overwrites original version in `frame.el'.

;This one changes the cursor color on each blink. Define colors in `blink-cursor-colors'."
;  (when (not (internal-show-cursor-p))
;    (when (>= blink-cursor-count (length blink-cursor-colors))
;      (setq blink-cursor-count 0))
;    (set-cursor-color (nth blink-cursor-count blink-cursor-colors))
;    (setq blink-cursor-count (+ 1 blink-cursor-count))
;    )
;  (internal-show-cursor nil (not (internal-show-cursor-p)))
;  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;    Key Mapping    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;  Unbind Ctrl+C because it's a modifier in Emacs:
(global-set-key (kbd "C-z") 'undefined)
(global-set-key (kbd "C-c") 'undefined)
(global-set-key (kbd "C-v") 'undefined)

;;  Bind Ctrl+C to copy:
;(global-set-key (kbd "C-c") 'kill-ring-save)
(define-key input-decode-map (kbd "C-c") (kbd "M-w"))

;;  Bind Ctrl+V to paste:
(global-set-key (kbd "C-v") 'yank)

;;  Unbind Ctrl+s because it's a modifier in Emacs:
(global-set-key (kbd "C-s") 'undefined)

;;  Save the current buffer to its file:
(global-set-key (kbd "C-s") 'save-buffer)

;;  Save the current buffer with the specified filename:
(global-set-key [(control shift s)] 'write-file)

;;  Cancel action:
(global-set-key (kbd "C-z") 'undo)

;;  Return actions:
(global-set-key (kbd "C-y") 'redo)

;;	Select All:Produces search results:
(global-set-key [(control f)] 'isearch-forward)


;;  Choose all:
(global-set-key (kbd "C-a") 'mark-whole-buffer)


;;  Open file:
(global-set-key (kbd "C-d") 'find-file)


;;  Go to line:
(global-set-key (kbd "C-g")  'goto-line)


;;  Bind dired-jump:
(global-set-key (kbd "C-p") 'dired-jump)


;; Remap cursor keys:
;;  Keys for moving the cursor under the home row of the right hand:
;
(global-set-key (kbd "M-i") 'previous-line)     ;;M-i   Pevious line
(global-set-key (kbd "M-j") 'backward-char)     ;;M-j   Backward char
(global-set-key (kbd "M-k") 'next-line)         ;;M-k   Next line
(global-set-key (kbd "M-l") 'forward-char)      ;;M-l   Forward char

(global-set-key (kbd "M-u") 'backward-word)     ;;M-u   Backward word
(global-set-key (kbd "M-o") 'forward-word)      ;;M-o   Forward word

(global-set-key (kbd "M-SPC") 'set-mark-command);;M-SPC set-mark-command   


(keyboard-translate ?\C-i ?\H-i)
(global-set-key [?\H-i] (lambda () (interactive) (previous-line 5)))  	;; Previous line +5 lines
(global-set-key (kbd "C-k") (lambda () (interactive) (next-line 5)))    ;; Previous line -5 lines


(global-set-key (kbd "C-l") 'forward-word)         ;; Forward word
(global-set-key (kbd "C-j") 'backward-word)        ;; Backward word


;;  Open frequently used files
;;  Here are examples of defining keys to open frequently used files.
(global-set-key
 (kbd "<f8> <f8>")
 (lambda ()
   (interactive)
   (find-file "~/.emacs.d/my-keybinding.el")))

(global-set-key
 (kbd "<f8> <f7>")
 (lambda ()
   (interactive)
   (find-file "~/web/my-unicode-template.html")))

(global-set-key
 (kbd "<f8> <f6>")
 (lambda ()
   (interactive)
   (find-file "~/todo.org")))


;; Search using arrow keys	;;

(progn
  ;; Set arrow keys in search. left / right - back / forward, up / down - history. press return to exit
  (define-key isearch-mode-map (kbd "<up>") 'isearch-ring-retreat )
  (define-key isearch-mode-map (kbd "<down>") 'isearch-ring-advance )

  (define-key isearch-mode-map (kbd "<left>") 'isearch-repeat-backward)
  (define-key isearch-mode-map (kbd "<right>") 'isearch-repeat-forward)

  (define-key minibuffer-local-isearch-map (kbd "<left>") 'isearch-reverse-exit-minibuffer)
  (define-key minibuffer-local-isearch-map (kbd "<right>") 'isearch-forward-exit-minibuffer))


;;  Create Split and Delete Window

(global-set-key (kbd "M-s") 'other-window)                  ;;  Another window
(global-set-key (kbd "M-a") 'prev-window)                   ;;  Previous window

(global-set-key (kbd "C-x 0") 'delete-window)               ;;  Delete window
(global-set-key (kbd "C-x <kp-1>") 'delete-other-windows)   ;;  Delete all windows in the selected frame
(global-set-key (kbd "C-x d") 'split-window-right)          ;;  Split window on the right
(global-set-key (kbd "C-x w") 'split-window-below)          ;;  Split window at the bottom


;; Ctrl + Mouse wheel zoom font
(global-set-key (kbd "<C-wheel-up>") 'text-scale-increase)
(global-set-key (kbd "<C-wheel-down>") 'text-scale-decrease)

;; Destruction of the current buffer
(global-set-key (kbd "C-x k") 'kill-buffer)	

;; Kill all buffers except the current buffer
(global-set-key (kbd "C-M-k") 'kill-other-buffers)	
(defun kill-other-buffers ()
    "kill all other buffers."
     (interactive)
     (mapc 'kill-buffer (delq (current-buffer) (buffer-list))))



;; Removal and destruction

(global-set-key (kbd "C-DEL") 'delete-backward-char)			;; Delete previous character
(global-set-key (kbd "M-DEL") 'delete-char)						;; Delete next character
(define-key global-map [(shift backspace)] 'kill-whole-line)	;; Delete the entire line


;;	Erase buffer
(global-set-key (kbd "C-x e") #'erase-buffer)


;;;;   bookmarks	;;;;

;;  Set a bookmark with a name
(global-set-key (kbd "C-h") 'bookmark-set)

;;	List of all bookmarks
(global-set-key (kbd "C-b") 'list-bookmarks)



;;	Move current line up or down
(global-set-key [(meta up)]  'move-line-up)
(global-set-key [(meta down)]  'move-line-down)

(defun move-line-up ()
  "Move up the current line."
  (interactive)
  (transpose-lines 1)
  (forward-line -2)
  (indent-according-to-mode))

(defun move-line-down ()
  "Move down the current line."
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1)
  (indent-according-to-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Toggle current comment line    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key (kbd "M-;") 'xah-comment-dwim)  ;; Bind


(defun xah-comment-dwim ()
  "Like `comment-dwim', but toggle comment if cursor is not at end of line.

URL `http://xahlee.info/emacs/emacs/emacs_toggle_comment_by_line.html'
Version 2016-10-25"
  (interactive)
  (if (region-active-p)
      (comment-dwim nil)
    (let (($lbp (line-beginning-position))
          ($lep (line-end-position)))
      (if (eq $lbp $lep)
          (progn
            (comment-dwim nil))
        (if (eq (point) $lep)
            (progn
              (comment-dwim nil))
          (progn
            (comment-or-uncomment-region $lbp $lep)
            (forward-line )))))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Next/Previous User Buffer    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Commands for switching to the previous/next buffer.
(global-set-key (kbd "M-,") 'xah-previous-user-buffer)
(global-set-key (kbd "M-.") 'xah-next-user-buffer)


;;  List of existing buffers:
(global-set-key (kbd "M-m")  'list-buffers)


(defun xah-next-user-buffer ()
  "Switch to the next user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://xahlee.info/emacs/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(defun xah-previous-user-buffer ()
  "Switch to the previous user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://xahlee.info/emacs/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))


(defun xah-user-buffer-q ()
  "Return t if current buffer is a user buffer, else nil.
Typically, if buffer name starts with *, it's not considered a user buffer.
This function is used by buffer switching command and close buffer command, so that next buffer shown is a user buffer.
You can override this function to get your idea of “user buffer”.
version 2016-06-18"
  (interactive)
  (if (string-equal "*" (substring (buffer-name) 0 1))
      nil
    (if (string-equal major-mode "dired-mode")
        nil
      t
      )))


(defun xah-next-emacs-buffer ()
  "Switch to the next emacs buffer.
“emacs buffer” here is buffer whose name starts with *.
URL `http://xahlee.info/emacs/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
      (setq i (1+ i)) (next-buffer))))

(defun xah-previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
“emacs buffer” here is buffer whose name starts with *.
URL `http://xahlee.info/emacs/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
      (setq i (1+ i)) (previous-buffer))))




;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   New Empty Buffer    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key (kbd "C-n") 'xah-new-empty-buffer)  ;; Bind

(defun xah-new-empty-buffer ()
  "Create a new empty buffer.
New buffer will be named “untitled” or “untitled<2>”, “untitled<3>”, etc.

It returns the buffer (for elisp programing).

URL `http://xahlee.info/emacs/emacs/emacs_new_empty_buffer.html'
Version 2017-11-01"
  (interactive)
  (let (($buf (generate-new-buffer "untitled")))
    (switch-to-buffer $buf)
    (funcall initial-major-mode)
    (setq buffer-offer-save t)
    $buf
    ))
	


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Smart open line    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(defun smart-open-line ()
  "Insert an empty line after the current line.
Position the cursor at its beginning, according to the current mode."
  (interactive)
  (move-end-of-line nil)
  (newline-and-indent))

(global-set-key [(shift return)] #'smart-open-line)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Copy filename to clipboard    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key [(meta shift c)] 'copy-file-name-to-clipboard)   

(defun copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename)
      (message "Copied buffer file name '%s' to the clipboard." filename))))
	  
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Rename file and buffer    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(global-set-key (kbd "M-<f2>")  #'er-rename-file-and-buffer)

(defun er-rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))
		  


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Appearance settings    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;	Disable GUI Components


(menu-bar-mode     -1) 	   	      ;; Disable graphical menu
(tool-bar-mode     -1)			  ;; Disable tool-bar
(scroll-bar-mode   -1) 		 	  ;; Disable scroll bar
(setq use-dialog-box     nil)	  ;; No graphical dialogs and windows - everything through the minibuffer
(setq redisplay-dont-pause t)	  ;; Better buffer rendering
(setq ring-bell-function 'ignore) ;; Turn off the beep


(global-set-key (kbd "C-1") 'menu-bar-mode)
(global-set-key (kbd "C-2") 'tool-bar-mode)
(global-set-key (kbd "C-3") 'scroll-bar-mode)

;;	Hints
;(tooltip-mode -1)


;;	To load a theme on startup
(load-theme 'alect-black t)
(require 'moe-theme)

;;  List of other topics
;;  alect-light, alect-dark, alect-light, alect-black, alect-light, alect-dark
;;  alect-dark (default), alect-dark (modified), alect-light-alt (modified), alect-dark-alt (modified)


(require 'powerline)
(powerline-default-theme)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Other    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(setq make-backup-files nil) ;;	Remove # on files

;; Disable file backup/autosave
(setq make-backup-files        nil)
(setq auto-save-default        nil)
(setq auto-save-list-file-name nil)

;; Store all backups and autosave files in the "tmp" directory
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Display the name of the current buffer in the title bar
(setq frame-title-format "GNU Emacs: %b")

;; Show parent mode settings
(show-paren-mode t) 				;; enable expression highlighting between {},[],()
(setq show-paren-style 'expression) ;; highlight expressions between {},[],()

;; Electric mode settings:
(electric-pair-mode    1) ;; auto-closing {},[],() with cursor translation inside brackets
(electric-indent-mode -1) ;; disable electric-indent-mode om indentation (default in Emacs-24.4)

;; Delete selection
(delete-selection-mode t)


;; Linum plugin
(require 'linum) 			;; Call Linum
(line-number-mode   t) 		;; show line number in mode-line
(global-linum-mode  t) 		;; show line numbers in all buffers
(column-number-mode t) 		;; show column number in mode-line
(setq linum-format " %d") 	;; set the line numbering format


;; Fringe settings
;(fringe-mode '(8 . 0)) ;; text delimiter left only
;(setq-default indicate-empty-lines t) ;; the absence of a line is highlighted with glyphs next to the strip with the line number
;(setq-default indicate-buffer-boundaries 'left) ;; indication only on the left

;; Display file size/time in mode-line
(setq display-time-24hr-format t) ;; 24-hour time format in mode-line
(display-time-mode             t) ;; show clock in mode-line
(size-indication-mode          t) ;; file size in %


;; Code highlighting:
(require 'font-lock)
(global-font-lock-mode             t) ;; included since Emacs-22.
(setq font-lock-maximum-decoration t)


;; Padding settings:
;;(setq-default indent-tabs-mode nil)	;; Disable the ability to indent TAB
(setq-default tab-width          4) 	;; Tab width - 4 space characters
(setq-default c-basic-offset     4)		;; Customizing Indentation
(setq-default standart-indent    4) 	;; Default indent width is 4 whitespace characters
(setq-default lisp-body-indent   4) 	;; Shift Lisp expressions by 4 whitespace characters
(global-set-key (kbd "RET") 'newline-and-indent) ;; When you press "Enter", move the carriage and indent
(setq lisp-indent-function  'common-lisp-indent-function)

;;	Short messages:
(defalias 'yes-or-no-p 'y-or-n-p)

;; Shared clipboard with OS:
(setq x-select-enable-clipboard t)

;; Don't always endlessly ask yes or no, why not use y / n
(fset 'yes-or-no-p 'y-or-n-p)


;; Dired
(require 'dired)
(setq dired-recursive-deletes 'top) ;; To delete a folder, hover over that folder, press "d" then "x"


;;	Highlight matching brackets
(require 'paren)
(setq show-paren-style 'parenthesis)
(show-paren-mode +1)

;;	Select current line
;(global-hl-line-mode +1)

;;	Process management with proced
;(global-set-key (kbd "C-x p") #'proced)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Coding system settings    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Coding-system settings
(set-language-environment 'UTF-8)
(if (system-is-linux) ;; for GNU/Linux encoding utf-8, для MS Windows - windows-1251
    (progn
        (setq default-buffer-file-coding-system 'utf-8)
        (setq-default coding-system-for-read    'utf-8)
        (setq file-name-coding-system           'utf-8)
        (set-selection-coding-system            'utf-8)
        (set-keyboard-coding-system        'utf-8-unix)
        (set-terminal-coding-system             'utf-8)
        (prefer-coding-system                   'utf-8))
    (progn
        (prefer-coding-system                   'windows-1251)
        (set-terminal-coding-system             'windows-1251)
        (set-keyboard-coding-system        'windows-1251-unix)
        (set-selection-coding-system            'windows-1251)
        (setq file-name-coding-system           'windows-1251)
        (setq-default coding-system-for-read    'windows-1251)
        (setq default-buffer-file-coding-system 'windows-1251)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Compile and run    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Run C programs directly from within emacs
(defun execute-c-program ()
  (interactive)
  (defvar foo)
  (setq foo (concat "gcc " (buffer-name) " && a.exe" )) ;; Compile arguments
  (shell-command foo))

(global-set-key [f5] 'execute-c-program)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Plugins    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;;;;;;;;;    Melpa    ;;;;;;;;;;



(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)



;;;;;;;;;;    Auto-Complete    ;;;;;;;;;;



(global-ede-mode 1)		; Enable the Project management system
(semantic-mode)
(global-semantic-idle-completions-mode)

; start auto-complete with emacs
;; Auto-complete plugin <http://www.emacswiki.org/emacs/AutoComplete>
(require 'auto-complete)
; do default config for auto-complete
(require 'auto-complete-config)
(ac-config-default)

(defun ac-init()
    (require 'auto-complete-config)
    (ac-config-default)
    (if (system-is-windows)
        (add-to-list 'ac-dictionary-directories win-init-ac-dict-path)
        (add-to-list 'ac-dictionary-directories unix-init-ac-dict-path))
    (setq ac-auto-start        t)
    (setq ac-auto-show-menu    t)
    (global-auto-complete-mode t)
    (add-to-list 'ac-modes   'lisp-mode)
    (add-to-list 'ac-sources 'ac-source-semantic) ;; искать автодополнения в CEDET
    (add-to-list 'ac-sources 'ac-source-variables) ;; среди переменных
    (add-to-list 'ac-sources 'ac-source-functions) ;; в названиях функций
    (add-to-list 'ac-sources 'ac-source-dictionary) ;; в той папке где редактируемый буфер
    (add-to-list 'ac-sources 'ac-source-words-in-all-buffer) ;; по всему буферу
    (add-to-list 'ac-sources 'ac-source-files-in-current-dir))
(if (system-is-windows)
    (when (file-directory-p win-init-ac-path)
        (add-to-list 'load-path win-init-ac-path)
        (ac-init))
    (when (file-directory-p unix-init-ac-path)
        (add-to-list 'load-path unix-init-ac-path)
        (ac-init)))


 


;;;;;;;;;;    yasnippet    ;;;;;;;;;;



; start yasnippet with emacs
(require 'yasnippet)
(yas-global-mode 1)

(yas-reload-all)
(add-hook 'prog-mode-hook #'yas-minor-mode)


;;;;;;;;;;    Auto-Complete-C-Headers    ;;;;;;;;;;


; let's define a function which initializes auto-complete-c-headers and gets called for c/c++ hooks
(defun my:ac-c-header-init ()
  (require 'auto-complete-c-headers)
  (add-to-list 'ac-sources 'ac-source-c-headers)
  (add-to-list 'achead:include-directories '" c:\mingw\bin\../lib/gcc/mingw32/6.3.0/include/c++
 c:\mingw\bin\../lib/gcc/mingw32/6.3.0/include/c++/mingw32
 c:\mingw\bin\../lib/gcc/mingw32/6.3.0/include/c++/backward
 c:\mingw\bin\../lib/gcc/mingw32/6.3.0/include
 c:\mingw\bin\../lib/gcc/mingw32/6.3.0/../../../../include
 c:\mingw\bin\../lib/gcc/mingw32/6.3.0/include-fixed
 c:\mingw\bin\../lib/gcc/mingw32/6.3.0/../../../../mingw32/include")
)

; now let's call this function from c/c++ hooks
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)



;;;;;;;;;;    Imenu    ;;;;;;;;;;



;; Imenu
(require 'imenu)
(setq imenu-auto-rescan      t) 							;; Automatically update the list of functions in the buffer
(setq imenu-use-popup-menu nil)								;; Imenu dialogs in minibuffer only
(global-set-key (kbd "<f6>") 'imenu) 						;; Calling Imenu on F6
(global-set-key (kbd "<f7>") #'imenu-list-smart-toggle)		;; Imenu-list


;;;;;;;;;;    Neotree    ;;;;;;;;;;



(require 'neotree)
(global-set-key [f3] 'neotree-toggle)

;;	Конфигурация темы
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
