{- AGC013A2.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Data.List

import qualified Data.Vector.Unboxed as VU


-- https://myuon.github.io/posts/haskell-atcoder/

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

main :: IO ()
main = do
  n  <- readInt 
  as <- VU.unfoldrN n C.readInt <$> C.getLine
  print $ as 


f :: VU.Vector Int -> Int
f = VU.sum

{-

h :: Int -> [Int] -> Int
h s []  = s+1
h s [_] = s+1
h s (i:is@(j:_))
  | i == j    = h s is
  | i <  j    = g s (<) is
  | otherwise = g s (>) is

g :: Int -> (Int -> Int -> Bool) -> [Int] -> Int
g s _ []  = s+1
g s _ [_] = s+1
g s op (i:is@(j:_))
  | i == j    = g s op is
  | i `op` j  = g s op is
  | otherwise = h (s+1) is

-}
