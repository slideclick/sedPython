
(class SimpleClass None
(begin (defn init (self v)
(set (attr self v)  (addd v) ))
(defn getV (self)
(attr self v))
(defn setV (self d)
(set (attr self v) d))
))
(begin
 (defn add_simon (x) (+ x 1))
 (defn addd (x  ) (+ 2 x  ))
(define a (SimpleClass))

((attr a setV) a (add_simon 38 ))
((attr a init) a 38)
((attr a getV) a)
)
; expect 39