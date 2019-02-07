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

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  putStrLn $ oddOrEven' a b

oddOrEven'
  :: Int -> Int -> String
oddOrEven' a b
  | odd a && odd b = "Odd"
  | otherwise      = "Even"
