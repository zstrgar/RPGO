%4. naloga
k=6;
fi=pi/k; % kot določa krožni lok od (-fi, fi)
t = 0:0.001:1;
rotM = [cos(2*fi), -sin(2*fi); sin(2*fi), cos(2*fi)]; %rotacijska matrika

%===== 1. TOČKA =====
n = 2;
b0=[cos(fi), -sin(fi)];
b2 = [cos(fi), sin(fi)];
b1 = [1/cos(fi), 0];

B = [b0; b1; b2];

Bc=cell(1,k);

for i=1:k
    Bc{i}=B;
    B=B*rotM;
end


%krivulja
plotbezier(B,t)
