{- AGC012A.hs 

Given
  N
  a1 .. a3N
of integers, consider a certain combination to maximize the following strength.
Three digits form a group, like,
  1 5 2
The second largest number
  2
is the strength of this group.

Find the maximum possible sum of the strengths of N groups.

To maximize the total, e.g.,
  [1,2,5,5,5,8] -> [[1,8,5],[2,5,5]] -> 5+5 = 10
that is, we can take N-elements in even indexes from the decending (sorted) list.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Data.List ( sortBy )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  n   <- readInt
  ass <- readInts
  print $ f n ass

sort' :: [Int] -> [Int]
sort' = sortBy (flip compare)

f :: Int -> [Int] -> Int
f n ass = h (sort' ass) n 0

h :: [Int] -> Int -> Int -> Int
h _        0 acc = acc
h (_:b:bs) n acc = h bs (n-1) (b+acc)
