% Ler o arquivo de áudio e armazená-o em um vetor
[x1, fs1] = audioread('Church Schellingwoude.wav');

% Definir a duração da gravação em segundos
duracao_gravacao = 10;

% Gravar o áudio através do microfone por 10 segundos
fs2 = 44100; % Frequência de amostragem em Hz
info = audiodevinfo; % Obter informações sobre os dispositivos de áudio disponíveis
disp('Gravando...');
recorder = audiorecorder(fs2, 16, 1); % Criar o objeto gravador de áudio
recordblocking(recorder, duracao_gravacao); % Gravar o áudio
disp('Gravação concluída.');
x2 = getaudiodata(recorder); % Armazenar o áudio gravado em um vetor

% Realiza a convolução entre os dois sinais
y = conv2(x1, x2);

% Normaliza o sinal resultante
y = y / max(abs(y));

% Escreve o resultado da convolução em um arquivo de áudio
filename = 'resultado v2.wav';
fs = max(fs1, fs2); % Usa a maior frequência de amostragem dos dois sinais
audiowrite(filename, y, fs);

% Exibi uma mensagem de conclusão
disp(['Arquivo salvo: ' filename]);
