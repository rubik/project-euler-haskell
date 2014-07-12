module Main
    where

main :: IO ()
main = print . flip mod (10^10) . sum . map (\i -> i^i) $ [1..1000]
