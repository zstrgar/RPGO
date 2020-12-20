function B = argyris(T,f,Df,Hf)
% Opis:
%  argyris izracuna Bezierjeve ordinate polinoma dveh
%  spremenljivk stopnje 5, ki interpolira vrednosti, prve in
%  druge odvode podane funkcije f v ogliscih trikotnika ter
%  odvode funkcije f v srediscih stranic trikotnika v smeri,
%  pravokotni na stranico
%
% Definicija:
%  B = argyris(T,f,Df,Hf)
%
% Vhodni podatki:
%  T    tabela velikosti 3 x 2, v kateri vsaka vrstica
%       predstavlja oglisce trikonika, nad katerim je
%       definiran polinom,
%  f    funkcija, ki jo interpoliramo,
%  Df   gradient funkcije, ki jo interpoliramo,
%  Hf   Hessejeva matrika funkcije, ki jo interpoliramo
%
% Izhodni podatek:
%  B    matrika velikosti 6 x 6, ki predstavlja koeficiente
%       polinoma dveh spremenljivk stopnje 5 v Bezierjevi
%       obliki

%oglišča trikotnika T
V1 = T(1,:);
V2 = T(2,:);
V3 = T(3,:);

x1 = V1(1); y1 = V1(2);
x2 = V2(1); y2 = V2(2);
x3 = V3(1); y3 = V3(2);

%vrednosti funkcij
fV1 = f(x1, y1);
fV2 = f(x2, y2);
fV3 = f(x3, y3);

%vrednosti Df
Df1 = Df(x1, y1);
Df2 = Df(x2, y2);
Df3 = Df(x3, y3);

%vrednosti Hf
Hf1 = Hf(V1(1), V1(2));
Hf2 = Hf(V2(1), V2(2));
Hf3 = Hf(V3(1), V3(2));

%sestavljanje B===============================
B = nan(6,6);

%kotne
B(1,1) = fV1; 
B(1,6) = fV2; 
B(6,1) = fV3;

%točka desno od kotne
B(1,2) = fV1 + 1/5 * dot(Df1, V2-V1); %okoli V1
B(2,5) = fV2 + 1/5 * dot(Df2, V3-V2); %okoli V3
B(5,1) = fV3 + 1/5 * dot(Df3, V1-V3); %okoli V3

%točka levo od kotne
B(2,1) = fV1 + 1/5 * dot(Df1, V3-V1); %okoli V1
B(1,5) = fV2 + 1/5 * dot(Df2, V1-V2); %okoli V2
B(5,2) = fV3 + 1/5 * dot(Df3, V2-V3); %okoli V3

%točka dve desno od kotne
B(1,3) = fV1 + 2/5 * dot(Df1, V2-V1) + 1/20 * dot(V2-V1, (V2-V1)*Hf1); %okoli V1
B(3,4) = fV2 + 2/5 * dot(Df2, V3-V2) + 1/20 * dot(V3-V2, (V3-V2)*Hf2); %okoli V2
B(4,1) = fV3 + 2/5 * dot(Df3, V1-V3) + 1/20 * dot(V1-V3, (V1-V3)*Hf3); %okoli V3

%točka dve levo od kotne
B(3,1) = fV1 + 2/5 * dot(Df1, V3-V1) + 1/20 * dot(V3-V1, (V3-V1)*Hf1); %okoli V1
B(1,4) = fV2 + 2/5 * dot(Df2, V1-V2) + 1/20 * dot(V1-V2, (V1-V2)*Hf2); %okoli V2
B(4,3) = fV3 + 2/5 * dot(Df3, V2-V3) + 1/20 * dot(V2-V3, (V2-V3)*Hf3); %okoli V3

%točka na sredi
B(2,2) = fV1 + 1/5 * dot(Df1, V2-V1) + 1/5 * dot(Df1, V3-V1) + 1/20 * dot(V3-V1, (V2-V1)*Hf1); %okoli V1
B(2,4) = fV2 + 1/5 * dot(Df2, V3-V2) + 1/5 * dot(Df2, V1-V2) + 1/20 * dot(V1-V2, (V3-V2)*Hf2); %okoli V2
B(4,2) = fV3 + 1/5 * dot(Df3, V1-V3) + 1/5 * dot(Df3, V2-V3) + 1/20 * dot(V2-V3, (V1-V3)*Hf3); %okoli V3

%sredinske točke
%odvod v točki V = 1/2 V1 + 1/2 V2 v smeri vektorja pravokotnega na V2-V1

%razpolovišča
V12 = 1/2 * (V1 + V2);
V13 = 1/2 * (V1 + V3);
V23 = 1/2 * (V2 + V3);


r21 = V2-V1;
n12 = null(r21(:)')';
bar1 = vectorbary(n12, T);
r32 = V3-V2;
n23=null(r32(:)')'
bar2 = vectorbary(n23,T);
r31 = V3-V1;
n31=null(r31(:)')'
bar3 = vectorbary(n31,T);

%točka (2,2,1)
B(2,3)=8/15*1/bar1(3)*dot(Df(V12(1), V12(2)),n12)-1/6*(B(2,1)+4*B(2,2)+4*B(2,4)+B(2,5))-1/6*bar1(1)/bar1(3)*(B(1,1)+4*B(1,2)+6*B(1,3)+4*B(1,4)+B(1,5))-1/6*bar1(2)/bar1(3)*(B(1,6)+4*B(1,5)+6*B(1,4)+4*B(1,3)+B(1,2));
%točka (2,1,2)
B(3,3)=8/15*1/bar2(1)*dot(Df(V23(1), V23(2)),n23)-1/6*(B(1,5)+4*B(2,4)+4*B(4,2)+B(5,1))-1/6*bar2(2)/bar2(1)*(B(1,6)+4*B(2,5)+6*B(3,4)+4*B(4,3)+B(5,2))-1/6*bar2(3)/bar2(1)*(B(6,1)+4*B(5,2)+6*B(4,3)+4*B(3,4)+B(2,5));
%točka (1,2,2)
B(3,2)=8/15*1/bar3(2)*dot(Df(V13(1), V13(2)),n31)-1/6*(B(1,2)+4*B(2,2)+4*B(4,2)+B(5,2))-1/6*bar3(1)/bar3(2)*(B(1,1)+4*B(2,1)+6*B(3,1)+4*B(4,1)+B(5,1))-1/6*bar3(3)/bar3(2)*(B(6,1)+4*B(5,1)+6*B(4,1)+4*B(3,1)+B(2,1));

B=B;
end