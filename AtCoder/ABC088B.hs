{-
ABC88B.hs

-}

import Data.List (sortBy)

sort' 
  :: Ord a => [a] -> [a]
sort' = sortBy (flip compare)

alisAndBob 
  :: Ord a => [a] -> ([a],[a])
alisAndBob ns = helper ns ([],[])
  where
    helper :: Ord a => [a] -> ([a],[a]) -> ([a],[a])
    helper [] ab = ab
    helper [a] ab@(as,bs) = (a:as, bs)
    helper (a:b:cs) ab@(as,bs) = helper cs (a:as, b:bs)

point
  :: ([Int],[Int]) -> Int
point (as,bs) = sum as - sum bs

main :: IO ()
main = do
  _ <- getLine
  as <- map read . words <$> getLine
  print . point . alisAndBob . sort' $ as
