{- ABC081C.hs

-}

import Data.List
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,k] <- readInts
  as    <- readInts
  print $ f n k as

f :: Int -> Int -> [Int] -> Int
f n k as 
  | k >= l = 0
  | k <  l = g as'' (l-k) 0
  where
    as'  = group $ sort as
    l    = length as'
    as'' = map length $ sortOn length as'

    g :: [Int] -> Int -> Int -> Int
    g _      0 x = x
    g (b:bs) k x = g bs (k-1) (x + b)

