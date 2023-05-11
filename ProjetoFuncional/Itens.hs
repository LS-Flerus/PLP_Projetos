module Itens where

data TipoItem = Ferramenta | Consumivel | Material deriving (Show, Read, Eq)
data Item = Item {nome :: String, tipoItem :: TipoItem} deriving (Show, Read, Eq)

-- Item List Consumiveis
agua = Item {nome = "Agua", tipoItem = Consumivel}
comida = Item {nome = "Comida", tipoItem = Consumivel}
kitMedico = Item {nome = "Kit Medico", tipoItem = Consumivel}
estepe = Item {nome = "Step", tipoItem = Consumivel}
combustivel = Item {nome = "Combustivel", tipoItem = Consumivel}
bateriaCarro = Item {nome = "Bateria de Carro", tipoItem = Consumivel}
rebimbocaDaParafuseta = Item {nome = "Rebimboca da Parafuseta", tipoItem = Consumivel}
carvão = Item {nome = "Carvão", tipoItem = Consumivel}


-- Item List Materiais

madeira = Item {nome = "Madeira", tipoItem = Material}
pedra = Item {nome = "Pedra", tipoItem = Material}
linha = Item {nome = "Linha", tipoItem = Material}

-- Item List Ferramenta

faca = Item {nome = "Faca de Combate", tipoItem = Ferramenta}
lanterna = Item {nome = "Lanterna", tipoItem = Ferramenta}
varaPesca = Item {nome = "Vara de Pesca", tipoItem = Ferramenta}
corda = Item {nome = "Corda", tipoItem = Ferramenta}
isqueiro = Item {nome = "Isqueiro", tipoItem = Ferramenta}
radar = Item {nome = "Radar", tipoItem = Ferramenta}
picareta = Item {nome = "Picareta", tipoItem = Ferramenta}
machado = Item {nome = "Machado", tipoItem = Ferramenta}
chapeuOperario = Item {nome = "Chapeu de Operario", tipoItem = Ferramenta}
luvas = Item {nome = "Luvas", tipoItem = Ferramenta}
bolsa = Item {nome = "Bolsa", tipoItem = Ferramenta}
garrafa = Item {nome = "Garrafa", tipoItem = Ferramenta}


counterBesta = Item {nome = "Counter Besta", tipoItem = Ferramenta}
counterArmadilha = Item {nome = "Counter Armadilha", tipoItem = Ferramenta}
counterRobo = Item {nome = "Counter Robo", tipoItem = Ferramenta}

-- Item Erro
erro = Item {nome = "Valor Invalido", tipoItem = Ferramenta}