{- AGC011A.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe (isJust, fromJust)
import Control.Monad (replicateM)
import Data.List (sort, drop, length, filter, take)
import qualified Data.Vector.Unboxed as U
import Control.Arrow (first) -- first :: Arrow a => a b c -> a (b, d) (c, d)

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,c,k] <- getParms -- passengers, maximum num in a bus, and limit time
--  ts <- (U.fromList . sort) <$> replicateM n cReadLn -- i-th passenger's arrival time
  ts <- sort <$> replicateM n cReadLn -- i-th passenger's arrival time
  print $ length $ solve ts c k

f :: Int -> Int -> U.Vector Int -> Int
f c k ts = solver c k ts 0
  where
    solver :: Int -> Int -> U.Vector Int -> Int -> Int
    solver _ _ ts n 
      | U.null ts = n
    solver c k ts n = solver c k qs (n+1)
      where p  = inABus c k ts
            qs = U.drop p ts

overWrap :: Int -> Int -> Int -> Int
overWrap k t0 t1 = (t0+k - t1)

inABus 
  :: Int -> Int -> U.Vector Int -> Int
inABus c k tt = U.length . U.filter (0<=) . U.map (overWrap k t) . U.take c $ tt
  where
    t = U.head tt

-- https://atcoder.jp/contests/agc011/submissions/3109211

solve :: [Int] -> Int -> Int -> [[Int]]
solve [] _ _ = []
solve xs c k = a : solve b c k
  where
    (a,b) = aux (head xs) xs 1
    aux :: Int -> [Int] -> Int -> ([Int],[Int])
    aux _  []        _  = ([],[])
    aux t0 xx@(x:xs) c0
      | c0 <= c && x <= t0+k = first (x:) (aux t0 xs (c0+1))
      | otherwise            = ([], xx)

-- first (1:) :: ([Int], [Int]) -> ([Int], [Int])

solve' :: Int -> Int -> [Int] -> [[Int]]
solve' _ _ [] = []
solve' c k xs@(x:_) = a : solve' c k ys
  where
    (a,ys) = aux x xs 1
    aux :: Int ->[Int] -> Int -> ([Int], [Int])
    aux _ [] _ = ([],[])
    aux t xx@(x:xs) c0
      | c0<=c && x<= t+k = (\(cs,ds) -> ((x:cs), ds)) (aux t xs (c0+1))
      | otherwise        = ([],xx)
