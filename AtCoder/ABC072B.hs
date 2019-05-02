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
main = interact pickOdds -- non-prime performs well

pickOdds
  :: [a] -> [a]
pickOdds = map snd . filter fst . zip (cycle [True, False])
