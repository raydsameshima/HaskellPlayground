{- ABC088A.hs -}

main :: IO ()
main = do
  n <- readLn
  a <- readLn
  let q = n `rem` 500
  putStrLn $ if q <= a then "Yes" else "No"
