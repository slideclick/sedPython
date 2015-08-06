#-----------------------------------------------------------------------
# compareadocuments.py
#-----------------------------------------------------------------------

import sys
import stdarray
import stdio
from instream import InStream
from sketch import Sketch

#-----------------------------------------------------------------------

# Accept integers k and d as command-line arguments. Read a document
# list from standard input, compute profiles based on k-gram
# frequencies for all the documents, and write a matrix of similarity
# measures between all pairs of documents. d is the dimension of the
# profiles.

k = int(sys.argv[1])
d = int(sys.argv[2])

filenames = stdio.readAllStrings()
sketches = stdarray.create1D(len(filenames))

for i in range(len(filenames)):
    text = InStream(filenames[i]).readAll()
    sketches[i] = Sketch(text, k, d)
    
stdio.write('    ')
for i in range(len(filenames)):
    stdio.writef('%8.4s', filenames[i])
stdio.writeln()

for i in range(len(filenames)):
    stdio.writef('%.4s', filenames[i])
    for j in range(len(filenames)):
        stdio.writef('%8.2f', sketches[i].similarTo(sketches[j]))
    stdio.writeln()
    
#-----------------------------------------------------------------------

# more documents.txt 
# constitution.txt
# tomsawyer.txt
# huckfinn.txt
# prejudice.txt
# vector.py
# djia.csv
# amazon.html
# actg.txt

# python comparedocuments.py 5 10000 < documents.txt
#         cons    toms    huck    prej    vect    djia    amaz    actg
# cons    1.00    0.67    0.61    0.64    0.10    0.18    0.19    0.12
# toms    0.67    1.00    0.93    0.87    0.08    0.23    0.19    0.15
# huck    0.61    0.93    1.00    0.81    0.06    0.21    0.15    0.14
# prej    0.64    0.87    0.81    1.00    0.07    0.25    0.19    0.16
# vect    0.10    0.08    0.06    0.07    1.00    0.03    0.17    0.01
# djia    0.18    0.23    0.21    0.25    0.03    1.00    0.13    0.12
# amaz    0.19    0.19    0.15    0.19    0.17    0.13    1.00    0.09
# actg    0.12    0.15    0.14    0.16    0.01    0.12    0.09    1.00

