import System
import Data.List as L

hDistance :: String -> String -> Double
hDistance s t = sum $ map counter (zip s t) where
    counter (a, b)
        | a == b = 0.0
        | otherwise = 1.0

run :: String -> Double
run content = hDistance s t where
    ls = map (takeWhile (/= '\n')) $ filter (\x -> (length x) > 0) $ lines content
    s = head ls
    t = L.last ls

main = do
    (f:_) <- getArgs
    content <- readFile f
    putStrLn $ show $ truncate $ run content
    {-putStrLn $ show $ map (takeWhile (/= '\n')) $ filter (\x -> (length x) > 0) $ lines content-}
