# cs61aLogic
https://github.com/rwwaskk/CS61A-Berkeley

class Tsomeclass:
    def getSuper(self):
        return 1+ self.n
class TSimpleClass(Tsomeclass):
    def __init__(self,v):
        self.n=0
        self.v=v
    def addValue(self,d):
        self.v += d
        self.n += 1
    def getAVUsingSuper(self):
        return self.v / self.getSuper()
a=TSimpleClass(0)
a.addValue(2)
a.addValue(3)
a.addValue(10)
(a.getAVUsingSuper() )

------------------------
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
