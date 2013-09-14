import qualified Data.List as L

getCounts s = map counter (grouper $ takeWhile (/= '\n') s) where
    counter = \l -> (head l, length l)
    grouper = L.group . L.sort

main = do
    string <- readFile "rosalind_dna.txt"
    putStrLn $ show $ getCounts string

