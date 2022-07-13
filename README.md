# Projeto Jogo 21
Criar um contrato de Ethereum que controla um jogo de 21:
<p>
  <b>Regras:</b><br>
- O usuário entra com o valor da aposta para iniciar um novo jogo <br>
- O usuário pode pedir quantas cartas quiser durante o jogo <br>
- Os valores das cartas vão de 0 a 10 e são gerados aleatoriamente. <br>
- O usuário só pode jogar um jogo de cada vez <br>
- O usuário pode finalizar o jogo a hora que quiser, e o valor de sua aposta é transferido de acordo com a seguinte conta. <br>
<br>
  <b>Pontuação:</b><br>
0 - 5 pontos => recebe de volta um quarto do valor investido <br>
5 - 10 pontos => recebe de metade do valor investido <br>
10 -15 pontos => recebe de volta o valor investido <br>
15 - 20 pontos => recebe de volta 150% do investimento <br>
21 pontos => recebe de volta o dobro do valor investido <br>
<br>
  <b>Aposta:</b><br>
Mínima - 100 wei <br>
Máxima - 0.001 ether <br>
<br>
  <b>Saldo Inicial do Contrato:</b><br>
10 ether
</p>
