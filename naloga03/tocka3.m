B = [-2/3 -4/5; 
    1/3 1/5; 
    0 0; 
    -1/3 1/5; 
    2/3 -4/5];

t =[0:0.001:1];

%Bezierjeva krivulja s kontrolnimi točkami B
plotbezier(B,t);


%1. odvod Bezierjeve krivulje
plotbezier(bezierCPder(B,1),t);
hold on
hold off

%2. odvodd Bezierjeve krivulje
plotbezier(bezierCPder(B,2),t);



