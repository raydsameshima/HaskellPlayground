{- ABC047B.hs

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Control.Monad (replicateM)

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [w,h,n] <- getParms              :: IO [Int]
  xya     <- replicateM n getParms :: IO [[Int]]
  print $ area $ f w h xya

initialize
  :: Int -> Int -> ([Int],[Int])
initialize w h = ([0 .. w-1], [0 .. h-1])

cut :: ([Int],[Int]) -> [Int] -> ([Int], [Int])
cut (xs,ys) [x,y,a]
  | a == 1 = (xs1, ys)
  | a == 2 = (xs2, ys)
  | a == 3 = (xs,  ys3)
  | a == 4 = (xs,  ys4)
  where
    xs1 = dropWhile (< x) xs
    xs2 = takeWhile (< x) xs
    ys3 = dropWhile (< y) ys
    ys4 = takeWhile (< y) ys

f :: Int -> Int -> [[Int]] -> ([Int], [Int])
f w h = foldl cut (initialize w h) 

area (xs,ys) = length xs * length ys
