{- ABC085A.hs

Modefy yyyy/mm/dd format from
  2017/mm/dd
to
  2018/mm/dd

-}

main
  :: IO () 
main = do
  s <- getLine
  putStrLn $ modify s

modify
  :: String -> String
modify s = "2018" ++ (drop 4 s)
