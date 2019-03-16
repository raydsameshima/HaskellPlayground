{- AGC011A.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe (isJust, fromJust)
import Control.Monad (replicateM)
import Data.List (sort, drop, length, filter, take)
-- import qualified Data.Vector.Unboxed as U
import Control.Arrow (first) -- first :: Arrow a => a b c -> a (b, d) (c, d)

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,c,k] <- getParms -- passengers, maximum num in a bus, and limit time
  ts <- sort <$> replicateM n cReadLn -- i-th passenger's arrival time
  print $ solve' c k ts
  print $ length $ solve' c k ts

-- https://atcoder.jp/contests/agc011/submissions/3109211

{-
solve :: Int -> Int -> [Int] -> [[Int]]
solve _ _ [] = []
solve c k xs@(x:_) = a : solve c k b
  where
    (a,b) = aux x xs 1
    aux :: Int -> [Int] -> Int -> ([Int],[Int])
    aux _  []        _  = ([],[])
    aux t0 xx@(x:xs) c0
      | c0 <= c && x <= t0+k = first (x:) (aux (c0+1) t0 xs)
      | otherwise            = ([], xx)
-}

-- first (1:) :: ([Int], [Int]) -> ([Int], [Int])

solve' :: Int -> Int -> [Int] -> [[Int]]
solve' _ _ [] = []
solve' c k xs@(x:_) = a : solve' c k ys
  where
    (a,ys) = aux x xs 1

    aux :: Int ->[Int] -> Int -> ([Int], [Int])
    aux _ [] _ = ([],[])
    aux t xx@(x:xs) c0
      | c0<=c && x<= t+k = first (x:) (aux t xs (c0+1))
      | otherwise        = ([],xx)
