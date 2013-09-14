import System
import Data.List as L
import Data.Tuple as T

gcCount' nt
    | nt == 'G' = 1.0
    | nt == 'C' = 1.0
    | otherwise = 0.0

gcCount seq = (sum $ map gcCount' seq) / (fromIntegral $ length seq)

pair [] = []
pair (x:y:xs) = (y, dropWhile (=='>') x) : pair xs

{-blocks content output = -}
run = outputValue . T.swap . last . L.sort . countsWithNames . linesWithNames . lines where
    linesWithNames = pair . filter (\x -> (length x) > 0)
    countsWithNames = map (\(x, y) -> (gcCount x, y))
    outputValue t = (T.fst t) ++ "\n" ++ (show $ (T.snd t) * 100.0) ++ "%"

main = do
    (f:_) <- getArgs
    content <- readFile f
    putStrLn $ run content
