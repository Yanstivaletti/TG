module Lib (
    mapMat,
    mat,
    quadrado
)where

import Data.Array ( Ix, array, bounds, elems, listArray, Array )
--Matriz de teste
mat :: Array (Integer, Integer) Integer
mat = array ((1,1),(2,3)) [((1,1),4),((1,2),0),((1,3),8),((2,1),7),((2,2),1),((2,3),7)]


mapMat :: Ix i => (a -> e) -> Array i a -> Array i e
mapMat func matz = listArray (bounds matz) (map func (elems matz))

--Função de teste

quadrado :: Num a => a -> a
quadrado x = x*x