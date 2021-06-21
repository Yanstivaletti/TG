import Grafo2
import GrafoListAdj

grafo1 = novoGrafo 1 []
grafo2 = novoGrafo 3 [ (2,3),(1,2),(1,3)]
grafo3 = novoGrafo 3 []
grafo4 = novoGrafo 4 [(1,4), (2,3), (2,4), (1,3)]
grafo5 = novoGrafo 2 [(1,2)]
trilhaeuleriana = novoGrafo 7 [(1,2),(1,7),(3,6),(4,5),(5,6), (5,7), (6,7),(2,3),(2,6),(2,7),(3,4),(3,5)]
semieuleriano = novoGrafo 6 [(1,2),(1,5),(1,6),(2,3),(2,4),(2,6),(3,4),(4,5),(4,6),(5,6)]
halmitoniano = novoGrafo 6 [(1,2), (1,3), (1,6), (2,3), (2,4), (3,5), (4,5), (4,6), (5,6)]
 
--fundeVértices grafo1 2 3
--LsAdj (fromList [(1,[4,2,2]),(2,[1,4,1]),(3,[1,2])])
--fundeVértices grafo2 1 2
--LsAdj (fromList [(1,[3,3,1,1]),(3,[1,1])])
--fundeVértices grafo3 1 2
--(fromList [(1,[4,3,4,3,1,1]),(3,[1,4,1]),(4,[1,3,1])])
--contraiVértices grafo1 2 3
--LsAdj (fromList [(1,[4,2]),(2,[1,4]),(4,[1,2])])

--contraiVértices grafo2 1 2
--LsAdj (fromList [(1,[2,2]),(2,[1])])
--contraiVértices grafo4 1 2
--LsAdj (fromList [(3,[1,3]),(1,[4,3,2,1]),(4,[1,2])])

--contraiAresta grafo1 (1,2)
--LsAdj (fromList [(1,[4,3]),(2,[1,3])])
--contraiAresta grafo2 (1,2)
--LsAdj (fromList [(1,[3]),(3,[1])])
--contraiAresta grafo3 (1,3)
--LsAdj (fromList [(1,[4,2]),(3,[]),(4,[1,2])])

--éPasseio grafo5 [1,2]
--éPasseio grafo4 [1,2,3]
--éPasseio grafo3 [1,4,5]

--éPasseioAberto grafo5 [1,3,2,5]
--éPasseioAberto grafo2 [1,3,2,1]
--éPasseioAberto grafo3 [1,3,2]

--éPasseioFechado grafo5 [1,3,2,5]
--éPasseioFechado grafo3 [1,3,2]
--éPasseioFechado grafo2 [1,3,2,1]

--éTrilha grafo2 [1,2,3,1]
--éTrilha grafo3 [1,2,1]
--éTrilha grafo5 [1,2,4]

--éCaminho grafo2 [1,2,3,1]
--éCaminho grafo3 [1,2,1]
--éCaminho grafo5 [1,3,2]

--éCiclo grafo2 [1,2,3,1]
--éCiclo grafo5 [1,3,2]
--éCiclo grafo3 [1,2,1]

--éGrafoCíclico grafo3
--éGrafoCíclico grafo2
--éGrafoCíclico grafo1

--éCn grafo3 2
--éCn grafo2 3
--éCn grafo5 5

--éGrafoCaminho grafo3
--éGrafoCaminho semieuleriano
--éGrafoCaminho grafo4
 
--éPn semieuleriano 6
--éPn grafo3 4
--éPn grafo4 5

--éGrafoBipartido grafo5 [1,2] [3,4,5]
--éGrafoBipartido grafo2 [2,1] [3]
--éGrafoBipartido grafo6 [1,3] [2,4]

--éTrilhaEuleriana trilhaeuleriana [1,2,3,4,5,7,2,6,3,5,6,7,1]
--éTrilhaEuleriana grafo2 [1,2,3,1]
--éTrilhaEuleriana grafo3 [1,2,3,1]

--éGrafoEuleriano trilhaeuleriana
--éGrafoEuleriano grafo3
--éGrafoEuleriano grafo2

--éSemiEuleriano semieuleriano
--éSemiEuleriano trilhaeuleriana
--éSemiEuleriano grafo5

--éHamiltonianoOre halmitoniano
--éHamiltonianoOre grafo5
--éHamiltonianoOre grafo6

--éHamiltonianoDirac grafo1
--éHamiltonianoDirac halmitoniano
--éHamiltonianoDirac grafo5

--fecho g3
--LsAdj (fromList [(1,[4,3,2]),(3,[3,2,1]),(2,[4,3,1])])
--fecho g2
--LsAdj (fromList [(3,[2,1])])
--fecho halmitoniano
--LsAdj (fromList [(1,[5,4,2,3]),(2,[5,4,3,1]),(3,[5,4,2,1]),(4,[5,3,2,1]),(5,[4,3,2,1])])

--buscaGenérica grafo3
--buscaGenérica grafo4
--buscaGenérica grafo5

--buscaLargura grafo1
--buscaLargura grafo5
--buscaLargura halmitoniano

--buscaProfundidade grafo1
--buscaProfundidade grafo5
--buscaProfundidade semieuleriano
