{- ABC067B.hs 

-}

import Data.List
  ( sortBy )

main :: IO ()
main = do
  [_,k] <- map read . words <$> getLine
  ls    <- map read . words <$> getLine
  print $ maxSnuke k ls

maxSnuke
  :: Int -> [Int] -> Int
maxSnuke k = sum . take k . sortBy (flip compare)
