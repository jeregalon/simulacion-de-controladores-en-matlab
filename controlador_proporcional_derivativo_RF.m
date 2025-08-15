% Tiene la forma:
% Gc(jw) = Kc * (Td * s + 1) -> Frecuencia de esquina en 1 / Td
%
% 1 / Td tiene que estar alrededor de la frecuencia de cruce del sistema
% que voy a compensar
%
% Si se coloca antes: Se mejora la sensibilidad y amplía el ancho de banda
%
% Si se coloca después: Se puede mejorar la estabilidad relativa
%
% Ejemplo 9.1 Ogata 3ra edición
%
g = tf(4, [1 2 0]);
% se quiere Kv = 20, MF de al menos 50 y MG de al menos 10
% K = 10 para cumplir con requisito de estado estacionario
[gm, pm, wgm, wpm] = margin(10*g)
margin(10*g);
pause
% frecuencia de cruce en 6.17
Td = 1/10;
gc = tf([Td 1], 1);
margin(10*g*gc);
% el MF da 50.6 y el MG da infinito. Se cumplen los requisitos de la RF
