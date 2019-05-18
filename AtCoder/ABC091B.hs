{- ABC091B.hs

-}

import Control.Monad (replicateM)
import Data.List (group, sort, length, maximum, (\\))

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main = do
  n  <- readInt
  ss <- replicateM n C.getLine
  m  <- readInt
  ts <- replicateM m C.getLine
--  print $ maximum . uncurry diff $ f ss ts
  print $ solve ss ts

type CB = C.ByteString

f :: [CB] -> [CB] -> ([[CB]],[[CB]])
f ss ts = (gs ss, gs ts) 

gs = group . sort

diff :: [[CB]] -> [[CB]] -> [Int]
diff [] _ = [0]
diff s [] = map length s
diff sss@(s:ss) ttt@(t:ts)
  | head s >  head t =  0 : diff sss ts
  | head s == head t = (length s - length t) : diff ss ts
  | head s <  head t = length s : diff ss ttt

-- https://atcoder.jp/contests/abc091/submissions/2219255
solve :: [CB] -> [CB] -> Int
solve ss ts = f . map length . group . sort $ ds
  where
    f :: [Int] -> Int
    f xs
      | null xs   = 0
      | otherwise = maximum xs
    ds :: [CB]
    ds = ss \\ ts
