function BS = beziersub(B,t)
% Opis:
%  beziersub izvede subdivizijo Bezierjeve krivulje
% 
% Definicija:
%  BS = beziersub(B,t)
%
% Vhodni podatki:
%  B    matrika kontrolnih tock Bezierjeve krivulje, v
%       kateri vrstica predstavlja eno kontrolno tocko,
%  t    parameter subdivizije Bezierjeve krivulje
%
% Izhodni podatek:
%  BS   celica, ki vsebuje kontrolne tocke 2 krivulj, ki
%       jih dobimo s subdivizijo prvotne Bezierjeve krivulje 

[n, d]=size(B);
BS = cell(1, 2);


L = zeros(n,d);  % v matriki L bodo kontrolne točke leve krivulje
D = zeros(n,d);  % v matriki D bodo kontrolne točke desne krivulje

C1 = decasteljau(B(:,1), t); % deCasteljau za prvo komponento Bja
C2 = decasteljau(B(:,2), t); % deCasteljau za prvo komponento Bja
C3 = decasteljau(B(:,3), t); %3. komponenta

for i = 1:n  
      L(i,1) = C1(1, i);
      L(i,2) = C2(1, i);
      L(i,3) = C3(1, i);
      D(i,1) = C1(i, (n+1)-i);
      D(i,2) = C2(i, (n+1)-i);
      D(i,3) = C3(i, (n+1)-i);
end

BS{1} = L;  % kontrolne točke leve strani
BS{2} = D;  % kontrolne točke desne strani
BS;

end