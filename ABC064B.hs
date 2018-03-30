{- ABC064B.hs -}

main :: IO ()
main = do
  _n <- getLine 
  as <- map read . words <$> getLine
  print $ minimumPath as

minimumPath
  :: [Int] -> Int
minimumPath ls = maximum ls - minimum ls
