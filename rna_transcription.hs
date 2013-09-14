import System
transcribe = map (\x -> if x == 'T' then 'U' else x)

main = do
    (f:_) <- getArgs
    string <- readFile f
    putStrLn $ transcribe string
