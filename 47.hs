module Main
    where

import Data.List
import Utils

ndf :: Integer -> Int
ndf = length . nub . factors

scanChunks :: Int -> [[Int]] -> Int
scanChunks n (x:xs)
    | x == [4,4,4,4] = n
    | otherwise      = scanChunks (n+length x) xs

main = print . scanChunks 647 . group . map ndf $ [647..]
