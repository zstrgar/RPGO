B = [0 0; 2 3; 5 0; 3 -1; 2 -1];
w = [0.5 0.7 0.8 1 0.6];
t=linspace(0,1,1000);

%Primerjava Farinovih točk pri spreminjanju določene uteži

b=rdecasteljau(B,w,0.5);


%1. osnovna:
plotrbezier(B,w,t);


%2. w1 = 2
w(2)=2;
plotrbezier(B,w,t);


%3. w1 = 0.2
w(2) = 0.2;
plotrbezier(B, w, t);