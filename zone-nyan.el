(require 'esxml)


;;; helpers

(defvar zone-nyan-white  "#ffffff")
(defvar zone-nyan-gray   "#999999")
(defvar zone-nyan-black  "#000000")
(defvar zone-nyan-indigo "#003366")

(defvar zone-nyan-red    "#ff0000")
(defvar zone-nyan-orange "#ff9900")
(defvar zone-nyan-yellow "#ffff00")
(defvar zone-nyan-green  "#33ff00")
(defvar zone-nyan-cyan   "#0099ff")
(defvar zone-nyan-violet "#6633ff")

(defvar zone-nyan-rose   "#ff99ff")
(defvar zone-nyan-pink   "#ff3399")
(defvar zone-nyan-rouge  "#ff9999")
(defvar zone-nyan-bread  "#ffcc99")

(defun zone-nyan-scale (window-width window-height)
  (/ (min window-width window-height) 70))

(defun zone-nyan-svg (width height scale x-offset y-offset &rest body)
  `(svg (@ (xmlns "http://www.w3.org/2000/svg")
           (width ,(number-to-string width))
           (height ,(number-to-string height)))
        (g (@ (transform ,(format "translate(%s,%s) scale(%s)"
                                  x-offset y-offset scale)))
           ,@body)))
(put 'zone-nyan-svg 'lisp-indent-function 5)

(defun zone-nyan-group (x y &rest body)
  `(g (@ (transform ,(format "translate(%s,%s)" x y)))
      ,@body))
(put 'zone-nyan-group 'lisp-indent-function 2)

(defun zone-nyan-rect (x y width height fill)
  `(rect (@ (x ,(number-to-string x))
            (y ,(number-to-string y))
            (width ,(number-to-string width))
            (height ,(number-to-string height))
            (fill ,fill))))

(defun zone-nyan-pixel (x y fill)
  (zone-nyan-rect x y 1 1 fill))


;;; components

(defun zone-nyan-rainbow (x y flip)
  (if flip
      (zone-nyan-group x y
        (zone-nyan-rect  0  0 2 3 zone-nyan-red)
        (zone-nyan-rect  2  1 8 3 zone-nyan-red)
        (zone-nyan-rect 10  0 8 3 zone-nyan-red)
        (zone-nyan-rect 18  1 8 3 zone-nyan-red)

        (zone-nyan-rect  0  3 2 3 zone-nyan-orange)
        (zone-nyan-rect  2  4 8 3 zone-nyan-orange)
        (zone-nyan-rect 10  3 8 3 zone-nyan-orange)
        (zone-nyan-rect 18  4 8 3 zone-nyan-orange)

        (zone-nyan-rect  0  6 2 3 zone-nyan-yellow)
        (zone-nyan-rect  2  7 8 3 zone-nyan-yellow)
        (zone-nyan-rect 10  6 8 3 zone-nyan-yellow)
        (zone-nyan-rect 18  7 8 3 zone-nyan-yellow)

        (zone-nyan-rect  0  9 2 3 zone-nyan-green)
        (zone-nyan-rect  2 10 8 3 zone-nyan-green)
        (zone-nyan-rect 10  9 8 3 zone-nyan-green)
        (zone-nyan-rect 18 10 8 3 zone-nyan-green)

        (zone-nyan-rect  0 12 2 3 zone-nyan-cyan)
        (zone-nyan-rect  2 13 8 3 zone-nyan-cyan)
        (zone-nyan-rect 10 12 8 3 zone-nyan-cyan)
        (zone-nyan-rect 18 13 8 3 zone-nyan-cyan)

        (zone-nyan-rect  0 15 2 3 zone-nyan-violet)
        (zone-nyan-rect  2 16 8 3 zone-nyan-violet)
        (zone-nyan-rect 10 15 8 3 zone-nyan-violet)
        (zone-nyan-rect 18 16 8 3 zone-nyan-violet))
    (zone-nyan-group x y
      (zone-nyan-rect  0  1 3 3 zone-nyan-red)
      (zone-nyan-rect  3  0 8 3 zone-nyan-red)
      (zone-nyan-rect 11  1 8 3 zone-nyan-red)
      (zone-nyan-rect 19  0 8 3 zone-nyan-red)

      (zone-nyan-rect  0  4 3 3 zone-nyan-orange)
      (zone-nyan-rect  3  3 8 3 zone-nyan-orange)
      (zone-nyan-rect 11  4 8 3 zone-nyan-orange)
      (zone-nyan-rect 19  3 8 3 zone-nyan-orange)

      (zone-nyan-rect  0  7 3 3 zone-nyan-yellow)
      (zone-nyan-rect  3  6 8 3 zone-nyan-yellow)
      (zone-nyan-rect 11  7 8 3 zone-nyan-yellow)
      (zone-nyan-rect 19  6 8 3 zone-nyan-yellow)

      (zone-nyan-rect  0 10 3 3 zone-nyan-green)
      (zone-nyan-rect  3  9 8 3 zone-nyan-green)
      (zone-nyan-rect 11 10 8 3 zone-nyan-green)
      (zone-nyan-rect 19  9 8 3 zone-nyan-green)

      (zone-nyan-rect  0 13 3 3 zone-nyan-cyan)
      (zone-nyan-rect  3 12 8 3 zone-nyan-cyan)
      (zone-nyan-rect 11 13 8 3 zone-nyan-cyan)
      (zone-nyan-rect 19 12 8 3 zone-nyan-cyan)

      (zone-nyan-rect  0 16 3 3 zone-nyan-violet)
      (zone-nyan-rect  3 15 8 3 zone-nyan-violet)
      (zone-nyan-rect 11 16 8 3 zone-nyan-violet)
      (zone-nyan-rect 19 15 8 3 zone-nyan-violet))))

(defun zone-nyan-tail (x y frame)
  (cond
   ((= frame 0)
    (zone-nyan-group x y
      (zone-nyan-rect   0  0 4 3 zone-nyan-black)
      (zone-nyan-rect   1  1 4 3 zone-nyan-black)
      (zone-nyan-rect   2  2 4 3 zone-nyan-black)
      (zone-nyan-rect   3  3 3 3 zone-nyan-black)
      (zone-nyan-pixel  5  6     zone-nyan-black)

      (zone-nyan-rect   1  1 2 1 zone-nyan-gray)
      (zone-nyan-rect   2  2 2 1 zone-nyan-gray)
      (zone-nyan-rect   3  3 2 1 zone-nyan-gray)
      (zone-nyan-rect   4  4 2 1 zone-nyan-gray)))
   ((or (= frame 1) (= frame 5))
    (zone-nyan-group x (1+ y)
      (zone-nyan-rect   1  0 2 4 zone-nyan-black)
      (zone-nyan-rect   0  1 4 2 zone-nyan-black)
      (zone-nyan-rect   2  2 4 3 zone-nyan-black)
      (zone-nyan-rect   4  5 2 1 zone-nyan-black)

      (zone-nyan-rect   1  1 2 2 zone-nyan-gray)
      (zone-nyan-rect   2  3 2 1 zone-nyan-gray)
      (zone-nyan-rect   4  3 2 2 zone-nyan-gray)))
   ((= frame 2)
    (zone-nyan-group x (+ 4 y)
      (zone-nyan-pixel  5  0     zone-nyan-black)
      (zone-nyan-rect   2  1 4 1 zone-nyan-black)
      (zone-nyan-rect   0  2 6 2 zone-nyan-black)
      (zone-nyan-rect   1  4 4 1 zone-nyan-black)

      (zone-nyan-rect   2  2 4 1 zone-nyan-gray)
      (zone-nyan-rect   1  3 3 1 zone-nyan-gray)))
   ((= frame 3)
    (zone-nyan-group x (+ 4 y)
      (zone-nyan-rect   4  0 2 1 zone-nyan-black)
      (zone-nyan-rect   2  1 4 3 zone-nyan-black)
      (zone-nyan-rect   1  2 2 4 zone-nyan-black)
      (zone-nyan-rect   0  3 4 2 zone-nyan-black)

      (zone-nyan-rect   4  1 2 2 zone-nyan-gray)
      (zone-nyan-rect   2  2 2 1 zone-nyan-gray)
      (zone-nyan-rect   1  3 2 2 zone-nyan-gray)))
   ((= frame 4)
    (zone-nyan-group (1- x) (+ y 2)
      (zone-nyan-rect   1  0 4 1 zone-nyan-black)
      (zone-nyan-rect   0  1 7 2 zone-nyan-black)
      (zone-nyan-rect   2  3 5 1 zone-nyan-black)
      (zone-nyan-rect   5  4 2 1 zone-nyan-black)

      (zone-nyan-rect   1  1 3 1 zone-nyan-gray)
      (zone-nyan-rect   2  2 4 1 zone-nyan-gray)
      (zone-nyan-pixel  6  3     zone-nyan-gray)))))

(defun zone-nyan-legs (x y frame)
  (cond
   ((= frame 0)
    (zone-nyan-group x y
      (zone-nyan-rect   1  0 2 1 zone-nyan-black)
      (zone-nyan-rect   1  1 3 1 zone-nyan-gray)
      (zone-nyan-rect   0  1 1 3 zone-nyan-black)
      (zone-nyan-rect   1  3 3 1 zone-nyan-black)
      (zone-nyan-rect   3  2 2 1 zone-nyan-black)
      (zone-nyan-rect   1  2 2 1 zone-nyan-gray)

      (zone-nyan-rect   6  2 4 1 zone-nyan-black)
      (zone-nyan-rect   6  3 3 1 zone-nyan-black)
      (zone-nyan-rect   7  2 2 1 zone-nyan-gray)

      (zone-nyan-rect  15  2 4 1 zone-nyan-black)
      (zone-nyan-rect  16  3 3 1 zone-nyan-black)
      (zone-nyan-rect  16  2 2 1 zone-nyan-gray)

      (zone-nyan-rect  20  2 4 1 zone-nyan-black)
      (zone-nyan-rect  21  3 2 1 zone-nyan-black)
      (zone-nyan-rect  21  2 2 1 zone-nyan-gray)))
   ((= frame 1)
    (zone-nyan-group (1+ x) y
      (zone-nyan-rect   1  0 3 3 zone-nyan-black)
      (zone-nyan-rect   0  1 3 3 zone-nyan-black)
      (zone-nyan-rect   1  1 2 2 zone-nyan-gray)

      (zone-nyan-pixel  5  2     zone-nyan-black)
      (zone-nyan-rect   6  2 3 2 zone-nyan-black)
      (zone-nyan-rect   6  2 2 1 zone-nyan-gray)

      (zone-nyan-pixel 15  2     zone-nyan-black)
      (zone-nyan-rect  16  2 3 2 zone-nyan-black)
      (zone-nyan-rect  16  2 2 1 zone-nyan-gray)

      (zone-nyan-pixel 20  2     zone-nyan-black)
      (zone-nyan-rect  21  2 3 2 zone-nyan-black)
      (zone-nyan-rect  21  2 2 1 zone-nyan-gray)))
   ((= frame 2)
    (zone-nyan-group (+ x 2) (1+ y)
      (zone-nyan-rect   0  0 3 4 zone-nyan-black)
      (zone-nyan-pixel  3  2     zone-nyan-black)
      (zone-nyan-rect   1  1 2 2 zone-nyan-gray)

      (zone-nyan-pixel  5  2     zone-nyan-black)
      (zone-nyan-rect   6  2 3 2 zone-nyan-black)
      (zone-nyan-rect   6  2 2 1 zone-nyan-gray)

      (zone-nyan-pixel 15  2     zone-nyan-black)
      (zone-nyan-rect  16  2 3 2 zone-nyan-black)
      (zone-nyan-rect  16  2 2 1 zone-nyan-gray)

      (zone-nyan-pixel 20  2     zone-nyan-black)
      (zone-nyan-rect  21  2 3 2 zone-nyan-black)
      (zone-nyan-rect  21  2 2 1 zone-nyan-gray)))
   ((= frame 3)
    (zone-nyan-group (1+ x) (1+ y)
      (zone-nyan-rect   1  0 3 3 zone-nyan-black)
      (zone-nyan-rect   0  1 3 3 zone-nyan-black)
      (zone-nyan-rect   1  1 2 2 zone-nyan-gray)

      (zone-nyan-pixel  5  2     zone-nyan-black)
      (zone-nyan-rect   6  2 3 2 zone-nyan-black)
      (zone-nyan-rect   6  2 2 1 zone-nyan-gray)

      (zone-nyan-pixel 15  2     zone-nyan-black)
      (zone-nyan-rect  16  2 3 2 zone-nyan-black)
      (zone-nyan-rect  16  2 2 1 zone-nyan-gray)

      (zone-nyan-pixel 20  2     zone-nyan-black)
      (zone-nyan-rect  21  2 3 2 zone-nyan-black)
      (zone-nyan-rect  21  2 2 1 zone-nyan-gray)))
   ((= frame 4)
    (zone-nyan-group (1- x) y
      (zone-nyan-rect   2  0 3 3 zone-nyan-black)
      (zone-nyan-rect   1  1 3 3 zone-nyan-black)
      (zone-nyan-rect   0  2 3 3 zone-nyan-black)
      (zone-nyan-rect   1  2 2 2 zone-nyan-gray)
      (zone-nyan-pixel  3  2     zone-nyan-gray)

      (zone-nyan-pixel  5  3     zone-nyan-black)
      (zone-nyan-rect   6  3 3 2 zone-nyan-black)
      (zone-nyan-rect   6  3 2 1 zone-nyan-gray)

      (zone-nyan-pixel 15  3     zone-nyan-black)
      (zone-nyan-rect  16  3 3 2 zone-nyan-black)
      (zone-nyan-rect  16  3 2 1 zone-nyan-gray)

      (zone-nyan-pixel 20  3     zone-nyan-black)
      (zone-nyan-rect  21  3 3 2 zone-nyan-black)
      (zone-nyan-rect  21  3 2 1 zone-nyan-gray)))
   ((= frame 5)
    (zone-nyan-group (1- x) y
      (zone-nyan-rect   2  0 3 3 zone-nyan-black)
      (zone-nyan-rect   1  1 3 3 zone-nyan-black)
      (zone-nyan-rect   0  2 3 3 zone-nyan-black)
      (zone-nyan-rect   1  2 2 2 zone-nyan-gray)
      (zone-nyan-pixel  2  1     zone-nyan-gray)
      (zone-nyan-pixel  3  2     zone-nyan-gray)

      (zone-nyan-rect   5  3 3 2 zone-nyan-black)
      (zone-nyan-rect   6  3 2 1 zone-nyan-gray)
      (zone-nyan-pixel  8  3     zone-nyan-black)

      (zone-nyan-rect  15  3 3 2 zone-nyan-black)
      (zone-nyan-rect  16  3 2 1 zone-nyan-gray)
      (zone-nyan-pixel 18  3     zone-nyan-black)

      (zone-nyan-pixel 20  3     zone-nyan-black)
      (zone-nyan-rect  21  2 3 3 zone-nyan-black)
      (zone-nyan-pixel 22  2     zone-nyan-gray)
      (zone-nyan-rect  21  3 2 1 zone-nyan-gray)))))

(defun zone-nyan-pop-tart (x y)
  (zone-nyan-group x y
    (zone-nyan-rect   2  0 17 18 zone-nyan-black)
    (zone-nyan-rect   1  1 19 16 zone-nyan-black)
    (zone-nyan-rect   0  2 21 14 zone-nyan-black)

    (zone-nyan-rect   2  1 17 16 zone-nyan-bread)
    (zone-nyan-rect   1  2 19 14 zone-nyan-bread)

    (zone-nyan-rect   4  2 13 14 zone-nyan-rose)
    (zone-nyan-rect   3  3 15 12 zone-nyan-rose)
    (zone-nyan-rect   2  4 17 10 zone-nyan-rose)

    (zone-nyan-pixel  9  3       zone-nyan-pink)
    (zone-nyan-pixel 12  3       zone-nyan-pink)
    (zone-nyan-pixel  4  4       zone-nyan-pink)
    (zone-nyan-pixel 16  5       zone-nyan-pink)
    (zone-nyan-pixel  8  7       zone-nyan-pink)
    (zone-nyan-pixel  5  9       zone-nyan-pink)
    (zone-nyan-pixel  9 10       zone-nyan-pink)
    (zone-nyan-pixel  3 11       zone-nyan-pink)
    (zone-nyan-pixel  7 13       zone-nyan-pink)
    (zone-nyan-pixel  4 14       zone-nyan-pink)))

(defun zone-nyan-face (x y)
  (zone-nyan-group x y
    (zone-nyan-rect   2  0  2  1 zone-nyan-black)
    (zone-nyan-rect   1  1  4  2 zone-nyan-black)
    (zone-nyan-pixel  5  2       zone-nyan-black)

    (zone-nyan-rect  12  0  2  1 zone-nyan-black)
    (zone-nyan-rect  11  1  4  2 zone-nyan-black)
    (zone-nyan-pixel 10  2       zone-nyan-black)

    (zone-nyan-rect   0  5 16  5 zone-nyan-black)
    (zone-nyan-rect   1  3 14  8 zone-nyan-black)
    (zone-nyan-rect   2  3 12  9 zone-nyan-black)
    (zone-nyan-rect   3  3 10 10 zone-nyan-black)

    (zone-nyan-rect   2  1  2  3 zone-nyan-gray)
    (zone-nyan-rect   4  2  1  2 zone-nyan-gray)
    (zone-nyan-pixel  5  3       zone-nyan-gray)

    (zone-nyan-rect  12  1  2  3 zone-nyan-gray)
    (zone-nyan-rect  11  2  1  2 zone-nyan-gray)
    (zone-nyan-pixel 10  3       zone-nyan-gray)

    (zone-nyan-rect   2  4 12  7 zone-nyan-gray)
    (zone-nyan-rect   1  5 14  5 zone-nyan-gray)
    (zone-nyan-rect   3 11 10  1 zone-nyan-gray)

    (zone-nyan-rect   2  8  2  2 zone-nyan-rouge)
    (zone-nyan-rect  13  8  2  2 zone-nyan-rouge)

    (zone-nyan-rect   4  6  2  2 zone-nyan-black)
    (zone-nyan-pixel  4  6       zone-nyan-white)

    (zone-nyan-rect  11  6  2  2 zone-nyan-black)
    (zone-nyan-pixel 11  6       zone-nyan-white)

    (zone-nyan-rect   5 10  7  1 zone-nyan-black)
    (zone-nyan-pixel  5  9       zone-nyan-black)
    (zone-nyan-pixel  8  9       zone-nyan-black)
    (zone-nyan-pixel 11  9       zone-nyan-black)

    (zone-nyan-pixel  9  7       zone-nyan-black)))

(defun zone-nyan-star (x y frame)
  (cond
   ((= frame 0)
    (zone-nyan-group x y
      (zone-nyan-pixel 0 0     zone-nyan-white)))
   ((= frame 1)
    (zone-nyan-group x y
      (zone-nyan-pixel 1 0     zone-nyan-white)
      (zone-nyan-pixel 0 1     zone-nyan-white)
      (zone-nyan-pixel 2 1     zone-nyan-white)
      (zone-nyan-pixel 1 2     zone-nyan-white)))
   ((= frame 2)
    (zone-nyan-group x y
      (zone-nyan-rect  2 0 1 2 zone-nyan-white)
      (zone-nyan-rect  0 2 2 1 zone-nyan-white)
      (zone-nyan-rect  3 2 2 1 zone-nyan-white)
      (zone-nyan-rect  2 3 1 2 zone-nyan-white)))
   ((= frame 3)
    (zone-nyan-group x y
      (zone-nyan-rect  3 0 1 2 zone-nyan-white)
      (zone-nyan-rect  0 3 2 1 zone-nyan-white)
      (zone-nyan-pixel 3 3     zone-nyan-white)
      (zone-nyan-rect  5 3 2 1 zone-nyan-white)
      (zone-nyan-rect  3 5 1 2 zone-nyan-white)))
   ((= frame 4)
    (zone-nyan-group x y
      (zone-nyan-pixel 3 0     zone-nyan-white)
      (zone-nyan-pixel 1 1     zone-nyan-white)
      (zone-nyan-pixel 5 1     zone-nyan-white)
      (zone-nyan-pixel 0 3     zone-nyan-white)
      (zone-nyan-pixel 6 3     zone-nyan-white)
      (zone-nyan-pixel 1 5     zone-nyan-white)
      (zone-nyan-pixel 5 5     zone-nyan-white)
      (zone-nyan-pixel 3 6     zone-nyan-white)))
   ((= frame 5)
    (zone-nyan-group x y
      (zone-nyan-pixel 3 0     zone-nyan-white)
      (zone-nyan-pixel 0 3     zone-nyan-white)
      (zone-nyan-pixel 6 3     zone-nyan-white)
      (zone-nyan-pixel 3 6     zone-nyan-white)))))

(defun zone-nyan-stars (x y frame)
  (cond
   ((= frame 0)
    (zone-nyan-group x y
      (zone-nyan-star 41  0 1)
      (zone-nyan-star 65 12 3)
      (zone-nyan-star  0 21 1)
      (zone-nyan-star  8 41 5)
      (zone-nyan-star 69 56 0)
      (zone-nyan-star 36 64 2)))
   ((= frame 1)
    (zone-nyan-group x y
      (zone-nyan-star 34 -1 2)
      (zone-nyan-star 57  7 4)
      (zone-nyan-star  5 44 0)
      (zone-nyan-star 66 56 0)
      (zone-nyan-star 27 63 3)))
   ((= frame 2)
    (zone-nyan-group x y
      (zone-nyan-star 25 -2 3)
      (zone-nyan-star 49  7 5)
      (zone-nyan-star 66 19 3)
      (zone-nyan-star  0 43 1)
      (zone-nyan-star 57 53 5)
      (zone-nyan-star 18 63 4)))
   ((= frame 3)
    (zone-nyan-group x y
      (zone-nyan-star 16 -2 4)
      (zone-nyan-star 46 10 0)
      (zone-nyan-star 58 19 4)
      (zone-nyan-star 48 53 4)
      (zone-nyan-star  9 63 5)))
   ((= frame 4)
    (zone-nyan-group x y
      (zone-nyan-star  7 -2 5)
      (zone-nyan-star 41  9 1)
      (zone-nyan-star 50 19 5)
      (zone-nyan-star 39 53 3)
      (zone-nyan-star  6 66 0)))
   ((= frame 5)
    (zone-nyan-group x y
      (zone-nyan-star  4  1 0)
      (zone-nyan-star 34  8 2)
      (zone-nyan-star 47 22 0)
      (zone-nyan-star 66 41 3)
      (zone-nyan-star 32 54 2)
      (zone-nyan-star  1 65 1)))
   ((= frame 6)
    (zone-nyan-group x y
      (zone-nyan-star -1  0 1)
      (zone-nyan-star 25  7 3)
      (zone-nyan-star 42 21 1)
      (zone-nyan-star 58 41 4)
      (zone-nyan-star 27 55 1)))
   ((= frame 7)
    (zone-nyan-group x y
      (zone-nyan-star 16  7 4)
      (zone-nyan-star 35 20 2)
      (zone-nyan-star 50 41 5)
      (zone-nyan-star 24 56 0)
      (zone-nyan-star 67 63 3)))
   ((= frame 8)
    (zone-nyan-group x y
      (zone-nyan-star 65 -2 3)
      (zone-nyan-star  7  7 5)
      (zone-nyan-star 26 19 3)
      (zone-nyan-star 44 44 0)
      (zone-nyan-star 15 53 5)
      (zone-nyan-star 59 63 4)))
   ((= frame 9)
    (zone-nyan-group x y
      (zone-nyan-star 57 -2 4)
      (zone-nyan-star  4 10 0)
      (zone-nyan-star 17 19 4)
      (zone-nyan-star 35 42 2)
      (zone-nyan-star  7 53 4)
      (zone-nyan-star 51 63 5)))
   ((= frame 10)
    (zone-nyan-group x y
      (zone-nyan-star 49 -2 5)
      (zone-nyan-star -1  9 1)
      (zone-nyan-star  8 19 5)
      (zone-nyan-star 26 41 3)
      (zone-nyan-star -1 53 3)
      (zone-nyan-star 48 66 0)))
   ((= frame 11)
    (zone-nyan-group x y
      (zone-nyan-star 46  1 0)
      (zone-nyan-star  5 22 0)
      (zone-nyan-star 17 41 4)
      (zone-nyan-star -4 53 4)
      (zone-nyan-star 43 65 1)))))


;;; frontend

(defun zone-nyan-image (time)
  (let* ((width (window-body-width nil t))
         (height (window-body-height nil t))
         (scale (zone-nyan-scale width height)))
    (when (> scale 0)
      (let* ((frame (mod time 6))
             (star-frame (mod time 12))
             (rainbow-flipped (not (zerop (mod (/ time 2) 2))))
             (pop-tart-offset (if (< frame 2) 0 1))
             (face-x-offset (if (or (zerop frame) (> frame 3)) 0 1))
             (face-y-offset (if (or (< frame 2) (> frame 4)) 0 1))
             (x-offset (floor (/ (- width (* 70 scale)) 2.0)))
             (y-offset (floor (/ (- height (* 70 scale)) 2.0))))
        (sxml-to-xml
         (zone-nyan-svg width height scale x-offset y-offset
           (zone-nyan-rect 0 0 70 70 zone-nyan-indigo)
           (zone-nyan-rainbow 0 26 rainbow-flipped)
           (zone-nyan-stars 0 0 star-frame)
           (zone-nyan-tail 19 32 frame)
           (zone-nyan-legs 23 41 frame)
           (zone-nyan-pop-tart 25 (+ 25 pop-tart-offset))
           (zone-nyan-face (+ 35 face-x-offset) (+ 30 face-y-offset))))))))

(defvar zone-nyan-interval (/ 1.0 10))

;;;###autoload
(defun zone-nyan ()
  (delete-other-windows)
  (setq cursor-type nil)
  (let ((time 0))
    (while (not (input-pending-p))
      (erase-buffer)
      (insert (propertize " " 'display
                          (create-image (zone-nyan-image time) 'svg t)))
      (message "You've nyaned for %s seconds" (/ time 10.0))
      (setq time (1+ time))
      (sit-for zone-nyan-interval))))

;;;###autoload
(defun zone-nyan-preview ()
  (interactive)
  (let ((zone-programs [zone-nyan]))
    (zone)))
