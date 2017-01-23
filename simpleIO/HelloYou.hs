main :: IO()
main = do
        print "What's your name?"
        line <- getLine
        print $ "Hello " ++ line ++ "!"