clear; close all;
h = [600]; % �ok katmanl� sinir a��ndaki n�ron say�s� ve katman say�s�; 2 katmanl�, her birinde 10'ar n�ron bulunuyor.
%MFCC, Melfrequency Capstral Coefficients hesaplayarak 20 katsay�s�n� giri� olarak alaca��z.
% X = [03.1 0.2 1 1;1 0.5 0 1; 1 0 1 0];
[mm,aspc] = MelfccYarat('meri�.mp3');
Pmeric = mm(:); %Cepstral Coefficient say�lar�n� giri� ve target olarak alaca��z.
numb=15;
Pmeric = Pmeric(1:numb);
[mm,aspc] = MelfccYarat('pamukkale.mp3');
Ppamukkale = mm(:);
Ppamukkale = Ppamukkale(1:numb);
[mm,aspc] = MelfccYarat('g�zel.mp3');
Pguzel = mm(:); %t�m mfcc matrixini tek s�tun yapt�m
Pguzel = Pguzel(1:numb);
[mm,aspc] = MelfccYarat('matmazel.mp3');
Pmatmazel = mm(:);
Pmatmazel = Pmatmazel(1:numb);
[mm,aspc] = MelfccYarat('�aml�k.mp3');
Pcamlik = mm(:);
Pcamlik = Pcamlik(1:numb);
[mm,aspc] = MelfccYarat('tayfun.mp3');
Ptayfun = mm(:);
Ptayfun = Ptayfun(1:numb);
[mm,aspc] = MelfccYarat('denizli.mp3');
Pdenizli = mm(:);
Pdenizli = Pdenizli(1:numb);
[mm,aspc] = MelfccYarat('go.mp3');
Pgo = mm(:);
Pgo = Pgo(1:numb);
X = horzcat(Pmeric,Ppamukkale,Pguzel,Pmatmazel,Pcamlik,Ptayfun,Pdenizli,Pgo);
% X = horzcat(Pmeric,Ppamukkale);
X= X/norm(X);
% X=abs(X);
X = X*0.9;
T = X; % Biz ne girdiyse onu elde etmek istiyoruz bu sebeple hedefler giri� vekt�rlerine e�ittir.
[model,mse] = mlp(X,T,h);

plot(mse);
%disp(['T = [' num2str(T) ']']);
Y = mlpPred(model,X); % Workspace'de de�i�kenlerden Y ��k�� de�eri hemen hemen T matrixi ile hemen hemen ayn� ise a� yak�nsam��t�r denilir.
%disp(['Y = [' num2str(Y) ']']);