PracticeA.lhs

https://beta.atcoder.jp/contests/abs/tasks/practice_1

> main :: IO ()
> main = do
>   a <- readLn
>   [b, c] <- toListOfInt
>   s <- getLine
>   putStrLn $ show (a+b+c) ++ " " ++ s

> toListOfInt 
>   :: Read b => IO [b]
> toListOfInt = map read . words <$> getLine

