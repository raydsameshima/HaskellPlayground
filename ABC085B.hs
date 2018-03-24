{-
ABC085B.hs
-}

import Data.List (nub, sort)
import Control.Monad (replicateM)

mochi
  :: [Int] -> Int
mochi = length . nub . sort

main = do
  n <- readLn
  ds <- replicateM n readLn
  print $ mochi ds
