function S = argyrisspline ( tri ,f , Df , Hf )
% Opis :
% argyrisspline izračuna Bezierjeve predstavitve polinomov ,
% ki določajo Argyrisov zlepek nad triangulacijo
%
% Definicija :
% S = argyrisspline (tri ,f,Df ,Hf)
%
% Vhodni podatki :
% tri objekt razreda triangulation , ki določa
% triangulacijo domene , nad katero aproksimiramo
% funkcijo f,
% f funkcija , ki jo interpoliramo ,
% Df gradient funkcije , ki jo interpoliramo ,
% Hf Hessejeva matrika funkcije , ki jo interpoliramo
%
% Izhodni podatek :
% S celica z dolžino , ki ustreza številu trikotnikov v
% triangulaciji , v kateri vsak element vsebuje matriko
% velikosti 6 x 6 , ki predstavlja koeficiente
% Argyrisovega polinoma v Bezierjevi obliki

[n d]= size(tri.ConnectivityList); %[število trikotnikov dimnezija]

%imamo prostor P^2_5, torej 5->n+1=6
S=cell(n,1);

for i =1:n
    indeksi_trikotnika = tri.ConnectivityList(i,:);
    tocke_trikotnika =tri.Points(indeksi_trikotnika,:);
    S{i}=argyris(tocke_trikotnika,f,Df,Hf);
end

end