{- ABC090B.hs -}

main :: IO ()
main = do
  [a,b] <- map read . words <$> getLine
  print $ numberOfPalindrome a b

numberOfPalindrome
  :: Int -> Int -> Int
numberOfPalindrome a b = length . filter id . map isP $ [a .. b]

isP 
  :: Int -> Bool
isP n = n == hikkurikaeshi n

hikkurikaeshi
  :: Int -> Int
hikkurikaeshi = read . reverse . show
