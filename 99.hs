module Main
    where

import Data.List
import Data.List.Split
import Data.Function

extract :: String -> [[Integer]]
extract = map (map (\i -> read i :: Integer) . splitOn ",") . lines

ex :: [Integer] -> Double
ex [a,b] = fromInteger b * log (fromInteger a)

maxLine :: [[Integer]] -> Int
maxLine l = fst . maximumBy (compare `on` (ex . snd)) . zip [1..] $ l

main :: IO ()
main = do
    content <- readFile "base_exp.txt"
    print . maxLine . extract $ content
