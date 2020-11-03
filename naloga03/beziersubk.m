function BS = beziersubk(B,t,k)
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
%  k    število korakov subdivizij
%
% Izhodni podatek:
%  BS   celica, ki vsebuje kontrolne tocke 2^k krivulj, ki
%       jih dobimo s subdivizijo prvotne Bezierjeve krivulje

SD = cell(k+1, 2^k);  %shema subdivizij
SD{1,1}=B;

for i=2:k+1
    s=1;                
    for j = 1:2^(i-2)   %zakaj je tukej i-2 nimam pojma
        celica = beziersub(SD{i-1, j},t);
        SD{i,s} = celica{1};
        SD{i,s+1} = celica{2};
        s = s+2;        % skok za 2 po stolpcih
    end
end


BS = cell(1, 2^k);
for i =1:2^k
    BS{i} = SD{end, i};         
end

BS;

end