{- ABC061B.hs
-}

import Control.Monad
  ( replicateM )
import Data.List
  ( sort, group )
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [n,m] <- getParms
  abs   <- replicateM m getParms 
  mapM_ print $ honsu n abs

honsu
  :: Int -> [[Int]] -> [Int]
honsu n as = map length' . group . sort . concat $ ([1..n] : as)
  where
    length' l = length l - 1

