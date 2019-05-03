{- 
ABC072B.hs

Given
  s
of string, print the odd-indexd positions of s, where the index is
  [1 .. ]

*Main> zip "atcoder" $ cycle [True, False]
[('a',True),('t',False),('c',True),('o',False),('d',True),('e',False),('r',True)]
*Main> map fst $ filter snd $ it
"acdr"

-}

main :: IO ()
-- main = interact $ pickOdds2
main = do
  s <- getLine
  putStrLn $ pickOdds2 s
 
pickOdds, pickOdds'
  :: [a] -> [a]
pickOdds []       = []
pickOdds [a]      = [a]
pickOdds (a:_:bs) = a : pickOdds bs 
 
pickOdds' = map snd . filter (odd . fst) . zip [1..]
 
pickOdds2 = map snd . filter fst . zip (cycle [True, False])
