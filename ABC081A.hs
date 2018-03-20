{- PracticeA.lhs

https://beta.atcoder.jp/contests/abs/tasks/abc081_a?lang=en
-}

main :: IO ()
main = do
  s <- getLine
  let n = length . filter (=='1') $ s
  print n
