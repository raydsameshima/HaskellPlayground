{- 
ABC072B.hs

*Main> as = "atcoder"
*Main> zip [1..] as
[(1,'a'),(2,'t'),(3,'c'),(4,'o'),(5,'d'),(6,'e'),(7,'r')]
*Main> filter (odd . fst) it
[(1,'a'),(3,'c'),(5,'d'),(7,'r')]
*Main> map snd it
"acdr"
-}

main :: IO ()
main = interact pickOdds

pickOdds, pickOdds'
  :: [a] -> [a]
pickOdds []       = []
pickOdds [a]      = [a]
pickOdds (a:b:bs) = a : pickOdds bs 

pickOdds' = map snd . filter (odd . fst) . zip [1..]

