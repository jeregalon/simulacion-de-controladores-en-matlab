% Obligatorio para sistemas que requieran cero error en estado estable ante
% entrada paso
%
% Se coloca el cero lo suficientemente alejado hacia el origen del menor de
% los polos de la planta
%
% Ejemplo:
g=tf(4500,[1 360 0]);
% Se desea 1/Ka < 0.2 y Mp ~ 10%
%
%                         Ki          4500
% Ka = lim  S^2 * ( Kp + ---- ) * -------------- > 5
%      S->0               S        S * (S + 360)
%
% Ki > 0.4
%
Z=13;
gc=tf([1 Z], [1 0]);
rlocus(g*gc);
sgrid(0.8, 1000);
Kp = input('Inserte Kp: ');
lc = feedback(Kp*g*gc, 1);
% Da con Kp = 0.5
step(lc);