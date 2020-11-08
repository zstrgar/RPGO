P = [ -5 0; -2 -1; 0 3; 3 0; 7 -1];
ue = alphaparam(P,0);
uc = alphaparam(P, 0.5);
ut = alphaparam(P,1);

plot(ue, zeros(length(ue)), '-or');
hold on
plot(uc,ones(length(ue)), '-ob');
hold on
plot(ut,zeros(length(ue))+2, '-og');
hold on