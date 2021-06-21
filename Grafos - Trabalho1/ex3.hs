module Lib (
    romano
    )where

romano :: Int -> String
romano 0 = []
romano x
 | x >= 1000 = 'M':romano (x-1000) 
 | x == 900 = 'C':'M':romano (x-9)
 | x >= 500 = 'D':romano (x-500)
 | x == 400 = 'C':'D':romano (x-4)
 | x >= 100 = 'C':romano (x-100)
 | x == 90 = 'X':'C':romano (x-9)
 | x >= 50 = 'L':romano (x-50)
 | x == 40 = 'X':'L':romano (x-4)
 | x >= 10 = 'X':romano (x-10)
 | x == 9 = 'I':'X':romano (x-9)
 | x >= 5 = 'V':romano (x-5)
 | x == 4 = 'I':'V':romano (x-4)
 | otherwise = 'I':romano (x-1)
 
 

