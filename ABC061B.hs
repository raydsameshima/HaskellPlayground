{- ABC061B.hs -}

import Control.Monad
  ( replicateM )
import Data.List
  ( sort, group )

main :: IO ()
main = do
  [_,m] <- map read . words <$> getLine
  abs   <- replicateM m $ map read . words <$> getLine
  mapM_ print $ honsu abs 

honsu
  :: [[Int]] -> [Int]
honsu = map length . group . sort . concat
