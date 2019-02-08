{-
ABC087B.hs

-}

main :: IO ()
main = do
  a <- readLn
  b <- readLn 
  c <- readLn 
  x <- readLn 
  print $ selection a b c x

selection
  :: Int -> Int -> Int -> Int -> Int
selection a b c x
  = length [(s,t,u) | s<-[0..a], t<-[0..b], u<-[0..c]
                    , 500*s + 100*t + 50*u == x]
