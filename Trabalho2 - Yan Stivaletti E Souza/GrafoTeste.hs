import Grafo
import GrafoListAdj


grafo1 = novoGrafo 1 []
grafo2 = novoGrafo 3 [ (2,3),(1,2),(1,3)]
grafo3 = novoGrafo 3 []
grafo4 = novoGrafo 4 [(1,4), (2,3), (2,4), (1,3)]
grafo5 = novoGrafo 2 [(1,2)]



-- éTrivial grafo1
-- éTrivial grafo2
-- éTrivial grafo3


-- éIsolado grafo3 3
-- éIsolado grafo2 1
-- éIsolado grafo1 1

-- éTerminal grafo4 1
-- éTerminal grafo1 1
-- éTerminal grafo3 3

-- éPar grafo3 3
-- éPar grafo4 1
-- éPar grafo1 1


-- éImpar grafo3 3
-- éImpar grafo4 1
-- éImpar grafo1 1

-- seqGraus grafo3
-- seqGraus grafo4
-- seqGraus grafo2

-- grauMax grafo3
-- grauMax grafo4
-- grauMax grafo2

-- grauMin grafo3
-- grauMin grafo4
-- grauMin grafo2

-- éRegular grafo2
-- éRegular grafo3
-- éRegular grafo5



-- éKRegular grafo3 2
-- éKRegular grafo4 1
-- éKRegular grafo5 4

-- éVazio grafo2
-- éVazio grafo1
-- éVazio grafo5

-- éNulo grafo5
-- éNulo grafo1
-- éNulo grafo4

-- éCompleto grafo4
-- éCompleto grafo3
-- éCompleto grafo5

-- éKn grafo4 2
-- éKn grafo3 2
-- éKn grafo1 1

-- grafoCompleto 4
-- LsAdj (fromList [(1,[4,3,2]),(2,[4,3,1]),(3,[4,2,1]),(4,[3,2,1])])
-- grafoCompleto 6
-- LsAdj (fromList [(1,[6,5,4,3,2]),(2,[6,5,4,3,1]),(3,[6,5,4,2,1]),(4,[6,5,3,2,1]),(5,[6,4,3,2,1]),(6,[5,4,3,2,1])])
-- grafoCompleto 2
--LsAdj (fromList [(1,[2]),(2,[1])])

-- grafoComplemento grafo3
--LsAdj (fromList [(1,[]),(2,[]),(3,[])])
-- grafoComplemento grafo5
-- LsAdj (fromList [(1,[6,5,3,2]),(2,[6,5,1]),(3,[6,5,1]),(4,[]),(5,[3,2,1]),(6,[3,2,1])])
-- grafoComplemento grafo2
-- LsAdj (fromList [(1,[2]),(2,[1])])

-- éSubgrafo grafo4 grafo3
-- éSubgrafo grafo3 grafo3
-- éSubgrafo grafo3 grafo5

-- éSubgrafoPróprio grafo4 grafo3
-- éSubgrafoPróprio grafo3 grafo3
-- éSubgrafoPróprio grafo3 grafo5

-- éSubgrafoInduzidoVértices grafo4 grafo3 [1,2]
-- éSubgrafoInduzidoVértices grafo1 grafo3 [1,2]
-- éSubgrafoInduzidoVértices grafo3 grafo5 [1,2]

-- éSubgrafoInduzidoArestas grafo4 grafo5 [(1,2)]
-- éSubgrafoInduzidoArestas grafo4 grafo3 [(1,2)]
-- éSubgrafoInduzidoArestas grafo1 grafo3 [(1,2)]

-- éClique grafo4 grafo3
-- éClique grafo2 grafo3
-- éClique grafo3 grafo5

-- éCjIndependenteVértices grafo2 grafo3
-- éCjIndependenteVértices grafo2 grafo1
-- éCjIndependenteVértices grafo3 grafo5

-- união grafo4 grafo3
--LsAdj (fromList [(1,[3,2]),(2,[3,1]),(3,[1,2])])
-- união grafo4 grafo5
--LsAdj (fromList [(1,[4,2]),(2,[4,3,1]),(3,[2,4]),(4,[1,2,3,6,5]),(5,[4,6]),(6,[4,5])])
-- união grafo2 grafo3
-- LsAdj (fromList [(1,[3,2]),(2,[1,3]),(3,[1,2])])


-- interseção grafo2 grafo3
-- LsAdj (fromList [(1,[]),(2,[])])
-- interseção grafo4 grafo3
-- LsAdj (fromList [(1,[2]),(2,[1])])
-- interseção grafo4 grafo5
-- LsAdj (fromList [(1,[]),(2,[])])

-- soma grafo3 grafo5
-- LsAdj (fromList [(2,[3,6,5,1,4]),,(4,[1,2,3,6,5]),(1,[6,5,3,2,4]),(5,[3,2,1,4,6]),(3,[2,6,5,1,4]),(6,[3,2,1,4,5])])
-- soma grafo4 grafo3
-- LsAdj (fromList [(1,[2,3]),(2,[1,3]),(3,[1,2])])
-- soma grafo2 grafo3
-- LsAdj (fromList [(1,[3,2]),(2,[1,3]),(3,[1,2])])
