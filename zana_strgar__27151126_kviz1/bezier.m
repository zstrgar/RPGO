function b = bezier(B,t)
% Opis:
%  bezier vrne tocke na Bezierjevi krivulji pri danih
%  parametrih
%
% Definicija:
%  b = bezier(B,t)
%
% Vhodna podatka:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne
%       tocke Bezierjeve krivulje stopnje n v
%       d-dimenzionalnem prostoru,
%  t    seznam parametrov dolzine k, pri katerih racunamo
%       vrednost Bezierjeve krivulje
%
% Izhodni podatek:
%  b    matrika velikosti k x d, kjer i-ta vrstica
%       predstavlja tocko na Bezierjevi krivulji pri
%       parametru iz t na i-tem mestu

k = length(t);          % dolžina seznama parametrov
n = length(B)-1;        % stopnja Bezierjeve krivulje, točk v B je n+1
d = length(B(1,:));     % dimenzija (število stolpcev v B)

b =zeros(k,d);          
for i =1:k              % zanka po t-jih
    for j=1:d           % zanka po vektorjih (iz tukej dobim stolpce B-ja)
        M = decasteljau(B(:,j),t(i));   %decasteljaujeva matrika za vektor v j-tem stolpcu
        b(i,j)= M(1, n+1);          %zadnji element iz M dam na (i,j) mesto
    end
end

b;
    

end