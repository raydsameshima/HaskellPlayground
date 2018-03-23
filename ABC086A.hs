{- PracticeA.lhs

https://beta.atcoder.jp/contests/abs/tasks/abc086_a
-}

main :: IO ()
main = do
  [a,b] <- toListOfInt
  putStrLn $ oddOrEven' a b

-- To read spaced inputs.
toListOfInt 
  :: Read b => IO [b]
toListOfInt = map read . words <$> getLine

oddOrEven'
  :: Int -> Int -> String
oddOrEven' a b
  | odd a && odd b = "Odd"
  | otherwise      = "Even"
