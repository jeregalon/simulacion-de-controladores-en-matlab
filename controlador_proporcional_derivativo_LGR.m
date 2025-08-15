% El PD se puede usar en dos casos:
% 1- Hay requisito en estado estacionario
% 2- No hay
% Es genial para cuando se piden requisitos de la respuesta transitoria
%
% Paso 1: Colocar el cero 
% Paso 2: Compruebo la respuesta transitoria
% Paso 3: ¿Satisface? OK
% Paso 4: Si no satisface, volver al paso 1
%
%% Ejemplo sin requisito en estado estacionario:
%
g=tf(1,[0.08 1 0 0]);
% Se desea Mp < 25% y ts < 2 seg
Z=1;
gc=tf([1 Z], 1);
rlocus(g*gc);
sgrid(0.6, 100);
k=input('Inserte k: ');
lc=feedback(k*g*gc, 1);
step(lc);
% Con k = 8.11 cumple los requisitos
%
% La forma final del controlador quedaría así:
%
% Gc = 8.11 * (S + 1)
%
%% Ejemplo con requisito en estado estacionario
%
g=tf(1,[0.08 1 0 0]);
%
% Se desea Ka > 5
%                     Kp + Kd * S
% Ka = lim s^2 * --------------------- > 5
%      s->0       s^2 * (0.08 * S + 1)
%
% Kp > 5
%
% Escojo Kp = 6
%
% Escribo la función de transferencia de la forma 1 + Kd * GH(s) = 0
%           Kd * S
% 1 + ---------------------- = 0
%      0.08 * S^3 + S^2 + 6
%
ggc_Kd = tf([1 0], [0.08 1 0 6]);
rlocus(ggc_Kd);
sgrid(0.5, 100);
Kd = input('Inserte el valor de Kd: ');
gc=tf(Kd*[1 6/Kd], 1);
step(feedback(g*gc, 1));


