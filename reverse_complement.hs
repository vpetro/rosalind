import System

complement' nt
    | nt == 'A' = 'T'
    | nt == 'C' = 'G'
    | nt == 'T' = 'A'
    | nt == 'G' = 'C'
    | otherwise = error "this is bad"

complement = map complement'

main = do
    (f:_) <- getArgs
    string <- readFile f
    putStrLn $ (complement . reverse) $ takeWhile (/= '\n') string
