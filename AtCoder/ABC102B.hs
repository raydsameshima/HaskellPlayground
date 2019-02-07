{- ABC102B.hs

Given
  N (>= 2)
  A1 .. AN
of integers, find the maximum absolute difference of two elements.

Since both B.head and B.last are O(1), we can simply sort as and take head and last.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe 
  ( fromJust )

main = do
  _  <- getLine
  as <- map (fst . fromJust . C.readInt) . C.words <$> C.getLine 
  print $ f as

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
