module Lib(
    fatoresprimos,
    primos
    )where


primos :: [Integer]
primos = 2:filter ((==1). length . fatoresprimos) [3,5..]

fatoresprimos :: Integer -> [Integer]
fatoresprimos n = fator n primos 
 where
    fator n (p:ps)
     | p *p > n = [n]
     | n `mod` p == 0 = p : fator (n `div` p) (p:ps)
     | otherwise  = fator n ps