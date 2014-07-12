module Main
    where

import Data.Char

chunks :: [a] -> [[a]]
chunks l = map (\i -> take 13 $ drop i l) [0..987]

maxProd :: [Int] -> Int
maxProd = maximum . map product . chunks

main :: IO ()
main = do
    content <- readFile "8.txt"
    print . maxProd . map digitToInt . concat . lines $ content
