'''

 (define mult (lambda (x y ) (* x y)))
  (defn mult (x y ) (* x y 2  ))
 (define gi 2)
(class TBclass None 
    (begin (defn getSuper 
        (self)(mult 2 (*(attr self  n) gi)))))
(class UsingMethodAttr TBclass
(begin 
(defn _init_ (self v)
    (begin (set (attr self n)(+ 0 1))(set (attr self v) v)))
(defn getV (self)
    (attr self v))
(defn getAV (self)
    (/ (attr self v)(attr self n)))
(defn getAVUsingSuper (self)
    (/ (attr self v)(getSuper self)))

(defn addValue (self d)
    (begin (set (attr self v) (+ (getV self) d))
    (set (attr self n) (+ 1 (attr self n) )))
)
))
 (begin
(define d (UsingMethodAttr (+ 2 7)))
((method d addValue)   2 )
((method d addValue)   3 )
((method d addValue)   10 )
((method d getAV)    )
((method d getAVUsingSuper)   )
)

 ; expect 0.75

'''

def mult(x,y):
    return x*y

gi= 2

class TBclass:
    def getSuper(self):
        return mult(2, self.n*gi)
class TSimpleClass(TBclass):
    def __init__(self,v):
        self.n=0+1
        self.v=v
    def addValue(self,d):
        self.v += d
        self.n += 1
    def getAVUsingSuper(self):
        return self.v / self.getSuper()
a=TSimpleClass(9)
a.addValue(2)
a.addValue(3)
a.addValue(10)

print(a.getAVUsingSuper())

