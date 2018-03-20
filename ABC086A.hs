{- PracticeA.lhs

https://beta.atcoder.jp/contests/abs/tasks/abc086_a
-}

main :: IO ()
main = do
  [a,b] <- toListOfInt
--  let c = oddOrEven (a*b)
--  putStrLn c
  putStrLn $ oddOrEven' a b

-- To read spaced inputs.
toListOfInt 
  :: Read b => IO [b]
toListOfInt = map read . words <$> getLine

oddOrEven
  :: Int -> String
oddOrEven n
  | even n    = "Even"  
  | odd  n    = "Odd"
  | otherwise = error "oddOrEven: "

oddOrEven'
  :: Int -> Int -> String
oddOrEven' a b
  | odd a && odd b = "Odd"
  | otherwise      = "Even"
