%% Newtons metod
clear all
format long

% Funktion som anges i uppgiften
f = @(x) x^2 - 3;
% Derivata
df = @(x) 2 * x;

% Gissning (anges ofta)
x = 0.5;
% Till�tet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   old_x = x;
   x = x - f(x) / df(x);
   % Felet �r den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("L�sningen �r %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

%% Sekantmetoden
clear all
format long

% Funktion som anges i uppgiften
f = @(x) x^2 - 3;
% Derivata
df = @(x) 2 * x;

% x0 och x1 (anges ofta)
old_x = 0;
x = 0.5;
% Till�tet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   temp = x;
   x = x - f(x) * (x - old_x) / (f(x) - f(old_x));
   old_x = temp;
   % Felet �r den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("L�sningen �r %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

%% Hybridmetoden (mittpunktsformeln)
clear all
format long

% Funktion som anges i uppgiften
f = @(x) x^2 - 3;
% Gr�nser inom vilka funktionen har en l�sning (anges ofta)
a = 0;
b = 3;

% Gissning
x = 0;
% Till�tet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   old_x = x;
   % Gissningen �r mittpunkten i intervallet
   x = (a + b) / 2;
   % Avgr�nsa s�kningen till det nya intervallet
   if f(x) < 0
       a = x;
   else
       b = x;
   end
   % Felet �r den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("L�sningen �r %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

%% Fixpunktiteration
clear all
format long

% Funktioner som anges i uppgiften
f = @(x) x^2 - 3;
g = @(x) x - f(x) / 5;

% Gissning
x = 0;
% Till�tet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   old_x = x;
   x = g(x);
   % Felet �r den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("L�sningen �r %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

%% Minstakvadratmetoden
clear all
format long
clf

% Givna punkter fr�n uppgiften
x = [-2 -1.1 -0.3 0 0.7 2.3];
y = [4.9 3.2 -1.1 -1.8 -0.2 0.8];

% Best�m polynom av grad 3 - skapa matris A
A = [x'.^3, x'.^2, x'.^1, x'.^0];

% QR-faktorisera A
[Q R] = qr(A);

% Koefficienter (R^-1 * Q' * b)
c = R\Q'*y';

% Skapa polynom
p = @(x) polyval(c, x);

hold on
scatter(x, y);
fplot(p, [x(1), x(end)]);
hold off

%% Newtons metod f�r system
clear all
format long

% Funktion som anges i uppgiften
f1 = @(x1, x2, x3) x1^2 - 3 * x2 + x3;
f2 = @(x1, x2, x3) x1 + 2 * x2;
f3 = @(x1, x2, x3) x2 + 3 * x3;

% Jacobimatris (populeras manuellt)
J = @(x1, x2, x3) [2 * x1, -3, 1; 1, 2, 0; 1, 0, 3];

% Gissning som kolonnvektor (anges ofta)
X = [0.5; 0.5; 0.5];
% Till�tet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   % En kolonnvektor d�r varje rad f�r v�rdet fr�n motsvarande funktion
   F = [f1(X(1), X(2), X(3)); f2(X(1), X(2), X(3)); f3(X(1), X(2), X(3))];
   Y = J(X(1), X(2), X(3))\-F;
   X = X + Y;
   error = norm(Y);
end

fprintf("L�sningarna �r x1=%f, x2=%f, x3=%f\n", X(1), X(2), X(3));
fprintf("Kontroll: f1(x1, x2, x3) = %f, borde vara 0\n", f1(X(1), X(2), X(3)));
fprintf("Kontroll: f2(x1, x2, x3) = %f, borde vara 0\n", f2(X(1), X(2), X(3)));
fprintf("Kontroll: f3(x1, x2, x3) = %f, borde vara 0\n", f3(X(1), X(2), X(3)));


%% Polynominterpolation - Newtons form (vander)
clear all
format long

% Angiven funktion
f = @(x) x + sin(x) - 1;
% Intervall (ofta angivet)
a = -5;
b = 5;

X = linspace(a, b, 10)';
Y = f(X')';

% L�s efter koefficienter med vander
values = vander(X)\Y;

% Alternativt skrivs�tt (b�r redovisas i svar):
% p = @(x) values(1, 1)*x^9 + values(2, 1)*x^8 + values(3, 1)*x^7 + values(4, 1)*x^6 + values(5, 1)*x^5 + values(6, 1)*x^4 + values(7, 1)*x^3 + values(8, 1)*x^2 + values(9, 1)*x + values(10, 1);
p = @(x) polyval(values, x);

clf
hold on
fplot(f);
scatter(X, Y);
fplot(p, [a, b]);
hold off

fprintf("Kontroll: p(3)=%f, borde vara %f\n", p(3), f(3));

%% Polynominterpolation - Lagranges form
clear all
format long
clf

% Given funktion
f = @(x) x.^3;
% Givna x-v�rden (x0, x1, x2, x3)
X = [-1, 0, 1, 2];
% Given grad
n = 3;

% T�ljaren x minus alla punkter f�rutom den vi granskar
% med L3,0 menas grad 3, punkt 0. Med Li menas produkten av alla kvoter,
% f�rutom den vi granskar
% N�mnaren blir f�r varje punkt

L0 = @(x) ((x - X(2)) * (x - X(3)) * (x - X(4))) / ((X(1) - X(2)) * (X(1) - X(3)) * (X(1) - X(4)));
L1 = @(x) ((x - X(1)) * (x - X(3)) * (x - X(4))) / ((X(2) - X(1)) * (X(2) - X(3)) * (X(1) - X(4)));
L2 = @(x) ((x - X(1)) * (x - X(2)) * (x - X(4))) / ((X(3) - X(1)) * (X(3) - X(2)) * (X(3) - X(4)));
L3 = @(x) ((x - X(1)) * (x - X(2)) * (x - X(3))) / ((X(4) - X(1)) * (X(4) - X(2)) * (X(4) - X(3)));

p3 = @(x) f(X(1)) * L0(x) + f(X(2)) * L1(x) + f(X(3)) * L2(x) + f(X(4)) * L3(x);

% Kontroll: rita ut b�da. B�r vara v�ldigt lika
hold on
fplot(p3, [-1, 2]);
fplot(f, [-1, 2]);
hold off

%% Splineinterpolation - r�tta randvillkor (clamped boundaries)
clear all
format long
clf

% Funktion fr�n uppgift
y = @(x) 2 * x + 3 .* sin(x * 2);
% Derivata
dy = @(x) 2 + 3 / 2 .* cos(x * 2);

% Intervall (ofta given)
a = 0;
b = 5;
% Alla steg (50 kontrollpunkter f�r spline)
x = linspace(0, 5, 50);
yval = y(x')';

% Intervall x, derivata f�r f�rsta v�rdet, intervall y, derivata f�r sista
% v�rdet
pp = spline(x, [dy(x(1)), yval, dy(x(end))]);
S = @(x) ppval(pp, x);

hold on
scatter(x, yval);
fplot(S, [a, b]);
hold off

%% Trapetsregeln
clear all
format long

% Funktion angiven i uppgiften
f = @(x) x.^3 + x.^2 - 3;

% Intervall (given i uppgiften)
a = 0;
b = 5;
% Antal intervall (ofta given)
n = 25;

% Stegl�ngden
h = (b - a) / n;

I = 0;
for i = 0:n-1
    a_ = a + i * h;
    b_ = a + (i + 1) * h;
    I = I + (b_ - a_) / 2 * (f(a_) + f(b_));
end

fprintf("V�rdet �r %f. Borde vara %f\n", I, quad(f, a, b));

%% Simpsons regel
clear all
format long

% Funktion angiven i uppgiften
f = @(x) x.^3 + x.^2 - 3;

% Intervall (given i uppgiften)
a = 0;
b = 10;
% Antal intervall (ofta given)
n = 25;

% Stegl�ngden
h = (b - a) / n;

I = 0;
for i = 0:n-1
    a_ = a + i * h;
    b_ = a + (i + 1) * h;
    I = I + (b_ - a_) / 6 * (f(a_) + 4 * f((a_ + b_) / 2) + f(b_));
end

fprintf("V�rdet �r %f. Borde vara %f\n", I, quad(f, a, b));

%% Trapetsformeln
clear all
format long

% Funktion angiven i uppgiften
f = @(x) x.^3 + x.^2 - 3;

% Intervall (given i uppgiften)
a = 0;
b = 10;

% Stegl�ngden (ofta given)
h = 0.25;

I = f(a) / 2;
for x = a+h:h:b-h
    I = I + f(x);
end
I = I + f(b) / 2;
I = I * h;

fprintf("V�rdet �r %f. Borde vara %f\n", I, quad(f, a, b));

%% Simpsons formel
clear all
format long

% Funktion angiven i uppgiften
f = @(x) x.^3 + x.^2 - 3;

% Intervall (given i uppgiften)
a = 0;
b = 10;

% Stegl�ngden (ofta given)
h = 0.25;
% Iterationer
n = (b - a) / h;

I = f(a);
i = 0;
for x = a+h:h:b-h
    if mod(i, 2) == 0
       I = I + 4 * f(x);
    else
       I = I + 2 * f(x); 
    end
    i = i + 1;
end
I = I + f(b);
I = I * h / 3;

fprintf("V�rdet �r %f. Borde vara %f\n", I, quad(f, a, b));

%% Klassisk Runge-Kuttas metod
clear all
format long

% Derivata given i uppgiften
dy = @(x, y) x .* sin(x .* cos(y)) - y;

% Fr�n formelbladet
A = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0];
C = [0; 1/2; 1/2; 1];
B = [1/6; 2/6; 2/6; 1/6];
s = 4;

% Initiera k (kolonnvektor)
K = [0; 0; 0; 0];

% Intervall (ofta givet)
a = 0;
b = 3;

% Antal steg (ofta givet)
n = 100;
% Stegl�ngd
h = (b - a) / n;

% Alla punkter inom intervallet med stegl�ngd h
x = a:h:b;

% Startv�rden (ofta givet)
y = [2.5];

for k = 1:length(x)-1
   for j = 1:s
       K(j) = dy(x(k) + h * C(j), y(k) + h * A(j,:) * K);
   end
   y(k + 1) = y(k) + h * B' * K;
end

% Spline-interpolation (clamped boundary, "r�tta randvillkor")
% Intervall x, derivata f�r f�rsta v�rdet, intervall y, derivata f�r sista
% v�rdet
pp = spline(x, [dy(x(1), y(1)), y, dy(x(end), y(end))]);
S = @(x) ppval(pp, x);

hold on
scatter(x, y);
fplot(S, [0, 3]);
hold off

fprintf("y(1) = %f, y(2) = %f, y(3) = %f\n", S(1), S(2), S(3));

%% QR-faktorisering med Gram-Schmidts

% Matris fr�n uppgift
A = [1 3 0 5; -7 2 8 -1; 4 16 9 1; 13 0 1 6; 7 5 3 1];

% Kolonner fr�n matrisen A
a1 = A(:,1);
a2 = A(:,2);
a3 = A(:,3);
a4 = A(:,4);

proj = @(u, a) (a' * u) / norm(u)^2 * u;

u1 = a1;
u2 = a2 - proj(u1, a2);
u3 = a3 - proj(u1, a3) - proj(u2, a3);
u4 = a4 - proj(u1, a4) - proj(u2, a4) - proj(u3, a4);

Q = [u1 / norm(u1), u2 / norm(u2), u3 / norm(u3), u4 / norm(u4)];
R = Q' * A;

% Kontroll: QR = A
A_hat = Q * R;

%% LU-faktorisering
clear all
format long

A1 = [2 -4 4 -2; 6 -9 7 -3; -1 -4 8 0];
% Utg� fr�n identitetsmatrisen och anv�nd den f�rsta raden f�r att f� bort
% den v�rden i den f�rsta kolonnen
E1 = [1 0 0; -3 1 0; 0.5 0 1];
% Utf�r samma ber�kningar p� identitetsmatrisen
l1 = E1 * eye(3);
% L�t vektorn vara f�rsta kolonnen i matrisen
l1 = l1(:,1);

A2 = E1 * A1;
% Utg� fr�n identitetsmatrisen och anv�nd den andra raden f�r att f� bort
% den v�rden i den andra kolonnen
E2 = [1 0 0; 0 1 0; 0 2 1];
l2 = E2 * eye(3);
% L�t vektorn vara andra kolonnen i matrisen
l2 = l2(:,2);

A3 = E2 * A2;
% N�gorlunda on�digt h�r, men det �r f�r att visa den interativa processen
E3 = [1 0 0; 0 1 0; 0 0 1];
l3 = E1 * eye(3);
% L�t vektorn vara tredje kolonnen i matrisen
l3 = l3(:,3);

U = A3;
L = [l1 l2 l3];

% Kontroll (b�r vara lika):
A1
L * U

%% LU-faktorisering med partiell pivotering
clear all
% Skriv ut som br�k
format rat

% Koefficienter fr�n system i uppgiften
A = [2 1 -1 8; 1 -3 4 -7; 3 6 -2 8; -7 1 -1 -2];
% "y-v�rden" f�r system i uppgiften
b = [1; -3; 12; 19];
% Sammansatt matris vi kan gausseliminera
T = [A b];

% En matris som h�ller koll p� vilka skaleringar vi gjort
% Det element vi vill "nolla" blir 
M = zeros(4);

% Partiell pivotering -> �versta raden ska vara den som har h�gst
% absolutbelopp f�r n�gon av v�rdena. Byt d�rf�r rad 1 och 4
temp = T(4,:);
T(4,:) = T(1,:);
T(1,:) = temp;

% "Nolla" andra raden, f�rsta elementet, dela med pivot-elementet (st�rsta
% absolutv�rdet)
M(2, 1) = T(2, 1) ./ T(1, 1);
M(3, 1) = T(3, 1) ./ T(1, 1);
M(4, 1) = T(4, 1) ./ T(1, 1);

% Utf�r �ndringen
for i = 2:4
   T(i, :) = T(i, :) - M(i, 1) .* T(1, :);
end

% Utf�r pivotering p� resten av matrisen (rad 2 - 4). Utf�r d�rf�r radbyte
% med rad tv� och tre
temp = T(2,:);
T(2,:) = T(3,:);
T(3,:) = temp;

% "Nolla" tredje raden, andra kolonnen, dela med pivot-elementet (st�rsta
% absolutv�rdet)
M(3, 2) = T(3, 2) ./ T(2, 2);
M(4, 2) = T(4, 2) ./ T(2, 2);

% Utf�r �ndringen
for i = 3:4
   T(i,:) = T(i,:) - M(i, 2) .* T(2, :);
end

% "Nolla" fj�rde raden, tredje kolonnen, dela med pivot-elementet (st�rsta
% absolutv�rdet)
M(4, 3) = T(4, 3) ./ T(3, 3);

% Utf�r �ndringen
T(4,:) = T(4,:) - M(4, 3) .* T(3, :);

% L�s matrisen med �tersubstitution
X = [0; 0; 0; 0];
X(4) = T(4, 5) ./ T(4, 4);
X(3) = (T(3,5) - T(3, 4) .* X(4)) ./ T(3, 3);
X(2) = (T(2, 5) - T(2, 4) .* X(4) - T(2, 3) .* X(3)) ./ T(2, 2);
X(1) = (T(1, 5) - T(1, 4) .* X(4) - T(1, 3) .* X(3) - T(1, 2) .* X(2)) ./ T(1, 1);

% L�sning
X

% Kontroll A*'x = b:
A * X
b

%% LU-faktorisering med partiell pivotering (alternativ)
clear all
format long

A1 = [1 5 4; 2 0.5 1; 5 2 -3];

% Flytta upp den rad med st�rst absolutbelopp till f�rsta raden
temp = A1(1,:);
A1(1,:) = A1(3,:);
A1(3,:) = temp;
% Utf�r samma radbyte p� permutationsmatrisen
P1 = eye(size(A1));
temp = P1(1,:);
P1(1,:) = P1(3,:);
P1(3,:) = temp;

% Utg� fr�n identitetsmatrisen, f� nollor under diagonalen i f�rsta
% kolonnen
E1 = [1 0 0; -0.4 1 0; -0.2 0 1];
l1 = E1 * eye(3);
l1 = l1(:,1);
A2 = E1 * A1;

% Flytta upp den rad med st�rst absolutbelopp till andra raden
temp = A2(2,:);
A2(2,:) = A2(3,:);
A2(3,:) = temp;
% Utf�r samma radbyte p� permutationsmatrisen
P2 = eye(size(A1));
temp = P2(2,:);
P2(2,:) = P2(3,:);
P2(3,:) = temp;

% Utg� fr�n identitetsmatrisen, f� nollor under diagonalen i f�rsta
% kolonnen
E2 = [1 0 0; 0 1 0; 0 0.3/4.6 1];
l2 = E2 * eye(3);
l2 = l2(:,2);
A3 = E2 * A2;

% N�got on�digt, men fullf�ljer hur vi skrivit innan
E3 = [1 0 0; 0 1 0; 0 0 1];
l3 = E3 * eye(3);
l3 = l3(:,3);

L = [l1 l2 l3]
U = A3
% Observera ordningen
P = P2 * P1

% Kontroll: PA=LU
P * A1 - L * U

% Kontroll 2:
[L U P] = lu(A1);
L
U
P

%% Potensmetoden ("st�rsta" egenv�rdet)
clear all
format long

% Matris som anges i uppgiften
A = [3 1 5; 4 1 2; 2 1 7];

% Gissning x (obs. normaliserad)
X = [0.5; 0.5; 0.5];
X = X / norm(X);

% Till�tet fel (anges ofta)
epsilon = 1e-12;
error = 1e100;

while error > epsilon
    old_X = X;
    Y = A * X;
    X = Y / norm(Y);
    error = norm(old_X - X);
end

% Ber�kna egenv�rdet - obs. st�r ej i formelsamling
e = X' * A * X;

% Kontroll: finns med i eig(A) (b�r vara det st�rsta v�rdet)
eig(A)
fprintf("Egenv�rdet med det st�rsta absolutbeloppet �r %f\n", e);

%% Invers iteration ("minsta" egenv�rdet)
clear all
format long

% Matris som anges i uppgiften
A = [3 1 5; 4 1 2; 2 1 7];

[L, U, P] = lu(A);

% Gissning (obs. normerad)
X = [0.5; 0.5; 0.5];
X = X / norm(X);

% Till�tet fel (anges ofta)
epsilon = 1e-12;
error = 1e100;

while error > epsilon
    old_X = X;

    Z = L \ P * X;
    Y = U \ Z;
    X = Y / norm(Y);
    
    error = norm(old_X - X);
end

% Ber�kna egenv�rdet - obs. st�r ej i formelsamling
e = X' * A * X;

% Kontroll: finns med i eig(A) (b�r vara det st�rsta v�rdet)
eig(A)
fprintf("Egenv�rdet med det minsta absolutbeloppet �r %f\n", e);

%% Invers iteration med skift
clear all
format long

% Matris som anges i uppgiften
A = [3 1 5; 4 1 2; 2 1 7];
% Givet skift (om �vriga egenv�rden har hittats kan de anv�ndas som skift)
% Vanligtvis f�r man testa lite olika v�rden f�r att se vad som ger ett
% tidigare ok�nt egenv�rde
sigma = 1;

% Identitetsmatris med samma dimension som A
I = eye(size(A));
AA = A - sigma * I;

% Gissning (obs. normerad)
X = [0.5; 0.5; 0.5];
X = X / norm(X);

% Till�tet fel (anges ofta)
epsilon = 1e-5;
error = 1e100;

while error > epsilon
    old_X = X;

    [L, U, P] = lu(AA);
    
    Z = L \ P * X;
    Y = U \ Z;
    X = Y / norm(Y);
    sigma = X' * AA * X;
    
    error = norm(old_X - X);
end

% Ber�kna egenv�rdet - obs. st�r ej i formelsamling
e = X' * A * X;

% Kontroll: finns med i eig(A) (b�r vara det st�rsta v�rdet)
eig(A)
fprintf("Egenv�rdet �r %f\n", e);

%% QR-iteration

clear all
format long

% Matris som anges i uppgiften
A = [3 1 5; 4 1 2; 2 1 7];
L = A;
for i = 1:5
   [Q, R] = qr(L); 
   L = R * Q;
end

eig_a = L(1, 1);
eig_b = L(2, 2);
eig_c =L(3, 3);

% Kontroll: diagonalen av L b�r vara egenv�rdena
e = [eig_a; eig_b; eig_c]
eig(A)

%% Eulers fram�tmetod

% Derivata fr�n uppgift
dy = @(x, y) 3 * (y - x^2 + 3)^(2 / 3) + 2 * x;

% Intervall fr�n uppgift
a = 1;
b = 5;

% Stegl�ngd fr�n uppgift
h = 1;

% Startv�rde (angiven i uppgift)
y = -1;

% Approximativa v�rden f�r x och y(x)
X = [];
Y = [];

for x = a:h:b
   X = [X, x];
   Y = [Y, y];
   y = y + h * dy(x, y);
end

clf
scatter(X, Y);