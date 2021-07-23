clc
clear all
close all


## LEITURA do meu arquivo de áudio
## Esta etapa simula receber um sinal físico no sistema

[y, fs] = audioread('MeuAudio.wav');  # fs ja é a freq. de amostragem do sinal, só capturar os parâmetros através do valor
Ts = 1/fs;
T = length(y)/fs;
t = [0:Ts:T-Ts];
figure(1)
plot(t, transpose(y)) # Meu sinal
A = max(y)-min(y);


k = 3; #n. de bits do quantizador
L = 2^k; # n. de níveis do quantizador
passo = (2*A)/L; # passo de quantização (razão entre a escala de tensão e o número de níveis
niveis_quant = [min(y)+(passo/2):passo:max(y)-(passo/2)];
niveis_plot = linspace(niveis_quant, niveis_quant, length(y));
limiares = [min(y)+(passo):passo:max(y)-(passo)];

%************* Conversão AD ******************
# Aqui é realizada a conversão do meu sinal de voz de analógico para digital
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

#quantiz função pronta
#y_n_quant = (y_n_nivel*passo)-(max(niveis_quant));

y_bin = de2bi(y_n_nivel); # Codificão  decimal para binário
[lin,col] = size(y_bin);
PCM_seq = reshape(transpose(y_bin),1,lin*col); # Nível lógico
# Aqui o sinal esta com sequência lógica estabelecido, 
# é necessário agora definir a codificação de linha para transmissão 
# do sinal em meio guiado, para isso o sinal PCM deve ser transformado 
#em um sinal físico  para este caso, seria em par metálico.


% --------------------------------------------------------------------------

info = PCM_seq; # Sinal de informação será o resultante do processo de conversão AD do áudio
# A codificação utilizada para transferir o sinal em linha será a NRZ, 
# é necessário realizar uma superamostragem do sinal para transmitir ele
N = 6 # Parâmetro definido de superamostragem
# Este valor implica na quantidade de zeros que preencherão os intervalos do sinal original, 
# e no tamanho do sinal de filtro utilizado para moldar a codificação.

#N = 100  # Nivel de superamostragem   assim trava

# Como amplitude varia entre 1 e -1 na codificação NRZ, o limiar de seleção será 0
limiar = 0;
info_up = upsample(info,N); # fazer o processo de super amostragem com valor pre definido

filtro_NRZ = ones(1,N); # Filtro que faz o formato do sinal de saída em relação ao sinal superamostrado, 
# neste caso retangular representando os pulsos

# se utilizar a função conv() para fazer a convolução, lembrar de excluir os últimos bits 
# resultantes do processo, a leitura é feita até a posição "lenght(sinal_tx)) - N" sendo N o valor definido da super amostragem 

sinal_tx = filter(filtro_NRZ,1,info_up)*2-1; # Multiplicação e subtração é pra manter amplitude entre 1 e -1, 
# Pois o resultante da conversão "AD" amplitudes entre "1" e "0", resumindo, definimos a codificação NRZ AQUI!!

# Sinal será transmitido no canal...

# No receptor, realizar processo de detecção de símbolo
sinal_rx = sinal_tx(N/2:N:end); # Valores de "N" devem ser pares, para ter índices inteiros no vetor

info_hat = sinal_rx > limiar; # Informação estimada deve ser maior que o limiar, 
# aqui é recuperado o sinal de informação original, ou seja, ates de ser codificado e transmitido
# utilizando o mesmo limiar de codificação definido na transmissão

erro = sum(xor(info, info_hat)); # Através da comparação XOR, analisando a relação 
# entre sinal de informação transmitido e o recebido, as posições em que estiverem
# com bit diferente, que indicam erro no processo, estarão destacadas com o bit 1
# Então vamos detectar o total de erros ocorridos

#disp("Total de erros: ") ,disp(erro) 

##figure(2)
##subplot(211)
##stem(sinal_tx)
##ylim([-1.2 1.2])
##subplot(212)
##plot(sinal_tx)
##ylim([-1.2 1.2])

##%************** Conversão DA *****************
# Para reproduzir o sinal de áudio original, é necessário fazer a conversão de digital, 
# como foi recebido, para analógico, para ser reproduzido pela placa de som

r_bin = transpose(reshape(info_hat,col,lin));
r_n_nivel = transpose(bi2de(r_bin)); 
r_n_quant = (r_n_nivel*passo)-(max(niveis_quant)); ## parâmetros devem respeitar os utilizados na conversão AD
##%*********************************************
##
figure(2)
stem(n,y_n)
xlim([0 1/fm])
hold on
plot(n,niveis_plot, '--')
stem(n,y_n_quant, 'k*')

#Escutar o áudio
sound(y_n_quant)








