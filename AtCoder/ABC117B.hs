{- ABC117B.hs

Given
  N
  L1 .. LN
of an N sides, determine wether N-polygon can be drawn or not.

iff condition; the longest side is strictly shorter than the sum of the rest.
-}

main :: IO ()
main = do
  _ <- getLine
  ls <- map read . words <$> getLine :: IO [Int]
  putStrLn $ if f ls then "Yes"
                     else "No"

f :: [Int] -> Bool
f ls = 2*(maximum ls) < (sum ls) 
    
