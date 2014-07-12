module Main
    where

main :: IO ()
main = print . foldl1 lcm $ [1..20]
