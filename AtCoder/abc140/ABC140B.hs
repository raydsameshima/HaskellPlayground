{- B - Buffet

Given inputs
  n
  a1 a2 ..
  b1 ..
  c1 ..
print the sum of satisfaction points.

-}


import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  _n <- readInt
  as <- readInts
  bs <- readInts
  cs <- readInts
  print $ f as bs cs

f :: [Int] -> [Int] -> [Int] -> Int
f = h 0 
 
h acc [a1]             bs _  = acc + (bs!!(a1-1)) 
h acc (a1:as@(a2:as')) bs cs = h acc' as bs cs
  where
    acc' = acc + (bs!!(a1-1)) + (if a2==a1+1 then (cs !! (a1-1)) else 0)

