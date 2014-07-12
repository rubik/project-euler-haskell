module Utils
    where

import Data.List

encode :: (Eq a) => [a] -> [(a, Int)]
encode l = [(head i, length i) | i <- group l]

lf :: Integer -> Integer
lf 1 = error "Numbers < 2 not allowed"
lf n
    | n `mod` 2 == 0 = 2
    | otherwise      = head . filter (\i -> n `mod` i == 0) $ [3,5..]

factors :: Integer -> [Integer]
factors 1 = []
factors n = let l = lf n
             in l : factors (n `div` l)

factors' :: Integer -> [(Integer, Int)]
factors' = encode . factors

ndivisors :: Integer -> Int
ndivisors = product . map ((+1) . snd) . factors'

divisors :: Integer -> [Integer]
divisors n = concatMap (\x -> [x, n `div` x]) .
             filter (\x -> n `mod` x == 0) .
             takeWhile (\x -> x*x <= n) $ [1..]
