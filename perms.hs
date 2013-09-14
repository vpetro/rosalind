import System
import Data.List as L

ppList lst = (replace ',' ' ' . dropBrackets . show) lst where
    dropBrackets = takeWhile (/= ']') . tail
    replace a b = map (\x -> if x == a then b else x)

run x = intercalate "\n" [show $ length perms, intercalate "\n" (map ppList perms)] where
    perms = L.permutations [1..x]

main = do
    putStrLn $ run 6
