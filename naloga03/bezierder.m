function db = bezierder(B,r,t)
% Opis:
%  bezierder vrne tocke na krivulji, ki predstavlja odvod
%  dane Bezierjeve krivulje
%
% Definicija:
%  db = bezierder(B,r,t)
%
% Vhodni podatki:
%  B    matrika kontrolnih tock Bezierjeve krivulje, v
%       kateri vsaka vrstica predstavlja eno kontrolno
%       tocko,
%  r    stopnja odvoda, ki ga racunamo,
%  t    seznam parameterov, pri katerih racunamo odvod
%
% Izhodni podatek:
%  db   matrika, v kateri vsaka vrstica predstavlja tocko
%       r-tega odvoda pri istoleznem parametru iz seznama t

[n,d]=size(B);
n = n-1;
k = length(t);


db =zeros(k,d);          
for i =1:k              % zanka po t-jih
    for j=1:d           % zanka po vektorjih (iz tukej dobim stolpce B-ja)
        M = bezier(B(:,j),t(i));   %decasteljaujeva matrika za vektor v j-tem stolpcu
        diferenca=diff(M(:,(n+1)-r),r);
        db(i,j) = factorial(n)/factorial(n-r) .* diferenca(1); 
    end
end

% elegantnejša rešitev
% dr = factorial(n)/factorial(n-r)*diff(B,r);
% 
% db = bezier(dr,t);
% 
% 
% db;

end