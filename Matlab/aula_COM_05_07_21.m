clc
clear all
close all

#pkg load communications
#pkg load signal

A = 1;
fm = 1e3;
N = 100;
f_ideal = N * fm;
t_ideal = 1/f_ideal;
t = [0:t_ideal:1-t_ideal];
y = A*sin(2*pi*fm*t);
plot(t,y)
xlim([0 1/fm])




clc
clear all
close all

## LEITURA DE UM ARQUIVO DE ÁUDIO
[y, fs] = audioread('teste-aula-AD.wav');
Ts = 1/fs;
T = length(y)/fs;
t = [0:Ts:T-Ts];
figure(1)
plot(t, transpose(y))
A = max(y)-min(y);

k = 3; #n. de bits do quantizador
L = 2^k; # n. de níveis do quantizador
passo = (2*A)/L; # passo de quantização (razão entre a escala de tensão e o n. de níveis
niveis_quant = [min(y_n)+(passo/2):passo:max(y_n)-(passo/2)]
niveis_plot = linspace(niveis_quant, niveis_quant, length(y_n));
limiares = [min(y_n)+(passo):passo:max(y_n)-(passo)]


%************* Conversão AD ******************
for i = 1:length(y)
  for j = 1:length(limiares) 
    if y(i) < limiares(j)
      y_n_nivel(i) = j-1;
      break
    else
      y_n_nivel(i) = L-1;
    end
  end
end

y_n_quant = (y_n_nivel*passo)-(max(niveis_quant));

y_bin = de2bi(y_n_nivel); # Codificação
[lin,col] = size(y_bin);
PCM_seq = reshape(transpose(y_bin),1,lin*col); # Nível lógico
%*********************************************

%******** Formas de onda PCM - Transmissão do sinal **************
%*** Converter uma sequência lógica em um sinal físico (forma de onda)

%ESCREVA O SEU CÓDIGO AQUI

%*****************************************************************


%******** Detectar o sinal PCM e transformar em uma sequência binaria para o processo DA

%ESCREVA O SEU CÓDIGO AQUI

%******************************************************************


%************** Conversão DA *****************
r_bin = transpose(reshape(PCM_seq,col,lin));
r_n_nivel = transpose(bi2de(r_bin)); 
r_n_quant = (r_n_nivel*passo)-(max(niveis_quant));
%*********************************************

figure(2)
stem(n,y_n)
xlim([0 1/fm])
hold on
plot(n,niveis_plot, '--')
stem(n,y_n_quant, 'k*')

%*********** Escute o áudio recuperado ******
% ESCREVA SEU CÓDIGO AQUI




