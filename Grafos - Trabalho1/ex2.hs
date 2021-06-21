module Lib(
    acronimo
    )where

import Data.Char ( ord )

acronimo :: String -> String
acronimo [] = []
acronimo (x:xs) 
 |ord x > 64 && ord x < 91 = x:acronimo xs
 |otherwise = acronimo xs