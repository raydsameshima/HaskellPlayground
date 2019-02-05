{- ABC102B.hs

Given
  N
  A1 .. AN
of integers, find the maximum absolute difference of two elements.

-}

main :: IO ()
main = do
  _  <- getLine
  as <- map read . words <$> getLine :: IO [Int]
  print . f $ as

f :: [Int] -> Int
f (a:b:bs) 
  | a < b     = g (a,b) bs
  | otherwise = g (b,a) bs

g :: (Int,Int) -> [Int] -> Int
g (s,l) [] = l-s
g sl@(s,l) (x:xs)
  | x < s = g (x,l) xs
  | l < x = g (s,x) xs
  | otherwise = g sl xs

