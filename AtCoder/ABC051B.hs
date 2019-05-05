{- ABC051B.hs 

Given
  k s
how many different assignmants of x,y,z are there, under
  0 <= x,y,z <= k
  x+y+z = s

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [k, s] <- readInts
  print $ f k s

numbers
  :: Int -> Int -> Int
numbers k = length . numbers' k 

numbers' :: Int -> Int -> [(Int,Int,Int)]
numbers' k s 
  = [ (x,y,z) | x <- [0..k]
              , y <- [0..k]
              , let z = s - x - y
              , 0 <= z && z <= k
              ]
{-
https://atcoder.jp/contests/abc051/submissions/1127311

When s-2*k < 0 holds, x and y can reach k(maximum) and then z will be zero.
Let x run [0 .. k].
Since z can be 0,  y is in [0 .. min k (s-x)], where k is again the maximum
value all x,y, and z can run.
-}

f :: Int -> Int -> Int
f k s = length [(x,y,z) | let m = max 0 (s-2*k)
                        , x <- [m .. k]
                        , y <- [m .. min k (s-x)]
                        , let z = s-x-y
                        , 0 <= z && z <= k
                        ]
