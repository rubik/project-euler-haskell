module Main
    where

import Control.Applicative

isPal :: Integer -> Bool
isPal n = n == (read . reverse . show $ n :: Integer)

max' :: [Integer] -> Integer
max' r = maximum . filter isPal . liftA2 (*) r $ r

main = print . max' $ [900..999]  -- no need to do lower combinations
