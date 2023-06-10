% CamboinhaDoNorte  
% { dia :: Int, momentoDia :: MomentoDia, vidaCarro :: Int, locaisArmadilha :: [StatusArmadilha], areas :: [Local]}
% data StatusArmadilha = Nenhuma | Armando | Armada

nextMomentoDia("MANHA", "TARDE").
nextMomentoDia("TARDE", "NOITE").
nextMomentoDia("NOITE", "MANHA").

