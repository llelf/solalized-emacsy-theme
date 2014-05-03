;;; solarized-emacsy-theme.el

;; Copyright (c) 2013 Antonio Nikishaev <a@lelf.me>
;; Licensed under MIT license.

;; Description: solarized theme that uses colours similar to standard
;; Emacs ones, therefore suck less.  Created after frustration with
;; other solarized themes.

;; This is uncomplete and only for light background.

;; Solarized colour definitions.
;; (Stolen from https://github.com/altercation/solarized)
(defvar solarized-emacsy-colors
  ;; name     sRGB      Gen RGB   256       16              8
  '((base03  "#002b36" "#042028" "#1c1c1c" "brightblack"   "black")
    (base02  "#073642" "#0a2832" "#262626" "black"         "black")
    (base01  "#586e75" "#465a61" "#585858" "brightgreen"   "green")
    (base00  "#657b83" "#52676f" "#626262" "brightyellow"  "yellow")
    (base0   "#839496" "#708183" "#808080" "brightblue"    "blue")
    (base1   "#93a1a1" "#81908f" "#8a8a8a" "brightcyan"    "cyan")
    (base2   "#eee8d5"   "#e9e2cb" "#e4e4e4" "white"         "white")
    (base3   "#fdf6e3"   "#fcf4dc" "#ffffd7" "brightwhite"   "white")
    (yellow  "#b58900"   "#a57705" "#af8700" "yellow"        "yellow")
    (orange  "#cb4b16"   "#bd3612" "#d75f00" "brightred"     "red")
    (red     "#dc322f"    "#c60007" "#d70000" "red"           "red")
    (magenta "#d33682"    "#c61b6e" "#af005f" "magenta"       "magenta")
    (violet  "#6c71c4"    "#5859b7" "#5f5faf" "brightmagenta" "magenta")
    (blue    "#268bd2"    "#2075c7" "#0087ff" "blue"          "blue")
    (cyan    "#2aa198"    "#259185" "#00afaf" "cyan"          "cyan")
    (green   "#859900"    "#728a05" "#5f8700" "green"         "green")))


;; Out theme facedefs
(defun solarized-emacsy-facedefs ()
  (cl-flet ((c (color) (cadr (assoc color solarized-emacsy-colors))))
    (let ((defs
	    '((default :background base2 :foreground base00)
	      (font-lock-comment-face :foreground red)
	      (font-lock-string-face :foreground orange)
	      (font-lock-function-name-face :foreground blue)
	      (font-lock-variable-name-face :foreground yellow)
	      (font-lock-type-face :foreground cyan)
	      (font-lock-builtin-face :foreground yellow)
	      (font-lock-keyword-face :foreground magenta)
	      (font-lock-constant-face :foreground green)

	      (gnus-cite-1 :foreground violet)
	      (gnus-cite-2 :foreground red)
	      (gnus-group-news-2 :foreground cyan :weight bold)
	      (gnus-group-news-2-empty :foreground cyan)

	      (agda2-highlight-keyword-face :foreground yellow)
	      (agda2-highlight-module-face :foreground magenta)
	      (agda2-highlight-primitive-type-face :foreground violet)
	      (agda2-highlight-datatype-face :foreground violet)
	      (agda2-highlight-record-face :foreground violet)
	      (agda2-highlight-function-face :foreground blue)
	      (agda2-highlight-symbol-face :foreground base00)
	      (agda2-highlight-inductive-constructor-face :foreground cyan)

	      (fringe :background base2 :foreground base00)
	      (scroll-bar :background base2 :foreground base00)
	      (minibuffer :foreground base03)
	      (echo-area :foreground base03)
	      )))
      (mapcar (lambda (def)
		(let ((face (car def))
		      (value (mapcar (lambda (s) (or (c s) s))
				     (cdr def))))
		  `(,face ((t ,@value)))))
	    defs))))

(deftheme solarized-emacsy)

(apply 'custom-theme-set-faces 'solarized-emacsy (solarized-emacsy-facedefs))

(provide-theme 'solarized-emacsy)

