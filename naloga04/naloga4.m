%4. naloga
k=6;
fi=pi/k;           % kot določa krožni lok od (-fi, fi)
t = 0:0.001:1;
rotM = [cos(2*fi) -sin(2*fi); sin(2*fi) cos(2*fi)]; %rotacijska matrika

%===== 1. TOČKA =====
n = 2; %zato rabimo 3 kontrolne točke
b0 = [cos(fi), -sin(fi)];
b2 = [cos(fi), sin(fi)];
b1 = [1/cos(fi), 0];

B = [b0; b1; b2];    %bezierjeva krivulja s kontrolnimi točkami b0, b1, b2

%B cell
Bc = cell(1,k);     % cell matrik B-jev, v novi celici je nov B
for i=1:k
    Bc{i} = B;
    B = B*rotM;     % vsak nasldenji B mora biti pomnožen z rotacijsko
end

%Narišemo (ta krivulja je v resnici sestavljena iz k-delčkov)
for i = 1:length(Bc)
    plotbezier(Bc{i},t);
    hold on;
    daspect([1 1 1]);   %razmerje x:y=1:1
end

%radialna napaka
B1 = bezier(B,t);
napaka1 = max(abs(1- (B1(:,1).^2 + B1(:,2).^2 ).^(1/2)));


%====== 2. TOČKA  ======= 
n=3;    %zato rabimo 4 kontrolne točke
c0 = b0;
c3 = b2;
c1 = c0 + 1/3*[sin(fi),cos(fi)];
c2 = c3 - 1/3 *[-sin(fi),cos(fi)];

C = [c0; c1; c2; c3];

%C cell
Cc = cell(1,k);
for i=1:k
    Cc{i} = C;
    C = C*rotM;     
end

for i = 1:length(Cc)
    plotbezier(Cc{i},t);
    hold on;
    daspect([1 1 1]);
end

%radialna napaka
C1 = bezier(C,t);
napaka2 = max(abs(1- (C1(:,1).^2 + C1(:,2).^2 ).^(1/2)));



%==== 3. TOČKA  ====
d0 = b0;
d3 = b2;
d1 = 1/3*[4 - cos(fi), 4*cot(fi)-4/sin(fi) + sin(fi)];
d2 = 1/3*[4-cos(fi), -4*cot(fi) + 4/sin(fi) - sin(fi)];

D = [d0; d1; d2; d3];

%D cell
Dc = cell(1,k);
for i=1:k
    Dc{i} = D;
    D = D*rotM;     
end

for i = 1:length(Dc)
    plotbezier(Dc{i},t);
    hold on;
    daspect([1 1 1]);
end

%radialna napaka
D1 = bezier(D,t);
napaka3 = max(abs(1- (D1(:,1).^2 + D1(:,2).^2 ).^(1/2)));



