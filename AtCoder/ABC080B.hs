{- ABC080B.hs 

-}

import Data.Char
  ( digitToInt )

main :: IO ()
main = do
  n <- readLn
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
