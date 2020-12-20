function B = argyris (T ,f ,Df , Hf ) 
% Opis :
% argyris izračuna Bezierjeve ordinate polinoma dveh
% spremenljivk stopnje 5 , ki interpolira vrednosti , prve in
% druge odvode podane funkcije f v ogliščih trikotnika ter
% odvode funkcije f v središčih stranic trikotnika v smeri ,
% pravokotni na stranico
%
% Definicija :
% B = argyris (T,f,Df ,Hf)
%
% Vhodni podatki :
% T tabela velikosti 3 x 2 , v kateri vsaka vrstica
% predstavlja oglišče trikonika , nad katerim je
% definiran polinom ,
% f funkcija , ki jo interpoliramo ,
% Df gradient funkcije , ki jo interpoliramo ,
% Hf Hessejeva matrika funkcije , ki jo interpoliramo
%
% Izhodni podatek :
% B matrika velikosti 6 x 6 , ki predstavlja koeficiente
% polinoma dveh spremenljivk stopnje 5 v Bezierjevi
% obliki

V1=T(1,:);
V2=T(2,:);
V3=T(3,:);

x1=T(1,1);
y1=T(1,2);
x2=T(2,1);
y2=T(2,2);
x3=T(3,1);
y3=T(3,2);

fV1=f(x1,y1);
fV2=f(x2,y2);
fV3=f(x3,y3);
%izračunajmo najprej domenske točke, nato vrednost polinoma

B=NaN(6,6);

B(1,1)=fV1;
B(1,6)=fV2;
B(6,1)=fV3;

DFV1=Df(x1,y1);
DFV2=Df(x2,y2);
DFV3=Df(x3,y3);
HFV1=Hf(x1,y1);
HFV2=Hf(x2,y2);
HFV3=Hf(x3,y3);

B(1,2)=fV1+1/5*dot(DFV1,V2-V1);
B(2,1)=fV1+1/5*dot(DFV1,V3-V1);
B(1,5)=fV2+1/5*dot(DFV2,V1-V2);
B(2,5)=fV2+1/5*dot(DFV2,V3-V2);
B(5,1)=fV3+1/5*dot(DFV3,V1-V3);
B(5,2)=fV3+1/5*dot(DFV3,V2-V3);

B(1,3)=fV1+2/5*dot(DFV1,V2-V1)+1/20*dot(V2-V1,(V2-V1)*HFV1);
B(3,4)=fV2+2/5*dot(DFV2,V3-V2)+1/20*dot(V3-V2,(V3-V2)*HFV2);
B(4,1)=fV3+2/5*dot(DFV3,V1-V3)+1/20*dot(V3-V1,(V3-V1)*HFV3);

B(2,2)=fV1+1/5*dot(DFV1,V2-V1)+1/5*dot(DFV1,V3-V1)+1/20*dot(V3-V1,(V2-V1)*HFV1);
B(2,4)=fV2+1/5*dot(DFV2,V3-V2)+1/5*dot(DFV2,V1-V2)+1/20*dot(V1-V2,(V3-V2)*HFV2);
B(4,2)=fV3+1/5*dot(DFV3,V1-V3)+1/5*dot(DFV3,V2-V3)+1/20*dot(V2-V3,(V1-V3)*HFV3);

B(3,1)=fV1+2/5*dot(DFV1,V3-V1)+1/20*dot(V3-V1,(V3-V1)*HFV1);
B(1,4)=fV2+2/5*dot(DFV2,V1-V2)+1/20*dot(V1-V2,(V1-V2)*HFV2);
B(4,3)=fV3+2/5*dot(DFV3,V2-V3)+1/20*dot(V2-V3,(V2-V3)*HFV3);

vi12 = V2-V1;
n12 = null(vi12(:)');
vi23 = V3-V2;
n23 =null(vi23(:)');
vi31= V3-V1;
n31=null(vi31(:)');

bar1 = vectorbary(n12',T);
bar2 = vectorbary(n23',T);
bar3 = vectorbary(n31',T);


%razpolovišča stranice trikotnika
vi1 = 1/2*(V2+V1);
vi2 = 1/2*(V3+V2);
vi3= 1/2*(V3+V1);

DF1=Df(vi1(1),vi1(2));
DF2=Df(vi2(1),vi2(2));
DF3=Df(vi3(1),vi3(2));

%točka (2,2,1)
B(2,3)=8/15*1/bar1(3)*dot(DF1,n12)-1/6*(B(2,1)+4*B(2,2)+4*B(2,4)+B(2,5))-1/6*bar1(1)/bar1(3)*(B(1,1)+4*B(1,2)+6*B(1,3)+4*B(1,4)+B(1,5))-1/6*bar1(2)/bar1(3)*(B(1,6)+4*B(1,5)+6*B(1,4)+4*B(1,3)+B(1,2));
%točka (2,1,2)
B(3,3)=8/15*1/bar2(1)*dot(DF2,n23)-1/6*(B(1,5)+4*B(2,4)+4*B(4,2)+B(5,1))-1/6*bar2(2)/bar2(1)*(B(1,6)+4*B(2,5)+6*B(3,4)+4*B(4,3)+B(5,2))-1/6*bar2(3)/bar2(1)*(B(6,1)+4*B(5,2)+6*B(4,3)+4*B(3,4)+B(2,5));
%točka (1,2,2)
B(3,2)=8/15*1/bar3(2)*dot(DF3,n31)-1/6*(B(1,2)+4*B(2,2)+4*B(4,2)+B(5,2))-1/6*bar3(1)/bar3(2)*(B(1,1)+4*B(2,1)+6*B(3,1)+4*B(4,1)+B(5,1))-1/6*bar3(3)/bar3(2)*(B(6,1)+4*B(5,1)+6*B(4,1)+4*B(3,1)+B(2,1));

B=B