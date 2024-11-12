from scipy.stats import norm
import scipy.stats as stats
import numpy as np
import math

# ----------------------------------------------------------------------------------------
# 1
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Uma determinada fábrica deseja adquirir uma máquina nova para aumentar sua produção.
# No entanto, antes de efetuar a compra, exigiu que o revendedor enviasse uma amostra de 11 unidades do produto confeccionados pela máquina. 
#O controle de qualidade da fábrica avaliou a amostra recebida e concluiu que a média do comprimento dos produtos da amostra era 
#igual a 17,21 polegadas. Sabe-se também que o comprimento dos produtos possui distribuição normal e o desvio padrão populacional é conhecido e 
#igual a 3,11 polegadas. A pedido a gerência, a área de controle de qualidade construiu um intervalo de 95% de confiança para o verdadeiro valor da média (μ ). Informe os limites desse intervalo
media_amostra = 15.62
desvio_padrao_populacional = 2.14
tamanho_amostra = 10
nivel_confianca = 0.95

# # Trainamento 2
# # Uma determinada fábrica deseja adquirir uma máquina nova para aumentar sua produção. No entanto, antes de efetuar a compra, exigiu que o revendedor enviasse uma amostra de 10 unidades do produto confeccionados pela máquina. O controle de qualidade da fábrica avaliou a amostra recebida e concluiu que a média do comprimento dos produtos da amostra era igual a 18,19 polegadas. Sabe-se também que o comprimento dos produtos possui distribuição normal e o desvio padrão populacional é conhecido e igual a 3,16 polegadas. A pedido a gerência, a área de controle de qualidade construiu um intervalo de 95% de confiança para o verdadeiro valor da média (μ ). Informe os limites desse intervalo.
# media_amostra = 18.19
# desvio_padrao_populacional = 3.16
# tamanho_amostra = 10
# nivel_confianca = 0.95

# # Prova
# # Uma determinada fábrica deseja adquirir uma máquina nova para aumentar sua produção. No entanto, antes de efetuar a compra, exigiu que o revendedor enviasse uma amostra de 11 unidades do produto confeccionados pela máquina. O controle de qualidade da fábrica avaliou a amostra recebida e concluiu que a média do comprimento dos produtos da amostra era igual a 17,21 polegadas. Sabe-se também que o comprimento dos produtos possui distribuição normal e o desvio padrão populacional é conhecido e igual a 3,11 polegadas. A pedido a gerência, a área de controle de qualidade construiu um intervalo de 95% de confiança para o verdadeiro valor da média (μ ). Informe os limites desse intervalo
# media_amostra = 22.84
# desvio_padrao_populacional = 2.58
# tamanho_amostra = 11
# nivel_confianca = 0.95

# ---- CODIGO ----

def calcular_intervalo_confianca(media_amostra, desvio_padrao_populacional, tamanho_amostra, nivel_confianca):
    z_valor = norm.ppf((1 + nivel_confianca) / 2)
    erro_padrao_media = desvio_padrao_populacional / math.sqrt(tamanho_amostra)
    limite_inferior = media_amostra - z_valor * erro_padrao_media
    limite_superior = media_amostra + z_valor * erro_padrao_media
    return limite_inferior, limite_superior


limite_inferior, limite_superior = calcular_intervalo_confianca(media_amostra, desvio_padrao_populacional, tamanho_amostra, nivel_confianca)

print("Q1")
print(f"Inferior: {limite_inferior} | Superior: {limite_superior}")
print()

# ----------------------------------------------------------------------------------------
# 2
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Uma revenda de automóveis vende carros montados no Brasil. O proprietário está interessado em estimar o valor médio μ dos gastos extras com opcionais casados com a compra de carros novos. Uma amostra de 10 vendas produziu um valor médio de R$1065 e desvio padrão de R$149 . Considere que os gastos extras seguem uma distribuição normal. Assinale a opção que informa os limites do intervalo de confiança de 90% para μ .
n = 23
x_bar = 1061
s = 165
confidence_level = 0.95

# # Trainamento 2
# # Uma revenda de automóveis vende carros montados no Brasil. O proprietário está interessado em estimar o valor médio μ dos gastos extras com opcionais casados com a compra de carros novos. Uma amostra de 25 vendas produziu um valor médio de R$1050 e desvio padrão de R$164 . Considere que os gastos extras seguem uma distribuição normal. Assinale a opção que informa os limites do intervalo de confiança de 90% para μ .
# n = 25
# x_bar = 1050
# s = 164
# confidence_level = 0.90

# # Prova
# # Uma revenda de automóveis vende carros montados no Brasil. O proprietário está interessado em estimar o valor médio μ dos gastos extras com opcionais casados com a compra de carros novos. Uma amostra de 10 vendas produziu um valor médio de R$1065 e desvio padrão de R$149 . Considere que os gastos extras seguem uma distribuição normal. Assinale a opção que informa os limites do intervalo de confiança de 90% para μ .
# n = 22
# x_bar = 1049
# s = 154
# confidence_level = 0.95

# ---- CODIGO ----

degrees_of_freedom = n - 1
t_value = stats.t.ppf((1 + confidence_level) / 2, degrees_of_freedom)
epsilon = t_value * s / math.sqrt(n)

lower_limit = x_bar - epsilon
upper_limit = x_bar + epsilon

print("Q2")
print(f"Inferior: {lower_limit} | Superior: {upper_limit}")

print()

# ----------------------------------------------------------------------------------------
# 3
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Uma revenda de automóveis vende carros montados no Brasil. O proprietário está interessado em estimar o valor médio μ dos gastos extras com opcionais casados com a compra de carros novos. Uma amostra de 10 vendas produziu um valor médio de R$1065 e desvio padrão de R$149 . Considere que os gastos extras seguem uma distribuição normal. Assinale a opção que informa os limites do intervalo de confiança de 90% para μ .
# R = Não rejeitar a hipótese nula quando ela é, na realidade, falsa, é a definição do erro tipo II. Podemos ver a tabela de decisões abaixo: rejeitar uma hipótese alternativa verdadeira

# Trainamento 2
# Uma revenda de automóveis vende carros montados no Brasil. O proprietário está interessado em estimar o valor médio μ dos gastos extras com opcionais casados com a compra de carros novos. Uma amostra de 10 vendas produziu um valor médio de R$1065 e desvio padrão de R$149 . Considere que os gastos extras seguem uma distribuição normal. Assinale a opção que informa os limites do intervalo de confiança de 90% para μ .
# R = não rejeitar uma hipótese nula falsa.

# Prova
# Uma revenda de automóveis vende carros montados no Brasil. O proprietário está interessado em estimar o valor médio μ dos gastos extras com opcionais casados com a compra de carros novos. Uma amostra de 10 vendas produziu um valor médio de R$1065 e desvio padrão de R$149 . Considere que os gastos extras seguem uma distribuição normal. Assinale a opção que informa os limites do intervalo de confiança de 90% para μ .
# R = não rejeitar uma hipótese nula falsa.

# ---- CODIGO ----

# Decisão	        Verdadeiro	  Falso
# Não rejeitar      Correta	      Erro tipo II
# Rejeitar          Erro tipo I	  Correta

# ----------------------------------------------------------------------------------------
# 4
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Na realização de testes de hipóteses, é possível que se cometam erros de conclusão. O erro de conclusão conhecido como erro tipo I consiste em
# R = Rejeitar a hipótese nula quando ela é, na realidade, verdadeira, é a definição do erro tipo I. Podemos ver a tabela de decisões abaixo. Rejeitar uma hipótese nula verdadeira.
    
# Trainamento 2
# Na realização de testes de hipóteses, é possível que se cometam erros de conclusão. O erro de conclusão conhecido como erro tipo I consiste em
# R = Rejeitar uma hipótese nula verdadeira

# Prova
# Na realização de testes de hipóteses, é possível que se cometam erros de conclusão. O erro de conclusão conhecido como erro tipo I consiste em
# R = Rejeitar uma hipótese nula verdadeira

# ---- CODIGO ----

# Decisão	        Verdadeiro	  Falso
# Não rejeitar      Correta	      Erro tipo II
# Rejeitar          Erro tipo I	  Correta

# ----------------------------------------------------------------------------------------
# 5
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Um teste de hipótese apresentou p-valor igual a 0,3. Portanto, nos níveis de significância (α) de 1% e 5%, respectivamente, a Hipótese nula
# R = 0.3 > 0.01 = Não rejeita | 0.3 > 0.05 = Não rejeita

# Trainamento 2
# Um teste de hipótese apresentou p-valor igual a 0,21. Portanto, nos níveis de significância (α) de 1% e 10%, respectivamente, a Hipótese nula:
# R = 0.21 > 0.01 = Não rejeita | 0.21 > 0.1 = Não rejeita

# Prova
# Um teste de hipótese apresentou p-valor igual a 0,04. Portanto, nos níveis de significância (α) de 5% e 20%, respectivamente, a Hipótese nula
# R = 0.04 < 0.05 = rejeita | 0.04 < 0.2 = Não rejeita

# ---- CODIGO ----

# Se o p-valor for maior que o nível de significância, não rejeita-se a hipótese nula
# Se o p-valor for menor que o nível de significância, rejeita-se a hipótese nula

# ----------------------------------------------------------------------------------------
# 6
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Um pesquisador avaliou se a pressão sanguínea dos candidatos do último concurso para o Tribunal de Contas se alterava no início da prova. Em condições normais, sem stress, os candidatos entre 18 e 32 anos apresentaram uma pressão sistólica média de 120 mm Hg. Após medir a pressão de 16 candidatos a cinco minutos do início da prova, foi encontrada a pressão sistólica média de 122,9 mm Hg com desvio padrão amostral de 10,3 mm Hg. Considere que a pressão sistólica segue uma distribuição normal. Deve-se testar: H0: μ = 120 versus H1: μ > 120 . Utilizando o teste T para testar essas hipóteses, informe o valor da estatística de teste (tobs):
media_hipotese_nula = 120
media_amostral = 120.1
desvio_padrao_amostral = 11.2
tamanho_amostra = 17

# # Trainamento 2
# # Um pesquisador avaliou se a pressão sanguínea dos candidatos do último concurso para o Tribunal de Contas se alterava no início da prova. Em condições normais, sem stress, os candidatos entre 18 e 32 anos apresentaram uma pressão sistólica média de 120 mm Hg. Após medir a pressão de 16 candidatos a cinco minutos do início da prova, foi encontrada a pressão sistólica média de 128,8 mm Hg com desvio padrão amostral de 12,8 mm Hg. Considere que a pressão sistólica segue uma distribuição normal. Deve-se testar:
# media_hipotese_nula = 120
# media_amostral = 128.8
# desvio_padrao_amostral = 12.8
# tamanho_amostra = 16

# # Prova
# # Um pesquisador avaliou se a pressão sanguínea dos candidatos do último concurso para o Tribunal de Contas se alterava no início da prova. Em condições normais, sem stress, os candidatos entre 18 e 32 anos apresentaram uma pressão sistólica média de 120 mm Hg. Após medir a pressão de 16 candidatos a cinco minutos do início da prova, foi encontrada a pressão sistólica média de 122,9 mm Hg com desvio padrão amostral de 10,3 mm Hg. Considere que a pressão sistólica segue uma distribuição normal. Deve-se testar: H0: μ = 120 versus H1: μ > 120 . Utilizando o teste T para testar essas hipóteses, informe o valor da estatística de teste (tobs):
# media_hipotese_nula = 120
# media_amostral = 120.4
# desvio_padrao_amostral = 10
# tamanho_amostra = 14

# ---- CODIGO ----

tobs = (media_amostral - media_hipotese_nula) / (desvio_padrao_amostral / (tamanho_amostra ** 0.5))
print("Q6")
print("Estatística de teste (tobs):", tobs)
print()

# ----------------------------------------------------------------------------------------
# 7
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Um fabricante de suco concentrado informa que para cada 200 ml do produto, há 23 g de açúcares. Para obter o registro que autorizaria sua comercialização, 
#27 amostras oriundas de lotes diversos foram analisadas por um órgão de vigilância sanitária e obteve-se,
# em média, 25 g de açúcares, com erro padrão de 2,9 g (sn−−√) . 
#Considere que a quantidade de açúcares presente no suco segue uma distribuição normal. 
#Ao nível de 1% de significância, indique a região de maior amplitude que levaria à rejeição da especificação informada pelo fabricante
media_especificada = 20
media_amostral = 24
erro_padrao = 1.2
n_amostras = 24
nivel_significancia = 0.01

# # Trainamento 2
# # Um fabricante de suco concentrado informa que para cada 200 ml do produto, há 20 g de açúcares. Para obter o registro que autorizaria sua comercialização, 24 amostras oriundas de lotes diversos foram analisadas por um órgão de vigilância sanitária e obteve-se, em média, 24 g de açúcares, com erro padrão de 1,2 g (sn−−√) . Considere que a quantidade de açúcares presente no suco segue uma distribuição normal. Ao nível de 1% de significância, indique a região de maior amplitude que levaria à rejeição da especificação informada pelo fabricante.
# media_especificada = 20
# media_amostral = 24
# erro_padrao = 1.2
# n_amostras = 24
# nivel_significancia = 0.01

# # Prova
# # Um fabricante de suco concentrado informa que para cada 200 ml do produto, há 23 g de açúcares. Para obter o registro que autorizaria sua comercialização, 27 amostras oriundas de lotes diversos foram analisadas por um órgão de vigilância sanitária e obteve-se, em média, 25 g de açúcares, com erro padrão de 2,9 g (sn−−√) . Considere que a quantidade de açúcares presente no suco segue uma distribuição normal. Ao nível de 1% de significância, indique a região de maior amplitude que levaria à rejeição da especificação informada pelo fabricante
# media_especificada = 25
# media_amostral = 29
# erro_padrao = 1.2
# n_amostras = 24
# nivel_significancia = 0.01

# ---- CODIGO ----

graus_liberdade = n_amostras - 1
valor_critico = stats.t.ppf(1 - nivel_significancia / 2, graus_liberdade)
extremidade_inferior = media_especificada - valor_critico * erro_padrao
extremidade_superior = media_especificada + valor_critico * erro_padrao

print("Q7")
print(f"Região de rejeição: X¯ < {extremidade_inferior} ou X¯ > {extremidade_superior}")
print()

# ----------------------------------------------------------------------------------------
# 8
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Em certo banco de dados, o tempo para realização das buscas é aproximadamente normal, com média de 60 s e desvio padrão de 15 s. 
#Depois de realizadas algumas modificações no sistema, observou-se que, em 28 consultas, o tempo médio caiu para 46 s. Há evidência de melhoria?
# Admita que as 28 observações possam ser consideradas uma amostra aleatória e que não houve alteração na variância. 
#Use o nível de significância de 0,1.
# R = Assim, utilizando a tabela da distribuição normal padrão, obtemos zα=z0,1=−1,28 . 
#Então rejeitamos H0 , pois no teste unilateral à esquerda se rejeita H0 caso zobs<zα . Ou seja, há evidência de melhoria.
media_amostral = 51.3
desvio_padrao = 10
nivel_significancia = 0.1
n = 23
media_hipotese_nula = 58

# # Trainamento 2
# # Em certo banco de dados, o tempo para realização das buscas é aproximadamente normal, com média de 54 s e desvio padrão de 13 s. Depois de realizadas algumas modificações no sistema, observou-se que, em 25 consultas, o tempo médio caiu para 52 s. Há evidência de melhoria? Admita que as 25 observações possam ser consideradas uma amostra aleatória e que não houve alteração na variância. Use o nível de significância de 0,01.
# # R = 
# media_amostral = 56
# desvio_padrao = 12
# nivel_significancia = 0.1
# n = 28
# media_hipotese_nula = 42.3

# Prova
# Em certo banco de dados, o tempo para realização das buscas é aproximadamente normal, com média de 60 s e desvio padrão de 15 s. Depois de realizadas algumas modificações no sistema, observou-se que, em 28 consultas, o tempo médio caiu para 46 s. Há evidência de melhoria? Admita que as 28 observações possam ser consideradas uma amostra aleatória e que não houve alteração na variância. Use o nível de significância de 0,1.
# R = 

# ---- CODIGO ----

z_obs = (media_amostral - media_hipotese_nula) / (desvio_padrao / (n ** 0.5))
z_critico = norm.ppf(nivel_significancia)
if z_obs < z_critico:
    resultado = "Sim, há evidência de melhoria; rejeitamos H0."
else:
    resultado = "Não, não há evidência de melhoria; não se rejeita H0."

print("Q8")
print(f"z_obs = {z_obs}")
print(f"z_critico = {z_critico}")
print(resultado)
print()

# ----------------------------------------------------------------------------------------
# 9
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Uma linha de produção apresenta 10% de itens defeituosos. Após a aquisição de novas máquinas,
# visando a redução dos erros de fabricação, uma amostra de 200 peças revelou que 12 eram defeituosas.
# Considere que a amostra é suficientemente grande para se utilizar o Teorema Central do Limite. 
#Por meio de um teste unilateral de proporções, com nível de significância de 2,5%, chega-se à seguinte conclusão:
# R = O teste é unilateral à esquerda e α=0,025 , logo rejeitamos H0 se zobs∈Rcz={Z<zα} . Temos que zα=z0,025=−1,96 . Como zobs=−1,89 > -1,96, não rejeitamos H0 . Portanto, podemos concluir que não houve evidências de melhoria na qualidade das peças produzidas com a aquisição das novas máquinas. Assumir H1 , significaria dizer que a proporção de itens defeituosos é significativamente menor que 0,1.
p_obs = 45 / 300
p0 = 0.2
n = 300
alpha = 0.025

# # Trainamento 2
# # Uma linha de produção apresenta 10% de itens defeituosos. Após a aquisição de novas máquinas, visando a redução dos erros de fabricação, uma amostra de 200 peças revelou que 12 eram defeituosas. Considere que a amostra é suficientemente grande para se utilizar o Teorema Central do Limite. Por meio de um teste unilateral de proporções, com nível de significância de 2,5%, chega-se à seguinte conclusão:
# # R = 
# p_obs = 9 / 100
# p0 = 0.12
# n = 100
# alpha = 0.025

# # Prova
# # Uma linha de produção apresenta 10% de itens defeituosos. Após a aquisição de novas máquinas, visando a redução dos erros de fabricação, uma amostra de 200 peças revelou que 12 eram defeituosas. Considere que a amostra é suficientemente grande para se utilizar o Teorema Central do Limite. Por meio de um teste unilateral de proporções, com nível de significância de 2,5%, chega-se à seguinte conclusão:
# # R = 
# p_obs = 34 / 200
# p0 = 0.18
# n = 100
# alpha = 0.05

# ---- CODIGO ----

z_obs = (p_obs - p0) / np.sqrt(p0 * (1 - p0) / n)
z_critical = norm.ppf(alpha)
if z_obs < z_critical:
    resultado = "Não rejeitamos H0"
else:
    resultado = "Rejeitamos H0"

print("Q9")
print(f"Estatística do teste z: {z_obs}")
print(f"Valor crítico: {z_critical}")
print("Resultado do teste:", resultado)
print()


# ----------------------------------------------------------------------------------------
# 10
# ----------------------------------------------------------------------------------------

# Trainamento 1
# Seja p a proporção de torcedores de um certo time de futebol numa população muito grande. Deseja-se testar H0:p=0,1 versus H1:p>0,1 . 
#Com base numa amostra aleatória simples de tamanho 100, o número de torcedores do time observados foi igual a 19. 
#Considere que a amostra coletada é suficientemente grande para se utilizar o Teorema Central do Limite. O p-valor desse teste é:
p0 = 0.1
p_obs = 33 / 300
n = 300

# # Trainamento 2
# # Seja p a proporção de torcedores de um certo time de futebol numa população muito grande. Deseja-se testar H0:p=0,1 versus H1:p>0,1 . Com base numa amostra aleatória simples de tamanho 400, o número de torcedores do time observados foi igual a 48. Considere que a amostra coletada é suficientemente grande para se utilizar o Teorema Central do Limite. O p-valor desse teste é:
# p0 = 0.1
# p_obs = 48 / 400
# n = 400

# # Prova
# # Seja p a proporção de torcedores de um certo time de futebol numa população muito grande. Deseja-se testar H0:p=0,1 versus H1:p>0,1 . Com base numa amostra aleatória simples de tamanho 100, o número de torcedores do time observados foi igual a 19. Considere que a amostra coletada é suficientemente grande para se utilizar o Teorema Central do Limite. O p-valor desse teste é:
# p0 = 0.1
# p_obs = 24 / 100
# n = 100

# ---- CODIGO ----

z_obs = (p_obs - p0) / ((p0 * (1 - p0) / n)**0.5)
p_valor = 1 - stats.norm.cdf(z_obs)

print("Q10")
print(f"z_obs: {z_obs}")
print(f'p-valor: {p_valor}')
print()
