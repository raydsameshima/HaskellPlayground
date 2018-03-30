{- ABC042B.hs -}

import Control.Monad
  ( replicateM )
import Data.List
  ( sort )

main :: IO ()
main = do
  [n,l] <- map read . words <$> getLine
  ss    <- replicateM n getLine
  putStrLn $ minimumCombination ss

minimumCombination
  :: [String] -> String
minimumCombination = concat . sort
