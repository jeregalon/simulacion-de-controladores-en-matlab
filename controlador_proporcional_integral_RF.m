% Tiene esta forma:
%            Kc * (Ti * s + 1)
% Gc(jw) = --------------------
%                 Ti * s
%
% Frecuencia de esquina en 1 / Ti. Tiene que ser 10 veces menor que la
% frecuencia de cruce nueva
%
% La atenuación que da es - 20 log (Kc)
%
% Ejemplo 9.2 Ogata 3ra edición
%
g=tf(5,conv([1 1 0], [0.5 1]))
% se quiere MF de al menos 40 y MG de al menos 10
[gm, pm, wgm, wpm] = margin(5*g)
margin(g);
pause
%
% Hallando la frecuencia de cruce nueva:
mfd = 40;
mseg = 12;
fase_wcn = -180 + mfd + mseg
wcn = input('Inserte frecuencia de cruce nueva: ');
atenuac = input('nueva atenuación: ');
Kc=10^(-atenuac/20);
Ti = 10/wcn;
%
% Graficando
gc = tf(Kc*[Ti 1], [Ti 0]);
margin(g*gc);
% Se obtiene MF = 46 y MG = 14.4
