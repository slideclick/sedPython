#-----------------------------------------------------------------------
# stockquote.py
#-----------------------------------------------------------------------
from __future__ import print_function
import sys
import stdio
from instream import InStream

#-----------------------------------------------------------------------

# Return the raw HTML from the website http://finance.yahoo.com

def _readHTML(stockSymbol):
    WEBSITE = 'http://finance.yahoo.com/q?s='
    page = InStream(WEBSITE + stockSymbol)
    html = page.readAll()
    return html

#-----------------------------------------------------------------------

# Extract the current stock price of the stock whose symbol is 
# stockSymbol from the HTML and return it.

def priceOf(stockSymbol):
    html  = _readHTML(stockSymbol)
    #print (html.encode('gbk',errors='ignore').decode('gbk'))#
    b=html.encode('gbk',errors='ignore')
    f=open(r'd:\test.txt','wb')#binary mode needn;t encoding argument
    f.write(b)
    f.close
    print(open(r'd:\test.txt',encoding='gbk').readlines())
    #print(html, file=open(r'd:\test.txt','w',encoding='CP936')) #utf-8 latin-1
    trade = html.find('yfs_l84', 0)
    beg   = html.find('>', trade)
    end   = html.find('</span>', beg)
    price = html[beg+1:end]
    price = price.replace(',', '')
    return float(price)

#-----------------------------------------------------------------------

# Accept string stockSymbol as a command-line argument. Write to
# standard output the current stock price for stockSymbol, as reported
# by the website http://finance.yahoo.com/.

def main():
    stockSymbol = sys.argv[1]
    price = priceOf(stockSymbol)
    stdio.writef('%.2f\n', price)

if __name__ == '__main__':
    main()

#-----------------------------------------------------------------------

# python stockquote.py goog
# 540.48

# python stockquote.py adbe
# 83.55

