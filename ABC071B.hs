{- ABC071B.hs -}

main :: IO ()
main = do
  s <- getLine
  putStrLn . toString . none' $ s

none'
  :: String -> Maybe Char
none' x 
  = if null fx then Nothing
               else Just $ head fx
  where
    fx = dropWhile (`elem` x) ['a' .. 'z']

toString
  :: Maybe Char -> String
toString (Just c) = [c]
toString Nothing  = "None"
