{- ABC059C.hs -}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

cReadLn :: IO Int
cReadLn = fst . fromJust . C.readInt <$> C.getLine

getParms :: IO [Int]
getParms = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  n <- cReadLn
  as <- getParms
  print $ f n as

f _ as = as

