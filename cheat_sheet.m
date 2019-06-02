%% Newtons metod
clear all
format long

% Funktion som anges i uppgiften
f = @(x) x^2 - 3;
% Derivata
df = @(x) 2 * x;

% Gissning (anges ofta)
x = 0.5;
% Tillåtet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   old_x = x;
   x = x - f(x) / df(x);
   % Felet är den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("Lösningen är %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

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
% Tillåtet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   temp = x;
   x = x - f(x) * (x - old_x) / (f(x) - f(old_x));
   old_x = temp;
   % Felet är den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("Lösningen är %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

%% Hybridmetoden (mittpunktsformeln)
clear all
format long

% Funktion som anges i uppgiften
f = @(x) x^2 - 3;
% Gränser inom vilka funktionen har en lösning (anges ofta)
a = 0;
b = 3;

% Gissning
x = 0;
% Tillåtet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   old_x = x;
   % Gissningen är mittpunkten i intervallet
   x = (a + b) / 2;
   % Avgränsa sökningen till det nya intervallet
   if f(x) < 0
       a = x;
   else
       b = x;
   end
   % Felet är den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("Lösningen är %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

%% Fixpunktiteration
clear all
format long

% Funktioner som anges i uppgiften
f = @(x) x^2 - 3;
g = @(x) x - f(x) / 5;

% Gissning
x = 0;
% Tillåtet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   old_x = x;
   x = g(x);
   % Felet är den absolut differensen mellan den gamla och nya gissningen
   error = abs(old_x - x);
end

fprintf("Lösningen är %f. Kontroll: f(%f) = %f, borde vara 0\n", x, x, f(x));

%% Minstakvadratmetoden
clear all
format long
clf

% Givna punkter från uppgiften
x = [-2 -1.1 -0.3 0 0.7 2.3];
y = [4.9 3.2 -1.1 -1.8 -0.2 0.8];

% Bestäm polynom av grad 3 - skapa matris A
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

%% Newtons metod för system
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
% Tillåtet fel (anges ofta)
epsilon = 1e-12;

error = 1e100;
while error > epsilon
   % En kolonnvektor där varje rad får värdet från motsvarande funktion
   F = [f1(X(1), X(2), X(3)); f2(X(1), X(2), X(3)); f3(X(1), X(2), X(3))];
   Y = J(X(1), X(2), X(3))\-F;
   X = X + Y;
   error = norm(Y);
end

fprintf("Lösningarna är x1=%f, x2=%f, x3=%f\n", X(1), X(2), X(3));
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

% Lös efter koefficienter med vander
values = vander(X)\Y;

% Alternativt skrivsätt (bör redovisas i svar):
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
% Givna x-värden (x0, x1, x2, x3)
X = [-1, 0, 1, 2];
% Given grad
n = 3;

% Täljaren x minus alla punkter förutom den vi granskar
% med L3,0 menas grad 3, punkt 0. Med Li menas produkten av alla kvoter,
% förutom den vi granskar
% Nämnaren blir för varje punkt

L0 = @(x) ((x - X(2)) * (x - X(3)) * (x - X(4))) / ((X(1) - X(2)) * (X(1) - X(3)) * (X(1) - X(4)));
L1 = @(x) ((x - X(1)) * (x - X(3)) * (x - X(4))) / ((X(2) - X(1)) * (X(2) - X(3)) * (X(1) - X(4)));
L2 = @(x) ((x - X(1)) * (x - X(2)) * (x - X(4))) / ((X(3) - X(1)) * (X(3) - X(2)) * (X(3) - X(4)));
L3 = @(x) ((x - X(1)) * (x - X(2)) * (x - X(3))) / ((X(4) - X(1)) * (X(4) - X(2)) * (X(4) - X(3)));

p3 = @(x) f(X(1)) * L0(x) + f(X(2)) * L1(x) + f(X(3)) * L2(x) + f(X(4)) * L3(x);

% Kontroll: rita ut båda. Bör vara väldigt lika
hold on
fplot(p3, [-1, 2]);
fplot(f, [-1, 2]);
hold off

%% Splineinterpolation - rätta randvillkor (clamped boundaries)
clear all
format long
clf

% Funktion från uppgift
y = @(x) 2 * x + 3 .* sin(x * 2);
% Derivata
dy = @(x) 2 + 3 / 2 .* cos(x * 2);

% Intervall (ofta given)
a = 0;
b = 5;
% Alla steg (50 kontrollpunkter för spline)
x = linspace(0, 5, 50);
yval = y(x')';

% Intervall x, derivata för första värdet, intervall y, derivata för sista
% värdet
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

% Steglängden
h = (b - a) / n;

I = 0;
for i = 0:n-1
    a_ = a + i * h;
    b_ = a + (i + 1) * h;
    I = I + (b_ - a_) / 2 * (f(a_) + f(b_));
end

fprintf("Värdet är %f. Borde vara %f\n", I, quad(f, a, b));

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

% Steglängden
h = (b - a) / n;

I = 0;
for i = 0:n-1
    a_ = a + i * h;
    b_ = a + (i + 1) * h;
    I = I + (b_ - a_) / 6 * (f(a_) + 4 * f((a_ + b_) / 2) + f(b_));
end

fprintf("Värdet är %f. Borde vara %f\n", I, quad(f, a, b));

%% Trapetsformeln
clear all
format long

% Funktion angiven i uppgiften
f = @(x) x.^3 + x.^2 - 3;

% Intervall (given i uppgiften)
a = 0;
b = 10;

% Steglängden (ofta given)
h = 0.25;

I = f(a) / 2;
for x = a+h:h:b-h
    I = I + f(x);
end
I = I + f(b) / 2;
I = I * h;

fprintf("Värdet är %f. Borde vara %f\n", I, quad(f, a, b));

%% Simpsons formel
clear all
format long

% Funktion angiven i uppgiften
f = @(x) x.^3 + x.^2 - 3;

% Intervall (given i uppgiften)
a = 0;
b = 10;

% Steglängden (ofta given)
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

fprintf("Värdet är %f. Borde vara %f\n", I, quad(f, a, b));

%% Klassisk Runge-Kuttas metod
clear all
format long

% Derivata given i uppgiften
dy = @(x, y) x .* sin(x .* cos(y)) - y;

% Från formelbladet
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
% Steglängd
h = (b - a) / n;

% Alla punkter inom intervallet med steglängd h
x = a:h:b;

% Startvärden (ofta givet)
y = [2.5];

for k = 1:length(x)-1
   for j = 1:s
       K(j) = dy(x(k) + h * C(j), y(k) + h * A(j,:) * K);
   end
   y(k + 1) = y(k) + h * B' * K;
end

% Spline-interpolation (clamped boundary, "rätta randvillkor")
% Intervall x, derivata för första värdet, intervall y, derivata för sista
% värdet
pp = spline(x, [dy(x(1), y(1)), y, dy(x(end), y(end))]);
S = @(x) ppval(pp, x);

hold on
scatter(x, y);
fplot(S, [0, 3]);
hold off

fprintf("y(1) = %f, y(2) = %f, y(3) = %f\n", S(1), S(2), S(3));

%% QR-faktorisering med Gram-Schmidts

% Matris från uppgift
A = [1 3 0 5; -7 2 8 -1; 4 16 9 1; 13 0 1 6; 7 5 3 1];

% Kolonner från matrisen A
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
% Utgå från identitetsmatrisen och använd den första raden för att få bort
% den värden i den första kolonnen
E1 = [1 0 0; -3 1 0; 0.5 0 1];
% Utför samma beräkningar på identitetsmatrisen
l1 = E1 * eye(3);
% Låt vektorn vara första kolonnen i matrisen
l1 = l1(:,1);

A2 = E1 * A1;
% Utgå från identitetsmatrisen och använd den andra raden för att få bort
% den värden i den andra kolonnen
E2 = [1 0 0; 0 1 0; 0 2 1];
l2 = E2 * eye(3);
% Låt vektorn vara andra kolonnen i matrisen
l2 = l2(:,2);

A3 = E2 * A2;
% Någorlunda onödigt här, men det är för att visa den interativa processen
E3 = [1 0 0; 0 1 0; 0 0 1];
l3 = E1 * eye(3);
% Låt vektorn vara tredje kolonnen i matrisen
l3 = l3(:,3);

U = A3;
L = [l1 l2 l3];

% Kontroll (bör vara lika):
A1
L * U

%% LU-faktorisering med partiell pivotering
clear all
% Skriv ut som bråk
format rat

% Koefficienter från system i uppgiften
A = [2 1 -1 8; 1 -3 4 -7; 3 6 -2 8; -7 1 -1 -2];
% "y-värden" för system i uppgiften
b = [1; -3; 12; 19];
% Sammansatt matris vi kan gausseliminera
T = [A b];

% En matris som håller koll på vilka skaleringar vi gjort
% Det element vi vill "nolla" blir 
M = zeros(4);

% Partiell pivotering -> översta raden ska vara den som har högst
% absolutbelopp för någon av värdena. Byt därför rad 1 och 4
temp = T(4,:);
T(4,:) = T(1,:);
T(1,:) = temp;

% "Nolla" andra raden, första elementet, dela med pivot-elementet (största
% absolutvärdet)
M(2, 1) = T(2, 1) ./ T(1, 1);
M(3, 1) = T(3, 1) ./ T(1, 1);
M(4, 1) = T(4, 1) ./ T(1, 1);

% Utför ändringen
for i = 2:4
   T(i, :) = T(i, :) - M(i, 1) .* T(1, :);
end

% Utför pivotering på resten av matrisen (rad 2 - 4). Utför därför radbyte
% med rad två och tre
temp = T(2,:);
T(2,:) = T(3,:);
T(3,:) = temp;

% "Nolla" tredje raden, andra kolonnen, dela med pivot-elementet (största
% absolutvärdet)
M(3, 2) = T(3, 2) ./ T(2, 2);
M(4, 2) = T(4, 2) ./ T(2, 2);

% Utför ändringen
for i = 3:4
   T(i,:) = T(i,:) - M(i, 2) .* T(2, :);
end

% "Nolla" fjärde raden, tredje kolonnen, dela med pivot-elementet (största
% absolutvärdet)
M(4, 3) = T(4, 3) ./ T(3, 3);

% Utför ändringen
T(4,:) = T(4,:) - M(4, 3) .* T(3, :);

% Lös matrisen med återsubstitution
X = [0; 0; 0; 0];
X(4) = T(4, 5) ./ T(4, 4);
X(3) = (T(3,5) - T(3, 4) .* X(4)) ./ T(3, 3);
X(2) = (T(2, 5) - T(2, 4) .* X(4) - T(2, 3) .* X(3)) ./ T(2, 2);
X(1) = (T(1, 5) - T(1, 4) .* X(4) - T(1, 3) .* X(3) - T(1, 2) .* X(2)) ./ T(1, 1);

% Lösning
X

% Kontroll A*'x = b:
A * X
b

%% LU-faktorisering med partiell pivotering (alternativ)
clear all
format long

A1 = [1 5 4; 2 0.5 1; 5 2 -3];

% Flytta upp den rad med störst absolutbelopp till första raden
temp = A1(1,:);
A1(1,:) = A1(3,:);
A1(3,:) = temp;
% Utför samma radbyte på permutationsmatrisen
P1 = eye(size(A1));
temp = P1(1,:);
P1(1,:) = P1(3,:);
P1(3,:) = temp;

% Utgå från identitetsmatrisen, få nollor under diagonalen i första
% kolonnen
E1 = [1 0 0; -0.4 1 0; -0.2 0 1];
l1 = E1 * eye(3);
l1 = l1(:,1);
A2 = E1 * A1;

% Flytta upp den rad med störst absolutbelopp till andra raden
temp = A2(2,:);
A2(2,:) = A2(3,:);
A2(3,:) = temp;
% Utför samma radbyte på permutationsmatrisen
P2 = eye(size(A1));
temp = P2(2,:);
P2(2,:) = P2(3,:);
P2(3,:) = temp;

% Utgå från identitetsmatrisen, få nollor under diagonalen i första
% kolonnen
E2 = [1 0 0; 0 1 0; 0 0.3/4.6 1];
l2 = E2 * eye(3);
l2 = l2(:,2);
A3 = E2 * A2;

% Något onödigt, men fullföljer hur vi skrivit innan
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

%% Potensmetoden ("största" egenvärdet)
clear all
format long

% Matris som anges i uppgiften
A = [3 1 5; 4 1 2; 2 1 7];

% Gissning x (obs. normaliserad)
X = [0.5; 0.5; 0.5];
X = X / norm(X);

% Tillåtet fel (anges ofta)
epsilon = 1e-12;
error = 1e100;

while error > epsilon
    old_X = X;
    Y = A * X;
    X = Y / norm(Y);
    error = norm(old_X - X);
end

% Beräkna egenvärdet - obs. står ej i formelsamling
e = X' * A * X;

% Kontroll: finns med i eig(A) (bör vara det största värdet)
eig(A)
fprintf("Egenvärdet med det största absolutbeloppet är %f\n", e);

%% Invers iteration ("minsta" egenvärdet)
clear all
format long

% Matris som anges i uppgiften
A = [3 1 5; 4 1 2; 2 1 7];

[L, U, P] = lu(A);

% Gissning (obs. normerad)
X = [0.5; 0.5; 0.5];
X = X / norm(X);

% Tillåtet fel (anges ofta)
epsilon = 1e-12;
error = 1e100;

while error > epsilon
    old_X = X;

    Z = L \ P * X;
    Y = U \ Z;
    X = Y / norm(Y);
    
    error = norm(old_X - X);
end

% Beräkna egenvärdet - obs. står ej i formelsamling
e = X' * A * X;

% Kontroll: finns med i eig(A) (bör vara det största värdet)
eig(A)
fprintf("Egenvärdet med det minsta absolutbeloppet är %f\n", e);

%% Invers iteration med skift
clear all
format long

% Matris som anges i uppgiften
A = [3 1 5; 4 1 2; 2 1 7];
% Givet skift (om övriga egenvärden har hittats kan de användas som skift)
% Vanligtvis får man testa lite olika värden för att se vad som ger ett
% tidigare okänt egenvärde
sigma = 1;

% Identitetsmatris med samma dimension som A
I = eye(size(A));
AA = A - sigma * I;

% Gissning (obs. normerad)
X = [0.5; 0.5; 0.5];
X = X / norm(X);

% Tillåtet fel (anges ofta)
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

% Beräkna egenvärdet - obs. står ej i formelsamling
e = X' * A * X;

% Kontroll: finns med i eig(A) (bör vara det största värdet)
eig(A)
fprintf("Egenvärdet är %f\n", e);

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

% Kontroll: diagonalen av L bör vara egenvärdena
e = [eig_a; eig_b; eig_c]
eig(A)

%% Eulers framåtmetod

% Derivata från uppgift
dy = @(x, y) 3 * (y - x^2 + 3)^(2 / 3) + 2 * x;

% Intervall från uppgift
a = 1;
b = 5;

% Steglängd från uppgift
h = 1;

% Startvärde (angiven i uppgift)
y = -1;

% Approximativa värden för x och y(x)
X = [];
Y = [];

for x = a:h:b
   X = [X, x];
   Y = [Y, y];
   y = y + h * dy(x, y);
end

clf
scatter(X, Y);