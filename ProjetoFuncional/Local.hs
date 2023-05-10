import Itens

data StatusArmadilha = Nenhuma | Armando | Armada

data Sublocal = Sublocal {
                          requisitos :: [Item]
                        , itensQuandoSucesso :: [Item]
                        , stringFalha :: String
                        , stringSucesso :: String                        
                         }

data Local = Local {
                          nomeLocal :: String
                        , itensLocal :: [Item]
                        , aoChegarNoLocal :: [String]
                        , sublocais :: [Sublocal]
                        , statusArmadilha :: StatusArmadilha                    
                    }

retiraItens :: Local -> Local
retiraItens local = Local {            nomeLocal = nomeLocal local
                                     , itensLocal = []
                                     , aoChegarNoLocal = aoChegarNoLocal local
                                     , sublocais = sublocais local
                                     , statusArmadilha = statusArmadilha local
                          }