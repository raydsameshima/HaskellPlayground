{- ABC081A.hs

Given three digits 
  s1s2s3
of either 0 or 1, count the number of 1 in this input.

main = interact $ show . length . filter (== '1')

-}

main
  :: IO ()
main = do
  s <- getLine :: IO String
  print $ count1 s 

count1
  :: String -> Int
count1 = length . filter (=='1')
