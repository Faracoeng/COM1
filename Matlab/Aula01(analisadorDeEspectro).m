clear all
close all
clc

A = 1;
fm = 21e3; # frequência do seno
N = 20; # fator de superamostragem (N deverá ser inteiro e maior que zero)
Fs = 2*fm*N; # frequência de amostragem deve respeitar o teorema de Nyquist
#Fs = 40e3;
Ts = 1/Fs; # Tempo de amostragem
t = [0:Ts:1]; # representando o tempo em segundos
w = 2*pi*fm; # omega
y = A*cos(w*t);
n_periodo = 2; # número de períodos para a visualização
figure(1)
subplot(211)
stem(t,y)
xlim([0 n_periodo*(1/fm)])
ylim([-1 1])
subplot(212)
plot(t,y)
xlim([0 n_periodo*(1/fm)])
ylim([-1 1])

#-------- representação complexa -------
# cos(wt) = exp(jwt)/2 + exp(-jwt)/2

Y1 = fft(y);
Y2 = fftshift(Y1);
f1 = [0:1:Fs];
f2 = [-Fs/2:1:Fs/2];
figure(2)
subplot(211)
plot(f1,abs(Y1))
subplot(212)
plot(f2,abs(Y2))
