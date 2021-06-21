module Lib 
    (fatorial,
    taylor,
    ) where

import Data.Array

fatorial :: Int -> Int
fatorial 0 = 1
fatorial 1 = 1
fatorial n = n * fatorial (n-1)

taylor :: Array Int Float -> Float
taylor xs = 1 + sum [((xs!a)^a)/fromIntegral (fatorial a)|a<-[y..z]]
    where 
        (y,z) = bounds xs
