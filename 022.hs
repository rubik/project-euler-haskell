module Main
    where

import Data.Char
import Data.List

score :: String -> Int
score = sum . map (\c -> ord c - ord 'A' + 1)

main :: IO ()
main = do
    content <- readFile "names.txt"
    print . sum $ zipWith (*) [1..] $ map score . sort . read $ "["++content++"]"
