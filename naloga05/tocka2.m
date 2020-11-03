B = [0 0; 2 3; 4 2; 5 -1];
s = 0.5;
t =[0:0.001:1];

plotbezier(B,t);
hold on

%kontrolne točke subdivizije:

k1=1;
BS1 = beziersubk(B,s,k1);
tocke1 = [];
for i = 1:length(BS1)
    tocke1 = [tocke1; BS1{i}];
end
plot(tocke1(:,1),tocke1(:,2), '-o');
hold on


k2=2;
BS2 = beziersubk(B,s,k2);
tocke2 = [];
for i = 1:length(BS2)
    tocke2 = [tocke2; BS2{i}];
end
plot(tocke2(:,1),tocke2(:,2),'-o');
hold on



k3=3;
BS3 = beziersubk(B,s,k3);
tocke3 = [];
for i = 1:length(BS3)
    tocke3 = [tocke3; BS3{i}];
end
plot(tocke3(:,1),tocke3(:,2), '-o');
hold on
