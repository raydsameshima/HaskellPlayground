{- PracticeA.lhs

https://beta.atcoder.jp/contests/abs/tasks/abc086_a
-}

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  putStrLn $ oddOrEven' a b

oddOrEven'
  :: Int -> Int -> String
oddOrEven' a b
  | odd a && odd b = "Odd"
  | otherwise      = "Even"
