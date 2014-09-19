module Main
    where

import Data.List (maximumBy)
import Data.List.Split (splitOn)
import Data.Ord (comparing)

extract :: String -> [[Integer]]
extract = map (map (\i -> read i :: Integer) . splitOn ",") . lines

ex :: [Integer] -> Double
ex [a,b] = fromInteger b * log (fromInteger a)

maxLine :: [[Integer]] -> Int
maxLine l = fst . maximumBy (comparing (ex . snd)) . zip [1..] $ l

main :: IO ()
main = do
    content <- readFile "base_exp.txt"
    print . maxLine . extract $ content
