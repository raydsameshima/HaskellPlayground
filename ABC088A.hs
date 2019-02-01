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

main :: IO ()
main = do
  n <- readLn 
  a <- readLn
--  let q = n `rem` 500
--  putStrLn $ if q <= a then "Yes" else "No"
  putStrLn $ canPay' n a

canPay :: Int -> Int -> Bool
canPay n a = let r = n `rem` 500 in
  if r > a -- If the reminder is smaller than the amount one has, then one can pay.
    then False
    else True

canPay' :: Int -> Int -> String
canPay' n a
  | canPay n a = "Yes"
  | otherwise  = "No"
