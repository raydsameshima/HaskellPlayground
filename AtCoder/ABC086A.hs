{- ABC086A.hs

https://beta.atcoder.jp/contests/abs/tasks/abc086_a

For input form
  a b
determine whether the product of a and b is even or odd.
The output form must be either
  Odd
or
  Even
.
-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

readInts :: IO [Int]
readInts = map (fst . fromJust . C.readInt) . C.words <$> C.getLine

main :: IO ()
main = do
  [a,b] <- readInts
  putStrLn $ if isOddOrEven a b 
               then "Odd"
               else "Even"

isOddOrEven
  :: Int -> Int -> Bool
isOddOrEven a b = odd a && odd b 
