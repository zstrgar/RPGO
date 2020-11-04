function plotbezier(B,t)
% Opis:
%  plotbezier narise Bezierjevo krivuljo za dane kontrolne
%  tocke in seznam parametrov
%
% Definicija:
%  plotbezier(B,t)
%
% Vhodni podatki:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne
%       tocke Bezierjeve krivulje stopnje n v
%       d-dimenzionalnem prostoru,
%  t    seznam parametrov dolzine k, pri katerih racunamo
%       vrednost Bezierjeve krivulje

%poligon kontrolnih točk
plot(B(:,1),B(:,2), '-o','LineWidth', 1);
hold on

b = bezier(B,t);
plot(b(:,1),b(:,2));
hold off
    


end