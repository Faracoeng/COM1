clear all
close all
clc

Am = 1;
Ac = 1;
A1 = 1
A3 = 1/3;
A5 = 1/5;
A7 = 1/7;
A9 = 1/9;
A11 = 1/11;
A13 = 1/13;

fm = 1e3; # frequência do seno
fc = 2e3;

f1 = 1e3;
f3 = 3e3;
f5 = 5e3;
f7 = 7e3;
f9 = 9e3;
f11 = 11e3;
f13 = 13e3

wm = 2*pi*fm; # omega
wc = 2*pi*fc;
w1 = 2*pi*f1;
w3 = 2*pi*f3;
w5 = 2*pi*f5;
w7 = 2*pi*f7;
w9 = 2*pi*f9;
w11 = 2*pi*f11;
w13 = 2*pi*f13;

n_periodo = 2; # número de períodos para a visualização
N = 100; # fator de superamostragem (N deverá ser inteiro e maior que zero)
Fs = 2*fm*N; # frequência de amostragem deve respeitar o teorema de Nyquist
#Fs = 40e3;
Ts = 1/Fs; # Tempo de amostragem
t = [0:Ts:1]; # representando o tempo em segundos


ym = Am*cos(wm*t);
yc = A1*cos(wc*t);

y1 = A1*sin(w1*t);
y3 = A3*sin(w3*t);
y5 = A5*sin(w5*t);
y7 = A7*sin(w7*t);
y9 = A9*sin(w9*t);
y11 = A11*sin(w11*t);
y13 = A13*sin(w13*t);

s = ym.*yc;
s_onda_quadrada = y1 + y3 + y5 +y7 + y9 +y11 + y13;


figure(1)
plot(t,ym)
xlim([0 n_periodo*(1/fm)])
ylim([-Am*1.2 Am*1.2])

figure(2)
plot(t,s)
xlim([0 2*n_periodo*(1/fm)])
ylim([-Ac*1.2 Ac*1.2])

figure(3)
plot(t,s_onda_quadrada)
xlim([0 2*n_periodo*(1/f1)])

#-------- representação complexa -------
# cos(wt) = exp(jwt)/2 + exp(-jwt)/2

Y = fft(ym)/length(ym);
Y = fftshift(Y);
S = fftshift(fft(s))/length(s);
S_onda_quadrada = fftshift(fft(s_onda_quadrada))/length(s_onda_quadrada);

f = [-Fs/2:1:Fs/2];

figure(4)
plot(f,abs(Y))
ylim([0 (Am/2)*1.2])

figure(5)
plot(f,abs(S))
ylim([0 (Ac/4)*1.1])

figure(6)
plot(f,abs(S_onda_quadrada))



