module Main
    where

divides :: Integer -> Integer -> Bool
divides d n = rem n d == 0

ldf :: Integer -> Integer -> Integer
ldf k n
    | k `divides` n = k
    | k^2 > n       = n
    | otherwise     = ldf (k+1) n

ld :: Integer -> Integer
ld = ldf 2

factors :: Integer -> [Integer]
factors 1 = []
factors n = let p = ld n
                  in p : factors (n `div` p)

main :: IO ()
main = print . maximum . factors $ 600851475143
