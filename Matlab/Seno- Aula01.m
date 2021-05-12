

% Para esboçar a onda senoidal necessitamos de uma base de tempo

% Definindo período de tempo
TInicial = input("Insira o tempo inicial do período: ");

TFinal = input("Insira o tempo final do período: ");

passo = input("Insira o passo em que o período avança, utilize (.) no caso de número decimal: ");

t= TInicial:passo:TFinal;

% Definindo amplitude
a=input("Insira o valor da amplitude: ");
% Definindo frequência de 1Khz
f=input("Insira o valor da frequência: ");
% função senoidal

y = a*sin(2*pi*t*f);

% Mostrando o gráfico dos valores de y em função de t
plot(t,y)

% Revisando etiquetas
xlabel("Tempo")
ylabel("Amplitude")

title("Função seno no domínio do tempo")

% Exibir as grades de fundo
grid on
