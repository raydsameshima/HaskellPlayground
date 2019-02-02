{- ABC069B.hs

Abbreviate 
  s :: String
in such a way that
  internationalization -> i18n
.

-}

main :: IO ()
main = do
  s <- getLine
  putStrLn $ shorten s

shorten
  :: String -> String
shorten s = i : (show n) ++ [f]
  where
    i = head s
    f = last s
    n = length s - 2
