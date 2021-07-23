##
#### Exercicios slide 12:
#### Gerar um sinal s(t) composto pela somatória de 3 senos com
#### amplitudes de 6V, 2V e 4V e frequências de 1, 3 e 5 kHz,
#### respectivamente.
##
####clear all
####close all
####clc
####
####Amplitude1 = 6;
####Amplitude2 = 2;
####Amplitude3 = 4;
####
####freq1 = 1000;
####freq2 = 3000;
####freq3 = 5000;
####
####wm1 = 2*pi*freq1;
####wm2 = 2*pi*freq2;
####wm3 = 2*pi*freq3;
####
####n_periodo = 10; # número de períodos para a visualização
####N = 10; # fator de superamostragem 
####Fs = 2*10000*N; # frequência de amostragem deve respeitar o teorema de Nyquist
####Ts = 1/Fs; # Tempo de amostragem
####t = [0:Ts:1]; # representando o tempo em segundos
####
####seno_01 = Amplitude1*sin(wm1*t);  
####seno_02 = Amplitude2*sin(wm2*t);
####seno_03 =  Amplitude3*sin(wm3*t);
#### 
####s_t = seno_01 + seno_02 + seno_03;
####
##### Plotar em uma figura os três cossenos e o sinal 's ' no domínio do
#####tempo e da frequência.
####
##### Plot no dominio do tempo
####
######figure(1)
######subplot(4,1,1)
######plot(t,seno_01)
######title('Dominio do Tempo')
######xlim([0 n_periodo*(1/freq1)])
######
######subplot(4,1,2)
######plot(t,seno_02)
######xlim([0 n_periodo*(1/freq2)])
######
######subplot(4,1,3)
######plot(t,seno_03)
######xlim([0 n_periodo*(1/freq3)])
######
#####subplot(4,1,4)
####plot(t,s_t)
####xlim([0 n_periodo*(1/freq3)])
####
####### Plot no dominio da frequência
####
####SEN1_01 = fftshift(fft(seno_01))/length(seno_01);
####SEN1_02 = fftshift(fft(seno_02))/length(seno_02);
####SEN1_03 = fftshift(fft(seno_03))/length(seno_03);
####
####saida_freq = fftshift(fft(s_t))/length(s_t);
####f1 = [0:1:Fs];
####f2 = [-Fs/2:1:Fs/2];
######
######figure(2)
######title('Dominio da Frequência')
#######subplot(4,1,1)
#######plot(f2,abs(saida_freq))
######subplot(4,1,1)
######plot(f2,abs(SEN1_01))
######ylim([-0.2 Amplitude1])
######
######subplot(4,1,2)
######plot(f2,abs(SEN1_02))
######
######ylim([-0.2 Amplitude1])
######
######subplot(4,1,3)
######plot(f2,abs(SEN1_03))
######
######ylim([-0.2 Amplitude1])
#####figure(3)
#####subplot(4,1,4)
######plot(f2,abs(saida_freq))
#######xlim([0 20*(fm3)])
######ylim([-0.2 Amplitude1])
######
########
########
####### Utilizando a função 'norm', determine a potência média do sinal 's'
######
##### periodo que é 1/f, dividido pela integra, somatoria dos pontos 
####potencia_sinal= (1/length(s_t)) * sum(s_t .^2)
####
####
######
#######Utilizando a função 'pwelch', plote a Densidade Espectral de
#######Potência do sinal 's'.
######
######
#######Fazer a tranformada de fourier do sinal, autocorrelação do sinall s no domínio do tempo e então depois fazer a transformada de fourier 
######d_espectral = pwelch(p_medio)
######figure(4)
######title('Densidade Espectral de Potência')
#######plot(t,d_espectral)
######xlim([0 n_periodo*(1/freq3)])
####
####pwelch(saida_freq,[],[],[],Fs,'twosided');
##
##%% Exercicios slide 13:
### Gerar um sinal s(t) composto pela somatória de 3 senos com amplitudes
### de 5V, 5/3V e 1V e frequências de 1, 3 e 5 kHz, respectivamente.
##
##clear all
##close all
##clc
##
##Amplitude1 = 5;
##Amplitude2 = 5/3;
##Amplitude3 = 1;
##
##freq1 = 1000;
##freq2 = 3000;
##freq3 = 5000;
##
##wm1 = 2*pi*freq1;
##wm2 = 2*pi*freq2;
##wm3 = 2*pi*freq3;
##
##n_periodo = 4; # número de períodos para a visualização
##N = 10; # fator de superamostragem 
##Fs = 2*10000*N; # frequência de amostragem deve respeitar o teorema de Nyquist
##Ts = 1/Fs; # Tempo de amostragem
##t = [0:Ts:1]; # representando o tempo em segundos
##
##seno_01 = Amplitude1*sin(wm1*t);  
##seno_02 = Amplitude2*sin(wm2*t);
##seno_03 =  Amplitude3*sin(wm3*t);
## 
##s_t = seno_01 + seno_02 + seno_03; 
##
###Plotar em uma figura os três cossenos e o sinal 's' no domínio do tempo e
###da frequência
##
##### Plot no dominio do tempo
##
##figure(1)
##subplot(4,1,1)
####plot(t,seno_01)
####title('Dominio do Tempo')
####xlim([0 n_periodo*(1/freq1)])
####
####subplot(4,1,2)
####plot(t,seno_02)
####xlim([0 n_periodo*(1/freq2)])
####
####subplot(4,1,3)
####plot(t,seno_03)
####xlim([0 n_periodo*(1/freq3)])
####
####subplot(4,1,4)
##plot(t,s_t)
##xlim([0 n_periodo*(1/freq3)])
##
## #Plot no dominio da frequência
##
##saida_freq = fftshift(fft(s_t))/length(s_t);
###SEN1_01 = fft(seno_01);
###SEN1_01_SHIFT = fftshift(SEN1_01);
###SEN1_01_SHIFT = fftshift(SEN1_01)/length(SEN1_01);
##
##f1 = [0:1:Fs];
##f2 = [-Fs/2:1:Fs/2];
####figure(2)
####title('Dominio da Frequência')
#####subplot(4,1,1)
####plot(f2,abs(saida_freq))
####xlim([10000 10000])
####ylim([-0.2 Amplitude1])
###subplot(4,1,2)
###plot(f2,abs(SEN1_01_SHIFT))
##
### Gerar 3 filtros ideais:
##
###-------------- Passa baixa (frequência de corte em 2kHz)
##
### para alcançar 2K o valor é f2(102002)
### O passo é Fs/2
### f2(98000) para alcançar -2001kHz
### a quantidade para chegar em +2kHz é (102002 - 98000)
##filtra_zero_2k = zeros(1,98000);
##filtra_um_2k = ones(1,4001);
### Só montar a matriz
##filtro_passaBaixas_2k = [filtra_zero_2k filtra_um_2k filtra_zero_2k];
##sinal_2k = s_t.*filtro_passaBaixas_2k;
##subplot(4,1,2)
##plot(f2,abs(sinal_2k))
##xlim([5000 5000])
###ylim([-0.2 5])multiplicar ponto a ponto 
##
####
##
###--------------Passa alta (banda de passagem acima de 4kHz)
##
## #para alcançar 4K o valor é f2(104002)
## #f2(96000) alcança -4001
##filtra_um_4k = ones(1,96000);
##
### a quantidade para chegar em +4kHz é (104002 - 96000)
##filtra_zero_4k = zeros(1,8001);
##
## #Só montar a matriz
##filtro_passaBaixas_4k = [filtra_um_4k filtra_zero_4k filtra_um_4k];
##sinal_4k = s_t.*filtro_passaBaixas_4k;
##subplot(4,1,3)
##plot(f2,abs(sinal_4k))
##xlim([10000 10000])
####ylim([-0.2 1])
####
###---------------Passa faixa (banda de passagem entre 2 e 4kHz)
##
### zera até chegar em 4kHz
##zera_ate_4k = zeros(1,96000);
### Mantém até 2k
##mantem_4k_2k = ones(1,2000);
### Zera entre -2k e 2k
##zera_2k_2k = zeros(1,4001);
####
#####matriz
##passa_faixa = [zera_ate_4k mantem_4k_2k zera_2k_2k mantem_4k_2k zera_ate_4k];
####
##faixa_sinal = s_t.*passa_faixa;
###figure (3)
##subplot(4,1,4)
##plot(f2,abs(faixa_sinal))
###xlim([-20000 20000])
####
####ylim([-0.2 1])


## Exercicios slide 14:

##Gerar um vetor representando um ruído com distribuição
##normal utilizando a função 'randn' do matlab. Gere 1 segundo
##de ruído considerando um tempo de amostragem de 1/10k.
desvio_padrao = 4;
n = randn(1,10000);

#Plotar o histograma do ruído para observar a distribuição
#Gaussiana. Utilizar a função 'histogram'
#hist(n,100)
#hist(saida_freq,100)
var(n) # proxima de 1
Fs = 10000 - 1;
Ts = 1/Fs;
tempo = [0:Ts:1];
eixo_f = [-5000:1:5000];
#figure(1)
t = tempo - 1;
#plot(t,n)


# TEMPOO

saida_freq = fftshift(fft(n))/length(n);
f2 = [-Fs/2:1:Fs/2];
#figure (2)
#plot(f2,saida_freq)

filtro=fir1(50,(1000*2)/10000);

figure(1)
saida = filter(filtro,1,n);
#hist(saida,100)
#figure(2)
plot (t,saida)
##autocorrelacao = xcorr(n);
##plot(autocorrelacao) 
##filtro=fir1(50,(1000*2)/Fs);
##freqz(filtro)

##saida = filtro .* n;
##figure(2)
##plot(saida)
#Plotar o ruído no domínio do tempo e da frequência
# Gerar eixo F de -5000 até 5000

#Utilizando a função 'xcorr', plote a função de autocorrelação
#do ruído.






