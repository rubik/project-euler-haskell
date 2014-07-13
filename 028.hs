module Main
    where

ring :: Int -> [Int]
ring n = [l, l + 2*n, l + 4*n, l + 6*n]
    where l = 4*n^2 - 2*n + 1

main :: IO ()
main = print . (1+) . sum . concatMap ring $ [1..500]
