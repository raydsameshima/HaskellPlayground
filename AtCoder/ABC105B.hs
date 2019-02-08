{- ABC105B.hs

Given
  N
determine wether we can use exactly N dollars, buying 4 dollar cackes 
and 7 dollars doughnuts.
-}

main :: IO ()
main = do
  n <- readLn
  putStrLn $ if f n then "No" else "Yes"

f :: Int -> Bool
f n =  null [(a,b) | a <- [0.. aa]
                   , b <- [0.. bb]
                   , 4*a + 7*b == n
                   ]
  where
    aa = n `div` 4
    bb = n `div` 7
