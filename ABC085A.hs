{-
ABC085A.hs
-}

main :: IO () 
main = do
  s <- getLine
  putStrLn $ modify s

modify :: String -> String
modify s = "2018" ++ (drop 4 s)
  
