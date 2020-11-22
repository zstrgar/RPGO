%naloga 10
B = [1 0; 1 4; -3 2; -3 -2; 1 -4; 1 0];
w = [1; 1/5; 1/5; 1/5; 1/5; 1];

%dvig na 6
[B6,w6] = rbezierelv(B,w);

%dvig na 7 (uporabim kar B in w iz dviga na 6)
[B7,w7] = rbezierelv(B6,w6);

%grafki
t = [0:0.01:1];
%racionalna B. pete stopnje:
plotrbezier(B,w,t);
hold on
plotrbezier(B6, w6, t);
hold on
plotrbezier(B7, w7, t);
hold on

%niti približno niso take kot na pdfju :(
