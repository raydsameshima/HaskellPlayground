{- ABC080B.hs 

Harshad number.
Given
  n
determine wether its sum of digits is Harshad or not.

-}

import qualified Data.ByteString.Char8 as C
import Data.Maybe ( fromJust )
import Data.Char ( digitToInt )

readInt :: IO Int
readInt = fst . fromJust . C.readInt <$> C.getLine

main :: IO ()
main = do
  n <- readInt
  putStrLn $ if isHarshad n then "Yes" else "No"

isHarshad
  :: Int -> Bool
isHarshad x 
  = let fx = sumDigits x  
    in 0 == x `rem` fx

sumDigits, sumDigits'
  :: Int -> Int
sumDigits = sum . map digitToInt . show

sumDigits' = sum . int2lst
int2lst n
  | q == 0 = [r]
  | otherwise = r : int2lst q
  where
    (q,r) = divMod n 10
