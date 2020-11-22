function B = beziercubspline(u,D)
% Opis:
%  beziercubspline izracuna sestavljeno Bezierjevo krivuljo
%  stopnje 3, ki je dvakrat zvezno odvedljiva v stikih
%
% Definicija:
%  B = beziercubspline(u,D)
%
% Vhodna podatka:
%  u    seznam parametrov delitve dolzine m+1,
%  D    matrika, v kateri vsaka izmed m+3 vrstic predstavlja
%       eno kontrolno tocko sestavljene krivulje
%
% Izhodni podatek:
%  B    seznam dolzine m, v kateri je vsak element matrika s
%       stirimi vrsticami, ki dolocajo kontrolne tocke kosa
%       sestavljene krivulje
[m,d] = size(D);
m = m - 3;  %m = 4 pri kubičnih C2 zlepkih s podanimi 7 točkami

B0=zeros(4,d);
B1=zeros(4,d);
B2=zeros(4,d);
B3=zeros(4,d);
B4=zeros(4,d);

%diference parametra u v seznamu
dif = diff(u);

%začetne robne toèke
B0(1,:) = D(1,:); %b_0 = d_-1
B0(2,:) = D(2,:); %b_1 = d_0
B0(3,:) = dif(2)/(dif(1)+dif(2))*D(2,:) + dif(1)/(dif(1)+dif(2))*D(3,:); 

%končne robne točke:
B4(4,:) = D(end,:); %b_3(m)=d_(m+1) 
B4(3,:) = D(end - 1,:);
B4(2, :) = dif(m)/(dif(m-1)+dif(m))*D(end-2,:) + dif(m-1)/(dif(m-1)+dif(m))*D(end-1,:);

B = {B0, B1, B2, B3, B4};

%vmesne točke:
for i = 1:(m-2)
    B{i+1}(2,:) = (dif(i+1)+dif(i+2))/(dif(i)+dif(i+1)+dif(i+2))*D(i+2,:) + (dif(i))/(dif(i)+dif(i+1)+dif(i+2))*D(i+3,:);
    B{i+1}(3,:) = (dif(i+2))/(dif(i)+dif(i+1)+dif(i+2))*D(i+2,:) + (dif(i)+dif(i+1))/(dif(i)+dif(i+1)+dif(i+2))*D(i+3,:);
end

for i =1:(m-1)
    B{i}(4,:) = dif(i+1)/(dif(i)+dif(i+1))*B{i}(3,:) + dif(i)/(dif(i)+dif(i+1))*B{i+1}(2,:);
    B{i+1}(1,:) = dif(i+1)/(dif(i)+dif(i+1))*B{i}(3,:) + dif(i)/(dif(i)+dif(i+1))*B{i+1}(2,:);
end

B;  
    
end