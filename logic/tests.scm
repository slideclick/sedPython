;;; Test cases for Scheme.
;;;
;;; In order to run only a prefix of these examples, add the line
;;;
;;; (exit)
;;;
;;; after the last test you wish to run.

;;; *** Add more of your own here! ***

(+ 3 6)
; expect 9

(even? 2)
; expect True

(odd? 3)
; expect True

(/ 1 0)
; expect Error

'(1 (2 three . (4 . 5)))
; expect (1 (2 three 4 . 5))

(define (add_one x) (+ x 1)) (add_one 2)
; expect 3

(define (multiply_ten x) (* x 10)) (multiply_ten 5)
; expect 50

(define sign (lambda (x) (if (> x 0) (quote +) (quote -)))) (sign 10)
; expect +

(define (cddr s) (cdr (cdr s)))

(define (cadr s) (car (cdr s)))

(define (caddr s) (car (cddr s)))

(define evens (list 0 2 4 6 8))

(cddr evens)
; expect (4 6 8)

(cadr evens)
; expect 2

(caddr evens)
; expect 4

(car '(1 2))
; expect 1

(+ 3 ')
; expect Error

(define (increment x) (+ x 1))
; expect increment

(define (two x) (/ x (* x 2)))
; expect two

(define (fib n)
  (if (< n 2) 
    1 
    (+ (fib (- n 1)) (fib (- n 2)))))

(fib 9)
; expect 55

(increment (two 5))
; expect 1.5

'scheme!
; expect scheme!

'(i love coding in scheme)
; expect (i love coding in scheme)

(begin 'a 'b)
; expect b

(begin (+ 1 7) (+ 2 2))
; expect 4

(begin (display 1) (+ 1 1))
; expect 12

(begin 9 'nine)
; expect nine

(lambda (x y) (/ x y))
; expect (lambda (x y) (/ x y))

(lambda (5) (* 5 1))
; expect Error

((lambda (y) 42 (* y 2)) 5)
; expect 10

(define equation (+ 9 9))
equation
; expect 18

(define (x 2) (* x x))
; expect Error

(define (f x) (* x 5))
f
; expect (lambda (x) (* x 5))

(and)
; expect True

(or)
; expect False

(and 1 2 3 4)
; expect 4

(and False 1 2 3 4)
; expect False

(or False 1 2 3 4)
; expect 1

(or False False False)
; expect False

(if (= 3 1) true false)
; expect False

(cond ((= 5 8) 'wrong)
    (else 'conditional))
; expect conditional

(cond ((= 2 5) 'water)
  ((= 100 1000) 'fire)
    ((= 10000 10000) 'sup))
; expect sup

(cond ((= 4 4) 'here (define value_b 4) 42 (* value_b 3))
     (else 'wat 0))
; expect 12

(if (= 10 1) 5)
; expect okay

(if (= 10 10) 10 'wrong)
; expect 10

(let ((x (lambda (x) (* x x))) (y 5)) (x y))
; expect 25

(let ((a 5)
    (b (* 10 2)))
    (* a b))
; expect 100

(define value_a 'sun)
(define value_b 'moon)
(let ((value_a 6)
      (value_b (+ 1 8)))
    (list value_a value_b))
; expect (6 9)

(list value_a value_b)
; expect (sun moon)

(define alpha (mu (x) (* x y) ))

(define beta (lambda (x y) (alpha (* x y))))

(beta 3 6)
; expect 108





;;; These are examples from several sections of "The Structure
;;; and Interpretation of Computer Programs" by Abelson and Sussman.

;;; License: Creative Commons share alike with attribution

;;; 1.1.1

10
; expect 10

(+ 137 349)
; expect 486

(- 1000 334)
; expect 666

(* 5 99)
; expect 495

(/ 10 5)
; expect 2

(+ 2.7 10)
; expect 12.7

(+ 21 35 12 7)
; expect 75

(* 25 4 12)
; expect 1200

(+ (* 3 5) (- 10 6))
; expect 19

(+ (* 3 (+ (* 2 4) (+ 3 5))) (+ (- 10 7) 6))
; expect 57

(+ (* 3
      (+ (* 2 4)
         (+ 3 5)))
   (+ (- 10 7)
      6))
; expect 57


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Move the following (exit) line to run additional tests. ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;;; 1.1.2

(define size 2)
; expect size
size
; expect 2

(* 5 size)
; expect 10

(define pi 3.14159)
(define radius 10)
(* pi (* radius radius))
; expect 314.159

(define circumference (* 2 pi radius))
circumference
; expect 62.8318

;;; 1.1.4

(define (square x) (* x x))
; expect square
(square 21)
; expect 441

(define square (lambda (x) (* x x))) ; See Section 1.3.2
(square 21)
; expect 441

(square (+ 2 5))
; expect 49

(square (square 3))
; expect 81

(define (sum-of-squares x y)
  (+ (square x) (square y)))
(sum-of-squares 3 4)
; expect 25

(define (f a)
  (sum-of-squares (+ a 1) (* a 2)))
(f 5)
; expect 136

;;; 1.1.6

(define (abs x)
  (cond ((> x 0) x)
        ((= x 0) 0)
        ((< x 0) (- x))))
(abs -3)
; expect 3

(abs 0)
; expect 0

(abs 3)
; expect 3

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
(a-plus-abs-b 3 -2)
; expect 5

;;; 1.1.7

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))
(define (improve guess x)
  (average guess (/ x guess)))
(define (average x y)
  (/ (+ x y) 2))
(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
  (sqrt-iter 1.0 x))
(sqrt 9)
; expect 3.00009155413138

(sqrt (+ 100 37))
; expect 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
; expect 1.7739279023207892

(square (sqrt 1000))
; expect 1000.000369924366

;;; 1.1.8

(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))
(sqrt 9)
; expect 3.00009155413138

(sqrt (+ 100 37))
; expect 11.704699917758145

(sqrt (+ (sqrt 2) (sqrt 3)))
; expect 1.7739279023207892

(square (sqrt 1000))
; expect 1000.000369924366

;;; 1.3.1

(define (cube x) (* x x x))
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
(define (inc n) (+ n 1))
(define (sum-cubes a b)
  (sum cube a inc b))
(sum-cubes 1 10)
; expect 3025

(define (identity x) x)
(define (sum-integers a b)
  (sum identity a inc b))
(sum-integers 1 10)
; expect 55

;;; 1.3.2

((lambda (x y z) (+ x y (square z))) 1 2 3)
; expect 12

(define (f x y)
  (let ((a (+ 1 (* x y)))
        (b (- 1 y)))
    (+ (* x (square a))
       (* y b)
       (* a b))))
(f 3 4)
; expect 456

(define x 5)
(+ (let ((x 3))
     (+ x (* x 10)))
   x)
; expect 38

(let ((x 3)
      (y (+ x 2)))
  (* x y))
; expect 21

;;; 2.1.1

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (sub-rat x y)
  (make-rat (- (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))
(define (mul-rat x y)
  (make-rat (* (numer x) (numer y))
            (* (denom x) (denom y))))
(define (div-rat x y)
  (make-rat (* (numer x) (denom y))
            (* (denom x) (numer y))))
(define (equal-rat? x y)
  (= (* (numer x) (denom y))
     (* (numer y) (denom x))))

(define x (cons 1 2))
(car x)
; expect 1

(cdr x)
; expect 2

(define x (cons 1 2))
(define y (cons 3 4))
(define z (cons x y))
(car (car z))
; expect 1

(car (cdr z))
; expect 3

z
; expect ((1 . 2) 3 . 4)

(define (make-rat n d) (cons n d))
(define (numer x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
  (display (numer x))
  (display '/)
  (display (denom x))
  (newline))
(define one-half (make-rat 1 2))
(print-rat one-half)
; expect 1/2 ; okay

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))
; expect 5/6 ; okay

(print-rat (mul-rat one-half one-third))
; expect 1/6 ; okay

(print-rat (add-rat one-third one-third))
; expect 6/9 ; okay

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cons (/ n g) (/ d g))))
(print-rat (add-rat one-third one-third))
; expect 2/3 ; okay

(define one-through-four (list 1 2 3 4))
one-through-four
; expect (1 2 3 4)

(car one-through-four)
; expect 1

(cdr one-through-four)
; expect (2 3 4)

(car (cdr one-through-four))
; expect 2

(cons 10 one-through-four)
; expect (10 1 2 3 4)

(cons 5 one-through-four)
; expect (5 1 2 3 4)

(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
(map abs (list -10 2.5 -11.6 17))
; expect (10 2.5 11.6 17)

(map (lambda (x) (* x x))
     (list 1 2 3 4))
; expect (1 4 9 16)

(define (scale-list items factor)
  (map (lambda (x) (* x factor))
       items))
(scale-list (list 1 2 3 4 5) 10)
; expect (10 20 30 40 50)

(define (count-leaves x)
  (cond ((null? x) 0)
        ((not (pair? x)) 1)
        (else (+ (count-leaves (car x))
                 (count-leaves (cdr x))))))
(define x (cons (list 1 2) (list 3 4)))
(count-leaves x)
; expect 4

(count-leaves (list x x))
; expect 8

;;; 2.2.3

(define (odd? x) (= 1 (remainder x 2)))
(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else (filter predicate (cdr sequence)))))
(filter odd? (list 1 2 3 4 5))
; expect (1 3 5)

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
(accumulate + 0 (list 1 2 3 4 5))
; expect 15

(accumulate * 1 (list 1 2 3 4 5))
; expect 120

(accumulate cons nil (list 1 2 3 4 5))
; expect (1 2 3 4 5)

(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
(enumerate-interval 2 7)
; expect (2 3 4 5 6 7)

(define (enumerate-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (enumerate-tree (car tree))
                      (enumerate-tree (cdr tree))))))
(enumerate-tree (list 1 (list 2 (list 3 4)) 5))
; expect (1 2 3 4 5)

;;; 2.3.1

(define a 1)

(define b 2)

(list a b)
; expect (1 2)

(list 'a 'b)
; expect (a b)

(list 'a b)
; expect (a 2)

(car '(a b c))
; expect a

(cdr '(a b c))
; expect (b c)

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))
(memq 'apple '(pear banana prune))
; expect False

(memq 'apple '(x (apple sauce) y apple pear))
; expect (apple pear)

(define (equal? x y)
  (cond ((pair? x) (and (pair? y)
                        (equal? (car x) (car y))
                        (equal? (cdr x) (cdr y))))
        ((null? x) (null? y))
        (else (eq? x y))))
(equal? '(1 2 (three)) '(1 2 (three)))
; expect True

(equal? '(1 2 (three)) '(1 2 three))
; expect False

(equal? '(1 2 three) '(1 2 (three)))
; expect False

;;; Peter Norvig tests (http://norvig.com/lispy2.html)

(define double (lambda (x) (* 2 x)))
(double 5)
; expect 10

(define compose (lambda (f g) (lambda (x) (f (g x)))))
((compose list double) 5)
; expect (10)

(define apply-twice (lambda (f) (compose f f)))
((apply-twice double) 5)
; expect 20

((apply-twice (apply-twice double)) 5)
; expect 80

(define fact (lambda (n) (if (<= n 1) 1 (* n (fact (- n 1))))))
(fact 3)
; expect 6

(fact 50)
; expect 30414093201713378043612608166064768844377641568960512000000000000

(define (combine f)
  (lambda (x y)
    (if (null? x) nil
      (f (list (car x) (car y))
         ((combine f) (cdr x) (cdr y))))))
(define zip (combine cons))
(zip (list 1 2 3 4) (list 5 6 7 8))
; expect ((1 5) (2 6) (3 7) (4 8))

(define riff-shuffle (lambda (deck) (begin
    (define take (lambda (n seq) (if (<= n 0) (quote ()) (cons (car seq) (take (- n 1) (cdr seq))))))
    (define drop (lambda (n seq) (if (<= n 0) seq (drop (- n 1) (cdr seq)))))
    (define mid (lambda (seq) (/ (length seq) 2)))
    ((combine append) (take (mid deck) deck) (drop (mid deck) deck)))))
(riff-shuffle (list 1 2 3 4 5 6 7 8))
; expect (1 5 2 6 3 7 4 8)

((apply-twice riff-shuffle) (list 1 2 3 4 5 6 7 8))
; expect (1 3 5 7 2 4 6 8)

(riff-shuffle (riff-shuffle (riff-shuffle (list 1 2 3 4 5 6 7 8))))
; expect (1 2 3 4 5 6 7 8)

;;; Additional tests

(apply square '(2))
; expect 4

(apply + '(1 2 3 4))
; expect 10

(apply (if false + append) '((1 2) (3 4)))
; expect (1 2 3 4)

(if 0 1 2)
; expect 1

(if '() 1 2)
; expect 1

(or false true)
; expect True

(or)
; expect False

(and)
; expect True

(or 1 2 3)
; expect 1

(and 1 2 3)
; expect 3

(and False (/ 1 0))
; expect False

(and True (/ 1 0))
; expect Error

(or 3 (/ 1 0))
; expect 3

(or False (/ 1 0))
; expect Error

(or (quote hello) (quote world))
; expect hello

(if nil 1 2)
; expect 1

(if 0 1 2)
; expect 1

(if (or false False #f) 1 2)
; expect 2

(define (loop) (loop))
(cond (false (loop))
      (12))
; expect 12

((lambda (x) (display x) (newline) x) 2)
; expect 2 ; 2

(define g (mu () x))
(define (high f x)
  (f))

(high g 2)
; expect 2

(define (print-and-square x)
  (print x)
  (square x))
(print-and-square 12)
; expect 12 ; 144

(/ 1 0)
; expect Error

(define addx (mu (x) (+ x y)))
(define add2xy (lambda (x y) (addx (+ x x))))
(add2xy 3 7)
; expect 13


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Scheme Implementations ;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; len outputs the length of list s
(define (len s)
  (if (eq? s '())
    0
    (+ 1 (len (cdr s)))))
(len '(1 2 3 4))
; expect 4

; simon
 ;;(require racket/trace)
;; (trace fact)
 (define fact (lambda (n) (if (<= n 1) 1 (* n (fact (- n 1))))))
 (fact 10)
 ; expect 3628800
 (fact 100)
 ; expect 93326215443944152681699238856266700490715968264381621468592963895217599993229915608941463976156518286253697920827223758251185210916864000000000000000000000000
 
 
;
(define fib (lambda (n) (if (< n 2) 1 (+ (fib (- n 1)) (fib (- n 2))))))
(define range (lambda (a b) (if (= a b) (quote ()) (cons a (range (+ a 1) b)))))
(map fib (range 0 10))
; expect (1 1 2 3 5 8 13 21 34 55)


;; class

(defn add_simon (x) (+ x 1)) 
(add_simon 2)

 ; expect 3
 


 
 (defn add_simon (x y) (+ x y))
 (add_simon 2 3)
 ((lambda (y) (((lambda (y) (lambda (x) (* y 2))) 3) 0)) 4)
 ; expect 6
 
  ((mu (y) (((mu (y) (mu (x) (* y 2))) 3) 0)) 4)
 ; expect 8
  (defn addd (x y ) (+ 2 x y ))
(begin
(class baseclass None (begin (defn getSuper (self)(+ 1 (attr self  n)))(defn addd (x y ) (+ 0 x y ))))
 (define b (baseclass))
(class SimpleClass baseclass
(begin (defn init (self v)
(begin (set (attr self n) 0)(set (attr self v) v)))
(defn getV (self)
(attr self v))
(defn getAV (self)
(/ (attr self v)(attr self n)))
(defn getAVUsingSuper (self)
(/ (attr self v)(getSuper self)))
(defn setV (self d)
(set (attr self v) d))
(defn addValue (self d)
(begin (set (attr self v) (+ ((attr self getV) self) d))
(set (attr self n) (addd 1 (attr self n) )))
)
))
(begin
(define c (SimpleClass))
((method c init)  0)
((method c addValue)   2 )
((method c addValue)   10 )
((method c getAVUsingSuper)    )
))
 ; expect 4
;getAVUsingSuper will return 4
(begin
(define a (SimpleClass))
((attr a init) a 0)
((attr a getV) a)
((attr a addValue) a  2 )
((attr a addValue) a  3 )
((attr a addValue) a  10 )
((attr a getAV) a   )
((attr a getAVUsingSuper) a   )
)

 ; expect 3.75
(class UsingInit baseclass
(begin (defn _init_ (self v)
(begin (set (attr self n)(+ 0 1))(set (attr self v) v)))
(defn getV (self)
(attr self v))
(defn getAV (self)
(/ (attr self v)(attr self n)))
(defn getAVUsingSuper (self)
(/ (attr self v)((attr self getSuper) self)))
(defn setV (self d)
(set (attr self v) d))
(defn addValue (self d)
(begin (set (attr self v) (+ ((attr self getV) self) d))
(set (attr self n) (+ 1 (attr self n) )))
)
))
 (begin
(define d (UsingInit (+ 1 1)))
((method d addValue)   2 )
((method d addValue)   10 )
((attr d getAV) d   )
((attr d getAVUsingSuper) d   )
)
  ; expect 3.5
(class UsingMethodAttr baseclass
(begin 
(defn _init_ (self v)
    (begin (set (attr self n)(+ 0 1))(set (attr self v) v)))
(defn getV (self)
    (attr self v))
(defn getAV (self)
    (/ (attr self v)(attr self n)))
(defn getAVUsingSuper (self)
    (/ (attr self v)(getSuper self)))
(defn setV (self d)
    (set (attr self v) d))
(defn addValue (self d)
    (begin (set (attr self v) (+ (getV self) d))
    (set (attr self n) (addd 2 (attr self n) )))
)
))
 (begin
(define d (UsingMethodAttr (+ 1 1)))
((method d addValue)   2 )
((method d addValue)   10 )
((method d getAV)    )
((method d getAVUsingSuper)   )
)
  ; expect 2.3333333333333335
 
 (defn add_simon (x) (+ x 1)) (add_simon 2)
; expect 3
 (defn addd (x  ) (+ 2 x  ))
(class SimpleClass None
(begin (defn init (self v)
(set (attr self v)  (addd v) ))
(defn getV (self)
(attr self v))
(defn setV (self d)
(set (attr self v) d))
))
(begin
(define a (SimpleClass))
((attr a init) a 37)
((attr a setV) a (add_simon 38 ))
((attr a getV) a)
)

 ; expect 39



 (exit) 
  ;; fact code isn't tail , so it can't be optimization
  ;; (require racket/trace) (trace factnew)
  (define factnew (lambda (n product) (if (<= n 1) product (factnew  (- n 1) (* n  product)))))
  (factnew 1000 1)
  ; expect 3628800
;;;;;;;;;;;;;;;;;;;;
;;; Extra credit ;;;
;;;;;;;;;;;;;;;;;;;;



; Tail call optimization test
(define (sum n total)
  (if (zero? n) total
    (sum (- n 1) (+ n total))))
(sum 1001 0)
; expect 501501

