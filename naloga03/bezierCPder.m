function db = bezierCPder(B,r)
% Opis:
%  Bezier Control points of derivative
%  bezierCPder vrne točke na krivulji, ki predstavlja odvod dane Bezierjeve krivulje 
%
% Definicija:
%  db = bezierCPder(B,r)
%
% Vhodni podatki:
%  B    matrika kontrolnih tock Bezierjeve krivulje, v
%       kateri vsaka vrstica predstavlja eno kontrolno
%       tocko,
%  r    stopnja odvoda, ki ga racunamo,
%
% Izhodni podatek:
%  db   matrika, v kateri vsaka vrstica predstavlja tocko
%       r-tega odvoda pri istoleznem parametru iz seznama t

[n,d]=size(B);
n=n-1;

db=factorial(n)/factorial(n-r)*diff(B,r);

end