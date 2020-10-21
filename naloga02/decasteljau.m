function D = decasteljau(b,t)
% Opis:
%  decasteljau vrne shemo de Casteljaujevega postopka za dan
%  seznam koordinat b pri danem parametru t
%
% Definicija:
%  D = decasteljau(b,t)
%
% Vhodna podatka:
%  b    seznam koordinat kontrolnih tock Bezierjeve krivulje
%       stopnje n,
%  t    parameter, pri katerem racunamo koordinato
%       Bezierjeve krivulje
%
% Izhodni podatek:
%  D    tabela velikosti n+1 x n+1, ki predstavlja de
%       Casteljaujevo shemo za koordinate b pri parametru t
%       (element na mestu (1,n+1) je koordinata Bezierjeve
%       krivulje pri parametru t, elementi na mestih (i,j)
%       za i > n-j+2 so NaN)

n = length(b)-1;    %ta n je stopnja Bezierjeve krivulje (točk imam pa n+1)
D = NaN(n+1);       %matrika z NaN

for i=0:n
    D(i+1,1)=b(i+1);   
end                 %+1 zato, ker i teče od 0 do n (kot če bi imela b0,...)

for j=1:n
    for i=0:(n-j)   %naredi zgornjo trikotno
        D(i+1,j+1) = (1-t)*D(i+1,j) + t*D(i+2,j);
    end
end

D;
        

end

