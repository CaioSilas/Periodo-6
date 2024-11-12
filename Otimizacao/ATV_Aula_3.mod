set produtos:={1..4}; #conjunto de produtos
set mao := {1..2}; #conjunto de mao de obras
set maquinas :={1..3};#conjunto de maquinas disponiveis

param TM{mao}; #Tempo disponivel para cada mao de obra
param Tmaq{maquinas}; #Tempo disponivel para cada maquina
param lucro{produtos}; #lucro por unidade de produto
param pot_vendas{produtos};#preco por venda

param Matrix1{i in maquinas, j in produtos}; #matriz maquina por produto
param Matrix2{i in mao, j in produtos}; #matriz mao de obra por produto

var x{j in produtos}, >=0, integer; #variaveis de decisão



maximize receita : sum{j in produtos} x[j] * lucro[j];


Disp_Matrix1{i in maquinas}: sum{j in produtos} x[j] * Matrix1[i,j] <= Tmaq[i];
Disp_Matrix2{i in mao}: sum{j in produtos} x[j] * Matrix2[i,j] <= TM[i];
Disp_maxPrima{j in produtos} : x[j] <= pot_vendas[j];


solve;

data;
param TM :=
	1 120
	2 160;

param Tmaq :=
	1 80
	2 20
	3 40;
param lucro:=1 10 2 8 3 9 4 7;
param pot_vendas:=
	1 70
	2 60
	3 40
	4 20;

param Matrix1 : 
	1	2	3	4:=
1	5	4	8	9
2	2	6	0	8
3	3	4	6	2;

param Matrix2 :
1	2	3	4 :=
1	2	4	2	8
2	7	3	0	7;

end;
