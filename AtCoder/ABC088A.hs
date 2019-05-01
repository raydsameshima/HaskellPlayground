{- ABC088A.hs 

Given
  n
  a
consider the following problem; determine if one can pay
  n
yen using 
  a
1-yen coins and infinite 500-yen coins.
Print
  Yes
if one can, otherwise
  No
.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

main :: IO ()
main = do
  n <- readInt
  a <- readInt
  putStrLn $ canPay n a

canPay :: Int -> Int -> String
canPay n a = let r = n `rem` 500 in
  if r > a 
    then "No"
    else "Yes" 

