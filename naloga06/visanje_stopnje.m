B = [0 0; 2 6; 3 0; 5 4; 7 1; 5 5; 10 6];
B3 = bezierelv(B,3);
B10 = bezierelv(B, 10);
B30 = bezierelv(B, 30);

t = [0:0.001:1];

%bezierjeva krivulja s poligonom
plotbezier(B, t);
hold on

%B3
plot(B3(:,1), B3(:,2),'-o')
hold on

%B10
plot(B10(:,1), B10(:,2),'-o')
hold on

%B30
plot(B30(:,1), B30(:,2),'-o')
hold on