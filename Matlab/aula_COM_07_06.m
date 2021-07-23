clear all
close all
clc

Am1 = 1;
Am2 = 0.5;
Am3 = 1.5;
Ac = 1;


fm1 = 100; # frequência do sinal de informação
fm2 = 300;
fm3 = 10;

fc = 10e3; # frequência da portadora


wm1 = 2*pi*fm1;
wm2 = 2*pi*fm2;
wm3 = 2*pi*fm3;

wc = 2*pi*fc;

n_periodo = 2; # número de períodos para a visualização
N = 10; # fator de superamostragem (N deverá ser inteiro e maior que zero)
Fs = 2*fc*N; # frequência de amostragem deve respeitar o teorema de Nyquist
Ts = 1/Fs; # Tempo de amostragem
t = [0:Ts:1]; # representando o tempo em segundos



m_t = Am1*cos(wm1*t) + Am2*cos(wm2*t) + Am3*cos(wm3*t); # sinal de informação
c_t = Ac*cos(wc*t); # portadora


# Modulação
s = m_t .* c_t; # sinal transmitido


# Demodulação
m_t_demod = s .* c_t;

# Implementar um filtro passa-baixa com frequencia de corte 
# de 1kHz

figure(1)
subplot(311)
plot(t,m_t)
xlim([0 n_periodo*(1/fm3)])
subplot(312)
plot(t,c_t)
xlim([0 n_periodo*(1/fm3)])
subplot(313)
plot(t,s)
xlim([0 n_periodo*(1/fm3)])
hold on
plot(t,m_t)


#-------- representação na frequência dos sinais -------
# cos(wt) = exp(jwt)/2 + exp(-jwt)/2

M_f = fftshift(fft(m_t))/length(m_t);
C_f = fftshift(fft(c_t))/length(c_t);
S = fftshift(fft(s))/length(s);

M_f_demod = fftshift(fft(m_t_demod))/length(m_t_demod);

f = [-Fs/2:1:Fs/2];

figure(2)
subplot(311)
plot(f,abs(M_f))
xlim([-1.5*fc 1.5*fc])
ylim([-0.2 Am3/2])
subplot(312)
plot(f,abs(C_f))
xlim([-1.5*fc 1.5*fc])
ylim([-0.2 Am3/2])
subplot(313)
plot(f,abs(S))
xlim([-1.5*fc 1.5*fc])
ylim([-0.2 Am3/2])

figure(3)
subplot(211)
plot(t,m_t_demod)
xlim([0 n_periodo*(1/fm3)])
subplot(212)
plot(f,abs(M_f_demod))
xlim([-1.5*2*fc 1.5*2*fc])
ylim([-0.2 Am3/2])







