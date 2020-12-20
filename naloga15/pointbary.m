function U = pointbary(P, T)
% Opis:
%  pointbary kartezične koordinate (x,y) točke P pretvori v baricentrične
%  koordinate (u, v, w) glede na trikotnik T
%
% Definicija: 
%  U = pointbary(P, T)
%
% Vhodna podatka:
%  P     točka s kartezičnimi koordinatami
%  T     trikotnik z oglišči V1, V2, V3
%
% Izhodni podatek:
%  U     točka z baricentričnimi koordinatami glede na trikotnik T

M=zeros(3, 3);  % matrika
for i=1:3
    M(:, i) = [1; (T(i,:))'];
end

P = [1; P'];

U = (linsolve(M,P))';


end

