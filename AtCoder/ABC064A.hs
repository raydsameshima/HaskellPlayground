{- ABC064A.hs 

https://atcoder.jp/contests/abc064/tasks/abc064_a

For integer inputs
  r g b
read them as a three-digit integer, and determine 
wether it is a multiple of 4 or not.
Print
  YES
if it is, otherwise
  NO
-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [_,g,b] <- readInts
  let n = 10*g + b 
  putStrLn $ if m4 n 
               then "YES" 
               else "NO" 

m4 :: Int -> Bool
m4 n = n `rem` 4 == 0
