module Main
    where

import Data.List
import Control.Applicative

main :: IO ()
main = print . length . group . sort $ liftA2 (^) [2..100] [2..100]
