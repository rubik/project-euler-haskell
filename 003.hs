module Main
    where

import Utils (factors)

main :: IO ()
main = print . maximum . factors $ 600851475143
