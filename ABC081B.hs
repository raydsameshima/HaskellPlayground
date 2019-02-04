{- ABC081B.hs

Given
  N
  A1 A2 .. AN
of integers, find the maximum possible number of the following operation
  X -> X `div` 2
when X is even.

*Main> let as = [8,12,40]
*Main> and $ map even as
True
*Main> and $ map even $ map (`div` 2) as
True
*Main> and $ map even $ map (`div` 2) $ map (`div` 2) as
False
-}

main :: IO ()
main = do
  _ <- getLine
  as <- map read . words <$> getLine
  print $ counter as

counter
  :: [Int] -> Int
counter ns = helper ns 0
  where
    helper :: [Int] -> Int -> Int
    helper ms k
      | and $ map even ms = helper ms' (k+1)
      | otherwise         = k
      where
        ms' = map (`div` 2) ms

