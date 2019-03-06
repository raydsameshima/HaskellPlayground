{- AGC013A.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Data.List

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  n  <- cReadLn
  as <- getParms
  print $ f as 

f :: [Int] -> Int
f = h 0
  where
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
   

