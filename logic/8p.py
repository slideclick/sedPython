# -*- coding: UTF-8 -*-
import functools,re
PREFIX = ''
def trace(fn):
    """A decorator that prints a function's name, its arguments, and its return
    values each time the function is called. For example,

    @trace
    def compute_something(x, y):
        # function body
    """
    @functools.wraps(fn)
    def wrapped(*args, **kwds):
        global PREFIX
        reprs = [repr(e) for e in args]
        reprs += [repr(k) + '=' + repr(v) for k, v in kwds.items()]
        log('{0}({1})'.format(fn.__name__, ', '.join(reprs)) + ':')
        PREFIX += '    '
        try:
            result = fn(*args, **kwds)
            PREFIX = PREFIX[:-4]
        except Exception as e:
            log(fn.__name__ + ' exited via exception')
            PREFIX = PREFIX[:-4]
            raise
        # Here, print out the return value.
        log('{0}({1}) -> {2}'.format(fn.__name__, ', '.join(reprs), result))
        return result
    return wrapped


def log(message):
    """Print an indented message (used with trace)."""
    if type(message) is not str:
        message = str(message)
    print(PREFIX + re.sub('\n', '\n' + PREFIX, message))
SIZE = 4
def PrintArray(lastQueen,firstcall = False,moveNumber=0):
    if firstcall:
        [print(i,end='') for i  in range(1,SIZE+1)]
    if type(lastQueen.neighbour) is not NullQueen:
        PrintArray(lastQueen.neighbour)
    print()
    for i in range(1,SIZE+1):
        print('{0}'.format( chr(ord('F')+lastQueen.column) if lastQueen.row == i else 'O' ,),end='')
    print(lastQueen.column,end='')
# Queen
class Queen:

  def __repr__(self):
    return ('column: {0}, row: {1}, neighbour: <{2}>'.format(self.column,self.row,self.neighbour,))

  __str__ = __repr__

  def __init__(self,):
    self.row = 1

  def initialColumn(self,column, neighbour):
    self.column = column
    self.neighbour = neighbour

  # canAttack?
  #
  # returns True if this queen or any of her neighbours can attack a
  # given position, False if not

  def canAttack(self,row, column):
    if row == self.row:
      return True 

    cd = abs(column - self.column)
    rd = abs(row - self.row)
    if cd == rd:
      return True 

    return self.neighbour.canAttack(row, column)  

  # testOrAdvance?
  #
  # see if this queen's current position can ba attacked.  return True
  # if it's a safe position, or try and the next position and test it.
  # return False if we're at wit's end
  #@trace
  def testOrAdvance(self,):
    if self.neighbour.canAttack(self.row, self.column):
      return self.next()
    return True  

  # findSolution?
  #
  # set up an initial acceptable position for this queen and neighbours.
  # return True if it's possible to set up, False if not.
  #@trace
  def findSolution(self,):
    if self.neighbour.findSolution():
      return self.testOrAdvance()
    return False  

  # next?
  #
  # tries to move this queen to the next safe position, returns True if it's
  # possible or False if not

  def next(self,):
    #print('before move:');PrintArray(lastQueen,True);print()
    if self.row == SIZE:
      if not  self.neighbour.next():
        return False 
      self.row = 0
    self.row += 1
    print();print('after move: {0}'.format(self.column));PrintArray(lastQueen,True);print()
    return self.testOrAdvance()  

  # getState
  #
  # collect the current state of my neighbours and add my own before 
  # returning an array of row/column arrays
  #@trace 
  def getState(self,):
    stateArray = self.neighbour.getState()
    stateArray.append([self.row, self.column])
    return stateArray  


# NullQueen
#
# a class of queen used to indicate the end of the set of queens
class NullQueen : 

  def canAttack(self,row, column):
    return False  

  def findSolution(self,):
    return True  

  def next(self,):
    return False  
  #@trace
  def getState(self,):
    return []
  
  def __repr__(self):
    return ('NullQueen'.format())

  __str__ = __repr__


# the program
global lastQueen
neighbour = NullQueen()
lastQueen = None

for i in range(1,SIZE+1):
  lastQueen = Queen()
  lastQueen.initialColumn(i, neighbour)
  neighbour = lastQueen
  if not lastQueen.findSolution():
      print('no solution\n')

print();print();PrintArray(lastQueen,True);print()


#if lastQueen.findSolution():
#    print('\nfound:',lastQueen)
#    PrintArray(lastQueen,True);    print()
#    for state in lastQueen.getState():        
#        print( "column: {1} row: {0} ".format(state[0],state[1],))
#lastQueen.row += 1
#if lastQueen.findSolution():
#    print('\nfound:',lastQueen)
#    PrintArray(lastQueen,True);    print()
#    for state in lastQueen.getState():        
#        print( "column: {1} row: {0} ".format(state[0],state[1],))