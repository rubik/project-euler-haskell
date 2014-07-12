module Main
    where

import Data.Char
import Data.Function.Memoize

factorial :: Int -> Int
factorial 0 = 1
factorial n = n * factorial (n-1)

factorialSum :: Int -> Int
factorialSum = sum . map (factorial . digitToInt) . show

chainLength' :: Int -> Int
chainLength' n = cl n [n]
    where
        cl n acc
            | fs `elem` acc = length acc
            | otherwise     = cl fs (fs : acc)
                where fs = factorialSum n

chainLength = memoize chainLength'

main :: IO ()
main = print . length . filter (==60) . map chainLength $ [1..1000000]
