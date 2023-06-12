% BESTA IMPL

encontroBesta(Dia, MomentoDia, IdLocal) :- (Dia mod 3) =:= 0, MomentoDia = "MANHA", IdLocal =:= 2.
encontroBesta(Dia, MomentoDia, IdLocal) :- (Dia mod 2) =:= 0, MomentoDia = "MANHA", IdLocal =:= 3.
encontroBesta(Dia, MomentoDia, IdLocal) :- (Dia mod 1) =:= 0, MomentoDia = "MANHA", IdLocal =:= 4.
encontroBesta(Dia, MomentoDia, IdLocal) :- (Dia mod 3) =:= 0, MomentoDia = "TARDE", IdLocal =:= 4.
encontroBesta(Dia, MomentoDia, IdLocal) :- (Dia mod 3) =:= 0, MomentoDia = "TARDE", IdLocal =:= 3.
encontroBesta(_, MomentoDia, IdLocal) :- MomentoDia = "NOITE", IdLocal =:= 2.

ataqueBesta(Vida, Vida2) :- writeln("Voce foi atacado pela Besta\n"), Vida2 is Vida - 25.

% PERSEGUIDOR IMPL

encontroArmadilha(Armadilhas, IdLocal) :- I is IdLocal - 1, nth0(I, Armadilhas, "ARMADA").

cairArmadilha(Vida, Vida2, ["NENHUMA", "NENHUMA", "NENHUMA", "NENHUMA", "NENHUMA"]) :- writeln("Voce caiu numa armadilha\n"), Vida2 is Vida - 25.

encontroPerseguidor(Armadilhas, IdLocal) :- I is IdLocal - 1, nth0(I, Armadilhas, "ARMANDO").

espantarPerseguidor(["NENHUMA", "NENHUMA", "NENHUMA", "NENHUMA", "NENHUMA"]) :- writeln("Seu Perseguidor estava colocando armadilhas\nVoce o espantou\n").

atualizarArmadilha(Armadilhas, _, Armadilhas2) :- member("ARMADA", Armadilhas), Armadilhas2 = Armadilhas, !.
atualizarArmadilha(Armadilhas, _, Armadilhas2) :- member("ARMANDO", Armadilhas), armarArmadilha(Armadilhas, Armadilhas2), !.
atualizarArmadilha(Armadilhas, IdLocal, Armadilhas2) :- armandoArmadilha(IdLocal, Armadilhas, Armadilhas2).

armandoArmadilha(1, [_|C], ["ARMANDO"|C]):- !.
armandoArmadilha(I, [Y|C], [Y|D]) :- I2 is I - 1, armandoArmadilha(I2, C, D).

armarArmadilha(["ARMANDO"|C], ["ARMADA"|C]):- !.
armarArmadilha([Y|C], [Y|D]) :- armarArmadilha(C, D).

% ROBO IMPL

encontroRoboBaseMilitar(Dia, MomentoDia, IdLocal) :- (Dia mod 2) =:= 0, MomentoDia = "MANHA", IdLocal =:= 1.
encontroRoboBaseMilitar(Dia, MomentoDia, IdLocal) :- (Dia mod 2) =:= 0, MomentoDia = "TARDE", IdLocal =:= 1.

ataqueRoboBaseMilitar(Vida, Vida2) :- writeln("Voce foi atacado pelo Robo\n"), Vida2 is Vida - 25.

roboBarulhos(Dia) :- member(Dia, [3, 5, 7, 9, 11, 13]) -> writeln("Escuta-se ao longe barulhos de engrenagem"); write("").
        

/*roboDestruirLocal :: Int -> Status -> Status
roboDestruirLocal dia status
  | dia == 5 = (personagem, roboAfetarArea 4 mundo)
  | dia == 9 = (personagem, roboAfetarArea 3 mundo)
  | dia == 13 = (personagem, roboAfetarArea 2 mundo)
  | otherwise = status
  where mundo = snd status
        personagem = fst status */

