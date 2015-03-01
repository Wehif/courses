def make_change(amount, coins)
  coins.sort!.reverse!
  coins.map!{|coin|
              set=amount/coin
              amount%=coin
              Array.new(set){coin}
              }
  p coins.flatten!
end

p "Amount 23", "Coins [5,30,7,2,1]"
make_change(23, [5, 30, 7, 2, 1])
