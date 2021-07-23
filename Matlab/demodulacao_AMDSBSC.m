clear all
close all
clc

#Aluno: André Luiz Faraco Mazucheli

Am1 = 1;
Am2 = 0.5;
Am3 = 1.5;
Ac = 1;


fm1 = 100; # frequencia do sinal de entrada
fm2 = 300;
fm3 = 10;

fc = 10e3; # frequencia da portadora


wm1 = 2*pi*fm1;
wm2 = 2*pi*fm2;
wm3 = 2*pi*fm3;

wc = 2*pi*fc;

n_periodo = 2; # numero de periodos para a visualizacao
N = 10; # fator de superamostragem (N deve ser inteiro e maior que zero)
Fs = 2*fc*N; # frequencia de amostragem deve respeitar o teorema de Nyquist
Ts = 1/Fs; # Tempo de amostragem
t = [0:Ts:1]; # representando o tempo em segundos



m_t = Am1*cos(wm1*t) + Am2*cos(wm2*t) + Am3*cos(wm3*t); # sinal de entrada
c_t = Ac*cos(wc*t); # portadora


# Modulacao
s = m_t .* c_t; # sinal transmitido


# Demodulacao

# Basta multiplicar o sinal modulado pela portadora novamente 
# para aparecer o sinal original, porém neste processo temos 
# réplicas do sinal em 2F_c e -2f_c

m_t_demod = s .* c_t;

# Implementar um filtro passa-baixa com frequencia de corte 
# de 1kHz

##figure(1)
##subplot(311)
##plot(t,m_t)
##xlim([0 n_periodo*(1/fm3)])
##subplot(312)
##plot(t,c_t)
##xlim([0 n_periodo*(1/fm3)])
##subplot(313)
##plot(t,s)
##xlim([0 n_periodo*(1/fm3)])
##hold on
##plot(t,m_t)


#-------- representacao na frequencia dos sinais -------
# cos(wt) = exp(jwt)/2 + exp(-jwt)/2

M_f = fftshift(fft(m_t))/length(m_t);
C_f = fftshift(fft(c_t))/length(c_t);
S = fftshift(fft(s))/length(s);

M_f_demod = fftshift(fft(m_t_demod))/length(m_t_demod);

f = [-Fs/2:1:Fs/2];

##figure(2)
##subplot(311)
##plot(f,abs(M_f))
##xlim([-1.5*fc 1.5*fc])
##ylim([-0.2 Am3/2])
##subplot(312)
##plot(f,abs(C_f))
##xlim([-1.5*fc 1.5*fc])
##ylim([-0.2 Am3/2])
##subplot(313)
##plot(f,abs(S))
##xlim([-1.5*fc 1.5*fc])
##ylim([-0.2 Am3/2])

# Me interessa trabalhar aqui
# O tamanho do eixo de frequência é (200001)

#Vetores para filtro:

# Como o passo é Fs/2 que é igual a 0.5, para andar 1000 hertz, é necessário 2000 passos
f_1001 = f(101002)
f_inf_999 = f(99002)
# Para chegar na freq de -999 hertz, andar 99002
#Tive que reduzir 2 duas unidade pois estava dando erro nos tamanhos dos vetores na hora de #multiplicar ponto a ponto 
filtra_zero = zeros(1,99000);
# Como o passo é Fs/2 que é igual a 0.5, para andar 1000 hertz, 
# é necessário 2000 passos + 1 para contar o 0
filtra_um = ones(1,2001);
# Só montar a matriz
filtro_passaBaixas = [filtra_zero filtra_um filtra_zero];

figure(3)
subplot(211)
plot(t,m_t_demod)
xlim([0 n_periodo*(1/fm3)])
subplot(212)
plot(f,abs(M_f_demod))
xlim([-1.5*2*fc 1.5*2*fc])
ylim([-0.2 Am3/2])

#Multiplicar ponto a ponto o filtro com o sinal a ser filtrado
sinal_Filtrado = M_f_demod.*filtro_passaBaixas;

# Plotando sinal filtrado
figure(4)
plot(f,sinal_Filtrado)
xlim([-1.5*2*fc 1.5*2*fc])
#ylim([-0.2 Am3/2])
























