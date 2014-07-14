module Utils
    where

import Data.List

encode :: (Eq a) => [a] -> [(a, Int)]
encode l = [(head i, length i) | i <- group l]

lf :: Integer -> Integer
lf 1 = error "Numbers < 2 not allowed"
lf n
    | n `mod` 2 == 0 = 2
    | otherwise      = if null a then n else head a
        where
            l = floor . sqrt . fromIntegral $ n
            a = filter (\i -> n `mod` i == 0) [3,5..l]

factors :: Integer -> [Integer]
factors 1 = []
factors n = let l = lf n
             in l : factors (n `div` l)

factors' :: Integer -> [[Integer]]
factors' = group . factors

factors'' :: Integer -> [(Integer, Int)]
factors'' = encode . factors

ndivisors :: Integer -> Int
ndivisors = product . map ((+1) . snd) . factors''

divisors :: Integer -> [Integer]
divisors n = concatMap (\x -> [x, n `div` x]) .
             filter (\x -> n `mod` x == 0) .
             takeWhile (\x -> x*x <= n) $ [1..]

sdivisors :: Integer -> Integer
sdivisors n = product [(p * product g - 1) `div` (p - 1) | g <- factors' n,
                       let p = head g] - n

primes :: [Integer]
primes = 2 : filter ((==1) . length . factors) [3,5..]

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

totient :: Integer -> Integer
totient n = (m*) . product . map ((\p -> p-1) . fst) $ f
    where
        f = factors'' n
        m = product . map (\(p,e) -> p^(e-1)) $ f

-- Using Arrows
{-totient n = uncurryN div . (num &&& product) $ f
    where
        f = map fst . factors'' $ n
        num = (n*) . product . map (\p -> p-1)-}
