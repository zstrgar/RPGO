function plotrbezier(B, w, t)
% Opis:
%  plotbezier narise racionalno Bezierjevo krivuljo za dane kontrolne
%  tocke, uteži in seznam parametrov
%
% Definicija:
%  plotrbezier(B, w,t)
%
% Vhodni podatki:
%  B    matrika velikosti n+1 x d, ki predstavlja kontrolne
%       tocke racionalne Bezierjeve krivulje
%  w    seznam utezi racionalne Bezierjeve krivulje,
%  t    seznam parametrov dolzine N, pri katerih racunamo
%       vrednost Bezierjeve krivulje

%izračun Farinovih točk
[n,d] = size(B);
W = zeros(n,1);
W(:,1) = w';
q = zeros(n-1,d);
for i = 1:n-1
    q(i,:) = W(i)/(W(i)+W(i+1))*B(i,:)+W(i+1)/(W(i)+W(i+1))*B(i+1,:);
end

%poligon kontrolnih točk
plot(B(:,1),B(:,2), '-o');
hold on

%Farinove točke
plot(q(:,1),q(:,2),'.');
hold on
    
%krivulja
b = rbezier(B,w,t);
plot(b(:,1),b(:,2));
hold off
    


end