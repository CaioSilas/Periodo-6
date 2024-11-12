# Defini��o dos conjuntos
set E := 1..10;  # Conjunto de Funcion�rios
set A := 1..4;  # Conjunto de Setores
set S := 1..3;  # Conjunto de Turnos
set W := 1..2; # Conjunto de Semanas


# Par�metros


# N�mero m�ximo de horas de trabalho semanal por turno em cada setor
param lambda{s in S,a in A};
# N�mero m�nimo de horas de trabalho semanal por turno em casa setor
param tau{s in S,a in A};
param hemax{E} default 30.00; #N�mero de horas contratadas
param cea{E, A} default 1;  # Par�metro bin�rio indicando se o funcion�rio pode ou n�o trabalhar em um setor


# Vari�veis de decis�o
var xsewa{E, A, S, W} binary;  # Vari�vel bin�ria de escalonamento
var ysewa{E, A, S, W} >= 0.00;   # Vari�vel de horas trabalhadas
var delta_plus{E, W} >= 0.00;    # Excesso de horas trabalhadas
var delta_minus{E, W} >= 0.00;   # Sobra de horas trabalhadas


# Fun��o objetivo
minimize objective:
		sum{e in E, w in W} (delta_plus[e,w] - delta_minus[e,w]);

# Definindo delta_plus e delta_minus
subject to define_delta_plus{e in E, w in W}:
    delta_plus[e, w] = sum{a in A, s in S} ysewa[e, a, s, w] - hemax[e];

subject to define_delta_minus{e in E, w in W}:
    delta_minus[e, w] = hemax[e] - sum{a in A, s in S} ysewa[e, a, s, w];


# Restri��es adicionadas

# Um funcion�rio deve ser atribu�do a apenas um turno e um setor na semana.
subject to selecao_horario_R4{e in E, w in W}:
    sum{a in A, s in {1,2}} xsewa[e, a, s, w] = 1;

subject to restricao_5 {a in A, s in {1,2}}:
    sum{e in {1,2}} xsewa[e, a, s, 1] = sum{e in {1,2}} xsewa[e, a, s, 2];

subject to restricao_6 {e in E, s in {1,2}}:
    sum{a in A, w in W} xsewa[e, a, s, w] = 1;

subject to restricao_7 {e in E}:
    xsewa[e, 1, 3, 1] <= xsewa[e, 1, 1, 1];

subject to restricao_8 {e in E, w in W, a in {2, 3, 4}}:
    xsewa[e, a, 3, w] = 0;

# Adicionando restri��o para garantir que ysewa seja menor do que o m�ximo de horas permitido por funcion�rio (xsewa = 1)
subject to restricao_9 {e in E, w in W, a in A, s in S}:
    ysewa[e, a, s, w] <= lambda[s, a] * xsewa[e, a, s, w];

subject to restricao_10 {w in W, a in A, s in S}:
    sum{e in E} ysewa[e, a, s, w] >= tau[s, a];

subject to restricao_11 {e in E, w in W}:
    sum{a in A, s in S} ysewa[e, a, s, w] + delta_minus[e, w] - delta_plus[e, w] = hemax[e];

# Garantindo a compatibilidade de designar um funcion�rio para trabalhar em um setor
subject to restricao_12 {w in W, e in E, a in A, s in S}:
    xsewa[e, a, s, w] <= cea[e, a];
# Resolva o modelo
solve;

# Imprima o valor da fun��o objetivo
printf "\nValor da Fun��o Objetivo: %.2f\n", objective;

# Exibir valores das vari�veis de decis�o xsewa, ysewa, delta_plus, delta_minus
printf "\nValores das vari�veis de decis�o xsewa:\n";
for {e in E, a in A, s in S, w in W} {
    printf "xsewa[%d, %d, %d, %d] = %.2f\n", e, a, s, w, xsewa[e, a, s, w];
}

printf "\nValores das vari�veis de decis�o ysewa:\n";
for {e in E, a in A, s in S, w in W} {
    printf "ysewa[%d, %d, %d, %d] = %.2f\n", e, a, s, w, ysewa[e, a, s, w];
}

# Imprimir o n�mero de funcion�rios em cada setor e turno
printf "\nN�mero de Funcion�rios em Cada Setor e Turno:\n";
for {a in A, s in S, w in W} {
    printf "Setor %d, Turno %d, Semana %d: %d funcion�rios\n", a, s, w, sum{e in E} xsewa[e, a, s, w];
}

# Imprimir o n�mero de horas trabalhadas em cada setor e turno
printf "\nN�mero de Horas Trabalhadas em Cada Setor e Turno:\n";
for {a in A, s in S, w in W} {
    printf "Setor %d, Turno %d, Semana %d: %.2f horas\n", a, s, w, sum{e in E} ysewa[e, a, s, w];
}


end;
