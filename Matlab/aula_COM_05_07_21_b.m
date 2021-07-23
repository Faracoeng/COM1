clear all
close all
clc

info = [0 1 1 0]
N = 100  # Nivel de superamostragem
limiar = 0
info_up = upsample(info,N); 
filtro_NRZ = ones(1,N); # Filtro de faz o shape da saída do sinal superamostrado, neste caso retangular

sinal_tx = filter(filtro_NRZ,1,info_up)*2-1; # Aqui é pra manter amplitudo entre 1 e -1



sinal_rx = sinal_tx(N/2:N:end);

info_hat = sinal_rx > limiar;

erro = sum(xor(info, info_hat))

subplot(211)
stem(sinal_tx)
ylim([-1.2 1.2])
subplot(212)
plot(sinal_tx)
ylim([-1.2 1.2])
