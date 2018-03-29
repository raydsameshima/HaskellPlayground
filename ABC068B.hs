{- ABC068B.hs -}

main :: IO ()
main = do
  n <- readLn 
  print $ 2 ^ (floor $ logBase 2 n)


