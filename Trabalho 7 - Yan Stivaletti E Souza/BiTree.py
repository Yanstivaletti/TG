class Noh:

    def __init__(self, info):

        self.direita = None
        self.esquerda = None
        self.info = info

   

    def insere(self,info):  
        if self.info:
             if self.info == '*': #como o fechamento é um simbolo unario, alocamos o valor da direita com um termo vazio
                if self.esquerda is None:
                    self.esquerda = Noh(info) 
                    self.esquerda.direita = Noh('')
                else: 
                    self.esquerda.insere(info)
            if self.esquerda is None:
                self.esquerda = Noh(info)
                return
            if self.direita is None:
                self.direita = Noh(info)
                return
            else:
                self.esquerda.insere(info)
        else:
            self.info = info
    
    def PrintaArvore(self):
        if self.esquerda:
            self.esquerda.PrintaArvore()
        if self.direita:
            self.direita.PrintaArvore()
        print(self.info)

        
        
    
alfabeto = []
estados = []
estDeTransicao = []
estadoinicial = ['q0']
estadofinal = []
#if raiz.esquerda is not None and raiz.esquerda.esquerda is None:
#            estDeTransicao = ['','q0',raiz.info]

def ExpressionTree(raiz): #Onde sera criado o AFNE

    # arv vazia
    if raiz is None:
        return ''
  
    # nó folha
    if raiz.esquerda is None and raiz.right is None:
        return raiz.data

    esquerda = evaluateExpressionTree(raiz.esquerda)
  
 
    direita = evaluateExpressionTree(raiz.direita)
    
    
    if raiz.data not '+' and raiz.data not '*' and raiz.data not '.':
        if raiz.data not in alfabeto:
            alfabeto.append(raiz.data) #adicionamos os simbolos ao alfabeto
   
    if raiz.data == '+':
        estados.append(['qn'])          #cria-se um estado para alocar a uniao dos dois nós
        estDeTransicao.append(['',esquerda,'qn']) #transição de esquerda para o estado novo
        estDeTransicao.append(['','qn',direita]) #transição do estado novo para a direita
       
      
    elif raiz.data == '.':
        
        estDeTransicao.append(['',esquerda,direita]) #a concatenção se resume em um estado de transição
                                                     #da esquerda para a direita
      
    elif raiz.data == '*':
        estDeTransicao.append(['',esquerda,esquerda]) #o fechamento nada mais é que a repetição infinita dos itens da esquerda
        
       
      
    #else:
def criaArvoreDaExpressão(expressao): #Função que transforma a expressão em uma arvore

    arvore = Noh(expressao[0])
    expressao.pop(0)
    for i in expressao:
        arvore.insere(expressao[i])
    
    return arvore



#arvore teste
root = Noh('*')
root.insere('2')
root.insere('+')
root.insere('5')
root.insere('1')
root.PrintaArvore()