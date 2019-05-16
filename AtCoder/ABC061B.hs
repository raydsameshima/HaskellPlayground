{- ABC061B.hs
Given
  n m
  a1 b1
  ...
  am bm
of n-cities, m-roads, find the number of roads connected to each city,
where 
  a1 b1
means there is one road between two cities.

There could be an island, i.e., a no-path-path-connected city.
To avoid such a case, we first add [1..n] as the label for the cities.

-}

import Control.Monad ( replicateM )
import Data.List ( sort, group )
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,m] <- readInts
  abs   <- replicateM m readInts
  mapM_ print $ honsu n abs

honsu
  :: Int -> [[Int]] -> [Int]
honsu n as = map length' . group . sort . concat $ ([1..n] : as)
  where
    length' l = length l - 1
