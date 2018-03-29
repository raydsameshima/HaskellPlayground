{- ABC082.hs -}

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  print $ kiriage (a+b)

kiriage 
  :: Int -> Int 
kiriage n 
  | odd  n = (n+1) `div` 2
  | even n = n     `div` 2

