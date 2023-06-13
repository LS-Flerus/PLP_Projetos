# Nome do projeto: “Sozinho ou Pior”

# Sinopse:

“Você é alguém que cansou da rotina monótona da cidade grande, decidindo pegar sua van e pôr o pé na estrada em uma jornada de autodescoberta. Porém, numa cruel reviravolta do destino, seu veículo quebrou no meio do nada e a única esperança que lhe resta é encontrar peças para tentar consertá-lo. A luta pela sobrevivência em condições como essas já seria dura em circunstâncias normais, no entanto, tudo piora pelo fato de que algo sinistro se esgueira pelas redondezas e você não sabe ao certo o que, ou mesmo se é possível lidar com tal ameaça.”

# Suas necessidades:

“Sozinho ou Pior” é um jogo de sobrevivência no qual você controla uma pessoa perdida em um local desconhecido que precisa coletar recursos para sobreviver ao longo dos dias. Você possui 3 status que demarcam suas necessidades: 
“Vida”: representa sua saúde geral de forma genérica. Se ela chegar a zero em algum momento, você perde o jogo;
“Fome”: representa o quão bem está sendo seu regime alimentar. Caso esse status chegue a valores muito baixos, o jogador começará a perder vida;
“Sede”: representa sua necessidade de se hidratar. Caso esse status chegue a valores muito baixos, o jogador começará a perder vida;

Tais status podem ter seus valores aumentados ou diminuídos com o uso de certos itens ou em eventos específicos.

# Itens e exploração:

O jogo é dividido em dias que, por sua vez, são divididos em 3 períodos: manhã, tarde e anoitecer. No início de cada período você estará em seu acampamento de emergência e, em cada um desses períodos de tempo, o jogador pode escolher entre realizar certas ações (de forma não sequencial), sendo elas:
“Usar item” - utiliza um item que está sob sua posse para os mais diversos efeitos;
“Construir item” - combinar itens  para criar um novo item;
“Sair em coleta” - seleciona um local do mapa e realiza uma expedição focada na coleta de recursos. Ao fazer isso, o período do dia no qual você atualmente está se encerra.
“Sair em investigação” - uma expedição focada em obter informações do local. Também encerra o período do dia.

O mapa do jogo é dividido em diferentes áreas, sendo uma delas seu acampamento. Ao sair para uma expedição, você poderá levar consigo itens na sua mochila que podem ser úteis, influenciando nos itens coletados e nos eventos descobertos. Porém quanto mais itens forem levados, menor será a quantidade de itens que você conseguirá trazer de volta pro acampamento (sua mochila não tem espaço infinito). Sempre ao voltar pro acampamento, será impresso na tela um registro de diário escrito pelo personagem do jogador resumindo o que aconteceu na expedição.

# Condições de vitória e os perigos reais:

Para vencer o jogo você precisa reunir os itens necessários para consertar sua van e poder escapar. No entanto, sua missão será dificultada por 3 criaturas que habitam a área. Um dos focos do jogo é descobrir como as 3 criaturas se comportam(pois embora suas atitudes influenciam as ações de algumas delas, cada uma possui uma lógica pré definida persistente entre as partidas) para que elas possam ser evitadas e/ou mantidas sob controle. 

As criaturas são:

A Besta - uma criatura animalesca movida por instinto, cujos encontros com ela trarão bastante prejuízo para o status “vida”. Ela serviria como uma “mina terrestre” móvel. Caberá ao jogador descobrir seu padrão de movimento para evitar as localidades ocupadas por ela. Por exemplo, poderia obter a informação que, durante as manhãs, a criatura pode estar entre duas áreas específicas(ela se move todo toda vez que um periodo do dia acaba).

O Perseguidor - um humano misterioso vestido com roupas tribais. Não é tão forte fisicamente, mas é aquele que atrapalha o jogador com mais frequência, deixando coisas como armadilhas para dificultar a progressão do jogador. Ele atuará em áreas que o jogador já tenha visitado recentemente/frequentemente(ele se move todo toda vez que um periodo do dia acaba).

O Autômato - um robô programado para realizar uma missão específica. Não é diretamente nocivo, mas pode se tornar uma ameaça para os objetivos, devido ao fato de diminuir a quantidade de itens que é possível coletar nas áreas nas quais passou. O robô permanecerá um tempo no mesmo local (um dia ou mais) até partir para outro em uma sequência.

# Eventos:

São caixas de diálogo especiais que são desbloqueadas em certas condições. Cada evento se comporta de forma diferente: alguns podem afetar seus status de alguma forma, outros podem acabar te dando informações sobre as 3 criaturas e dicas sobre como prosseguir com seu objetivo, ou até mesmo lhe dar itens.

# Como jogar?

Funcional:

```Bash
$ ghc Main.hs
```

Logico:

```Bash
$ ghc swipl
1 ?- [sozinhoOuPior].
2 ?- main.
```
