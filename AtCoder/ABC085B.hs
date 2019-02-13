{- ABC085B.hs

-}

import Data.List (nub, sort)
import Control.Monad (replicateM)

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  n <- cReadLn
  ds <- replicateM n cReadLn
  print $ mochi ds

mochi
  :: [Int] -> Int
mochi = length . nub . sort


