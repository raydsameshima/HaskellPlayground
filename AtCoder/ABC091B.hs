{- ABC091B.hs

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Control.Monad (replicateM)
import Data.List (group, sort, length, maximum)

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

main = do
  n <- cReadLn
  ss <- replicateM n C.getLine
  m <- cReadLn
  ts <- replicateM m C.getLine
  print $ maximum . uncurry diff $ f ss ts

f ss ts = (gs ss, gs ts) 

gs = group . sort

diff :: [[C.ByteString]] -> [[C.ByteString]] -> [Int]
diff [] _ = [0]
diff s [] = map length s
diff sss@(s:ss) ttt@(t:ts)
  | head s >  head t =  0 : diff sss ts
  | head s == head t = (length s - length t) : diff ss ts
  | head s <  head t = length s : diff ss ttt
