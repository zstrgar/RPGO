function b = rbezier(B,w,t)
% Opis:
%  rbezier vrne tocke na racionalni Bezierovi krivulji
%
% Definicija:
%  b = rbezier(B,w,t)
%
% Vhodni podatki:
%  B    matrika velikosti n+1 x d, v kateri vsaka vrstica
%       predstavlja kontrolno tocko racionalne Bezierjeve
%       krivulje stopnje n v d-dimenzionalnem prostoru,
%  w    seznam utezi racionalne Bezierjeve krivulje,
%  t    seznam parametrov dolzine N, za katere se racunajo
%       tocke na racionalni Bezierjevi krivulji
%
% Izhodni podatek:
%  b    matrika velikosti N x d, v kateri i-ta vrstica
%       predstavlja tocko na racionalni Bezierjevi krivulji
%       pri i-tem parametru iz seznama t
N = length(t);
[n,d] = size(B);
b = zeros(N,d);

for i=1:N
    b(i,:) = rdecasteljau(B, w, t(i));
end
b;
end
