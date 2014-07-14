module Main
    where

import Data.List
import Data.Maybe

cubes :: [Integer]
cubes = map (^3) [0..10000]
bases = map (sort . show) cubes

main :: IO ()
main = print $ d^3
    where
        cube = head . head . filter ((==5) . length) . group . sort $ bases
        Just d = elemIndex cube bases
