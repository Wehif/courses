(1..100).each{|el| if el%3==0 || el%5==0
                     print "Up" if el%3==0
                     print "Down" if el%5==0
                     print "\n"
                   else
                     puts el
                   end}
