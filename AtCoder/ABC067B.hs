{- ABC067B.hs 

-}

import Data.List ( sort, sortBy )
import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [_,k] <- readInts 
  ls    <- readInts 
--  print $ maxSnuke k ls
  print $ solve ls k 

maxSnuke
  :: Int -> [Int] -> Int
maxSnuke k = sum . take k . sortBy (flip compare)

-- https://atcoder.jp/contests/abc067/submissions/4912288
solve :: [Int] -> Int -> Int
solve = (sum .) . flip take . sortBy (flip compare) 
