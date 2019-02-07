{- ABC117A.hs

Given
  T X
of inputs, compute
  T/X
.

-}

main :: IO ()
main = do
  [t,x] <- map read . words <$> getLine
  print $ (toEnum t) / (toEnum x)
