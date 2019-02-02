{- ABC095.hs

Given three letters string
  s
consists of either 
  o
or
  x
print the total price of the ramen.
The price is given by
  700 + (the number of x)*100

-}

main :: IO ()
main = do
  s <- getLine
  print $ price s

price
  :: String -> Int
price s = 700 + 100*os
  where
    os = length . filter (== 'o') $ s
