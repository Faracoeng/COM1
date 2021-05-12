
% Para esboçar a onda senoidal necessita de uma base de tempo

% Definindo período de -10 até 10 com passo=0.01
t= -10:0.01:10;

% função senoidal

y = sin(2*pi*t);

% Mostrando o gráfico dos valores de y em função de t
plot(t,y)

% Revisando etiquetas
xlabel("Tempo")
ylabel("Amplitude")

title("Função seno no domínio do tempo")