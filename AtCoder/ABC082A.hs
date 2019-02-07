{- ABC082.hs

Given two integers
  a b
print the rounded number of the average
  (a+b)/2
.

-}

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  print $ (a+b+1) `div` 2

kiriage 
  :: Int -> Int 
kiriage n 
  | odd  n = (n+1) `div` 2
  | even n = n     `div` 2
