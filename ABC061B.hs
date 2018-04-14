{- ABC061B.hs -}

import Control.Monad
  ( replicateM )
import Data.List
  ( sort, group )

main :: IO ()
main = do
  [n,m] <- map read . words <$> getLine
  abs   <- replicateM m $ map read . words <$> getLine 
  mapM_ print $ honsu n abs

honsu
  :: Int -> [[Int]] -> [Int]
honsu n as = map length' . group . sort . concat $ ([1..n] : as)
  where
    length' l = length l - 1

