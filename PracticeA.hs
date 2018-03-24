{-
PracticeA.lhs

https://beta.atcoder.jp/contests/abs/tasks/practice_1
-}

main :: IO ()
main = do
  a <- readLn
  [b, c] <- map read . words <$> getLine  
  s <- getLine
  putStrLn $ show (a+b+c) ++ " " ++ s

