module Main
    where

ring :: Int -> Int
ring 0 = 1
ring n = 16*n^2 + 4*n + 4

main :: IO ()
main = print . sum . map ring $ [0..500]
