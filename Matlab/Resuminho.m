clear all
close all
clc

A1 = 10;
A2 = 2;

w1 = 62832;
w2 = 12564;

#isolando frequencias
f_mt= 12564/2*pi;
f_ct= 62832/2*pi;

c_t = A1*cos(w1*t);

m_t = A2*cos(w2*t);

s_t = c_t .* m_t; 

# Para plotar o seno no tempo, necessario estabelecer um vetor de tempo com o 
# número de pontos que desejar, quanto mais , mais precisa sera a amostragem
t = [0: 0.1 :1];# aqui é a representação do tempo em segunda
# se quisesse ver em 1 hora por exemplo seria t = [1: 0.1:3600]

# Teorema de Nyquist para representar um sinal amostrado, teorema de que:
# freqência de amostragem deve ser ao menos 2* a da frequência base, ou frequencia máxima
# no caso de somas de senos e tal
# frequencia de amostragem = fs 
N = 20;
Fs = 2*f_mt;
#Tempo de amostragem, server para determinar qual o temopo de duração de cada 
# amostragem, é o passo de duração de tempo determinado então
Ts = 1/Fs;
tempo = [0:Ts:1]; # isso é apenas amostra, tempo é so uma forma de chamar
# outra observação, para determinar o tamanho do vetor tempo certinho é só fazer:
tempo_arrumado_emTamanho = [0:Ts:1-Ts];

## Beleza até agora ta certinho, porme, se plotar o grafica vai ter pouca amostra ainda,
#necessario criar um fator de superamostragem:
#N = 10;
# Então só ajustar p teorema de Nyquist com o novo fator de super amostragem:
# Fs = 2*f_mt*N; Fator de N é ajustavel e sempre inteiro maior que zero.
plot(t,m_t)
# Para controlar o número de eriodos da amostragem
n_periodo = 2;
xlim([0 n_periodos*(1/f_mt)])

# Na frequÊncia
# #-------- representacao na frequencia dos sinais -------
# cos(wt) = exp(jwt)/2 + exp(-jwt)/2
# TRansformada das exponenciais complexas são impulsos;

# transformada de fourier é complexa:
Sinal_na_freq = fft(m_t);
#COMO A FUNÃO É COMPLEXA USAR O MODULO NO PLOT
sinal_freq_modulo= (abs(Sinal_na_freq));
#Criar  jeito da freq:


# Assim como no tempo, aqui tem um periodo de espaçamento entre as amostras que 
# devemos respeitar, como la era eixo tempo, usava TS no passo da amostra,
# como aqui é frequÊncia, basta usar FS

## Importaantee!!!!

# O sinal possui uma amostra centrada em zero, com largura Fs, para visualizar ele certinho,
# ajustra entre -FS/2 até +Fs/2, por isso ele usa aquela paulada do fftshift()
Sinal_na_freq_desclocado = fftshift(sinal_freq_modulo);

























