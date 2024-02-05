;;; sweetpastel-theme.el --- inspired by Atom One Dark -*- lexical-binding: t; no-byte-compile: t; -*-
;;
;; Added: May 23, 2016 (28620647f838)
;; Author: Henrik Lissner <https://github.com/hlissner>
;; Maintainer: Henrik Lissner <https://github.com/hlissner>
;; Source: https://github.com/atom/one-dark-ui
;;
;;; Commentary:
;;
;; This themepack's flagship theme.
;;
;;; Code:

(require 'doom-themes)


;;
;;; Variables

(defgroup sweetpastel-theme nil
  "Options for the `sweetpastel' theme."
  :group 'doom-themes)

(defcustom sweetpastel-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'sweetpastel-theme
  :type 'boolean)

(defcustom sweetpastel-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'sweetpastel-theme
  :type 'boolean)

(defcustom sweetpastel-comment-bg sweetpastel-brighter-comments
  "If non-nil, comments will have a subtle highlight to enhance their
legibility."
  :group 'sweetpastel-theme
  :type 'boolean)

(defcustom sweetpastel-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'sweetpastel-theme
  :type '(choice integer boolean))


;;
;;; Theme definition

(def-doom-theme sweetpastel
                "A dark theme inspired by Atom One Dark."

                ;; name        default   256           16
                ((bg         '("black" "black"       "black"  ))
                 (fg         '("white" "white"     "white"  ))

                 ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
                 ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
                 ;; or region), especially when paired with the `doom-darken', `doom-lighten',
                 ;; and `doom-blend' helper functions.
                 (bg-alt     '("black" "black"       "black"        ))
                 (fg-alt     '("#F8F9FA" "#EEEFF0"     "white"        ))

                 ;; These should represent a spectrum from bg to fg, where base0 is a starker
                 ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
                 ;; dark grey, base0 should be white and base8 should be black.
                 (base0      '("#1B2229" "black"       "black"        ))
                 (base1      '("#1c1f24" "#1e1e1e"     "brightblack"  ))
                 (base2      '("#202328" "#2e2e2e"     "brightblack"  ))
                 (base3      '("#23272e" "#262626"     "brightblack"  ))
                 (base4      '("#3f444a" "#3f3f3f"     "brightblack"  ))
                 (base5      '("#F8F9FA" "#525252"     "brightblack"  ))
                 (base6      '("#73797e" "#6b6b6b"     "brightblack"  ))
                 (base7      '("#9ca0a4" "#979797"     "brightblack"  ))
                 (base8      '("#DFDFDF" "#dfdfdf"     "white"        ))

                 (grey       base4)
                 (red        '("#E5A3A1" "#F9B7B5" "red"          ))
                 (orange     '("#e5c5a0" "#f9dab6" "brightred"    ))
                 (green      '("#B4E3AD" "#C8F7C1" "green"        ))
                 (teal       '("#A3CBE7" "#B7DFFB" "brightgreen"  ))
                 (yellow     '("#ECE3B1" "#FFF7C5" "yellow"       ))
                 (blue       '("#A3CBE7" "#B7DFFB" "brightblue"   ))
                 (dark-blue  '("#a4aae8" "#b6bcf9" "blue"         ))
                 (magenta    '("#e8abe4" "#fcbff8" "brightmagenta"))
                 (violet     '("#CEACE8" "#E2C0FC" "magenta"      ))
                 (cyan       '("#c9eeff" "#ddf8ff" "brightcyan"   ))
                 (dark-cyan  '("#c9eeff" "#dde7ff" "cyan"         ))

                 ;; These are the "universal syntax classes" that doom-themes establishes.
                 ;; These *must* be included in every doom themes, or your theme will throw an
                 ;; error, as they are used in the base theme defined in doom-themes-base.
                 (highlight      blue)
                 (vertical-bar   (doom-darken base1 0.1))
                 (selection      dark-blue)
                 (builtin        magenta)
                 (comments       (doom-darken base5 0.6))
                 (doc-comments   (doom-darken base5 0.4))
                 (constants      violet)
                 (functions      magenta)
                 (keywords       blue)
                 (methods        cyan)
                 (operators      blue)
                 (type           yellow)
                 (strings        green)
                 (variables      (doom-lighten magenta 0.4))
                 (numbers        orange)
                 (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
                 (error          red)
                 (warning        yellow)
                 (success        green)
                 (vc-modified    orange)
                 (vc-added       green)
                 (vc-deleted     red)

                 ;; These are extra color variables used only in this theme; i.e. they aren't
                 ;; mandatory for derived themes.
                 (modeline-fg              fg)
                 (modeline-fg-alt          base5)
                 (modeline-bg              (if sweetpastel-brighter-modeline
                                               (doom-darken blue 0.45)
                                             (doom-darken bg-alt 0.1)))
                 (modeline-bg-alt          (if sweetpastel-brighter-modeline
                                               (doom-darken blue 0.475)
                                             `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
                 (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
                 (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

                 (-modeline-pad
                  (when sweetpastel-padded-modeline
                    (if (integerp sweetpastel-padded-modeline) sweetpastel-padded-modeline 4))))


  ;;;; Base theme face overrides
                (((line-number &override) :foreground base4)
                 ((line-number-current-line &override) :foreground fg)
                 ((font-lock-comment-face &override)
                  :background (if sweetpastel-comment-bg (doom-lighten bg 0.05) 'unspecified))
                 (mode-line
                  :background modeline-bg :foreground modeline-fg
                  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
                 (mode-line-inactive
                  :background modeline-bg-inactive :foreground modeline-fg-alt
                  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
                 (mode-line-emphasis :foreground (if sweetpastel-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
                 (css-proprietary-property :foreground orange)
                 (css-property             :foreground green)
                 (css-selector             :foreground blue)
   ;;;; doom-modeline
                 (doom-modeline-bar :background (if sweetpastel-brighter-modeline modeline-bg highlight))
                 (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
                 (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
                 (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
                 (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
                 (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
                 (font-latex-math-face :foreground green)
   ;;;; markdown-mode
                 (markdown-markup-face :foreground base5)
                 (markdown-header-face :inherit 'bold :foreground red)
                 ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
                 (rjsx-tag :foreground red)
                 (rjsx-attr :foreground orange)
   ;;;; solaire-mode
                 (solaire-mode-line-face
                  :inherit 'mode-line
                  :background modeline-bg-alt
                  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
                 (solaire-mode-line-inactive-face
                  :inherit 'mode-line-inactive
                  :background modeline-bg-inactive-alt
                  :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt))))

  ;;;; Base theme variable overrides-
                ())

;;; sweetpastel-theme.el ends here
