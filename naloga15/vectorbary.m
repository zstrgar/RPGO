function V = vectorbary(P, T)
% Opis:
%  vectorbarry kartezične koordinate (x,y) krajevnega vektorja
%  P-0 pretvori v baricentrične
%  koordinate (u, v, w) glede na trikotnik T
%
% Definicija: 
%  U = vectorbary(P, T)
%
% Vhodna podatka:
%  P     krajevni vektor točke P
%  T     trikotnik z oglišči V1, V2, V3
%
% Izhodni podatek:
%  V     vektor z baricentričnimi koordinatami glede na trikotnik T


M=zeros(3, 3);
for i=1:3
    M(:, i) = [1; (T(i,:))'];
end

P = [0; P'];   %razlika med pointbary in vectorbary je v prvi komponenti

V = (linsolve(M,P))';
end