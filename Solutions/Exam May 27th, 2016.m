% Tentamen
% 27 maj 2016

%% 1
% Simpsons regel (svar: 0.5 ish)
% m = 2*n (f�rra formelsamlingen)
% n = 50: 50 delintervall
% h = intervallbredden
% h = (b - a) / n

clear all
format long

a = 0.1;
b = 1;
f = @(x) sin(1/x);
n = 50;
points = linspace(a, b, n);
h = (b - a) / n;

% Integralens v�rde
integral = 0;
% F�r varje delintervall
for i = 1:size(points, 2) - 1
    sum = f(points(i)) + f((points(i) + points(i + 1)) / 2) + f(points(i + 1));
    integral = integral + sum;
end
integral = integral * h

%% 2
% Newtons formel

clear all
format long

f = @(x) cos(3 .* sin(x) - 1) - x.^2;
df = @(x) -sin(3 .* sin(x) - 1) .* 3 .* cos(x) - 2 .* x;
epsilon = 10^(-8);

% Plot ger ungef�r y=0 d� x=0.7
x = linspace(0, 1.5, 200);
y = f(x);
dy = df(x);
plot(x, y);

% F�rsta gissningen (fr�n ploten)
xn = 0.7;
while true
    x0 = xn;
    xn = xn - f(xn) / df(xn);
    if abs(xn - x0) < epsilon
        break
    end
end
% Svar
xn

% Test: s�tt in v�rdet (b�r ge v�ldigt n�ra 0)
f(xn)

%% 3 - del a
% Matris - approximera egenv�rden (potensmetod), f�rsta egenv�rdet

clear all
format long

A = [0.2 -0.1 0.2; 0.3 0.8 -0.3; -0.2 0.1 -0.6];
epsilon = 10^(-8);


% Startv�rde (obs kolonnmatris)
x = [1;1;1];
% Normera
x = x / norm(x);

iterations = 0;
while true
   x_old = x;
   y = A * x;
   x = y / norm(y);
   iterations = iterations + 1;
   % Avbryt om l�ngden p� vektorn �r mindre �n epsilon
   if norm(x - x_old) < epsilon
       break
   end
end

% Egenvektorn �r nu x, h�rled egenv�rdet
eigenvalue = x' * A * x;

iterations
eigenvalue

% Test eig:
%[V, D] = eig(A);
%x
% I D b�r v�rdet eigenvalue finnas - potensmetoden hittar det st�rsta
% v�rdet
%D
% I V b�r v�r egenvektor x finnas (vi har hittat den f�rsta kolonnen)
%V

%% 3 - del b
% Matris - approximera egenv�rden (invers iteration), l�gsta egenv�rdet
% (minst absolutbelopp)

clear all
format long

A = [0.2 -0.1 0.2; 0.3 0.8 -0.3; -0.2 0.1 -0.6];
epsilon = 10^(-8);

% H�mta hem v�rden (P permutations matris) (�verdiagonal matris U)
% (underdimensionell matris L)
[L, U, P] = lu(A);

% Startv�rde (obs kolonnmatris)
x = [1;1;1];
% Normera
x = x / norm(x);

iterations = 0;
while true
    x_old = x;
    % Lz_k = Px_k (L^-1 * P * x)
    z = L\P * x;
    % Uy_k+1 = z_k (U^-1 * z)
    y = U\z;
    % Normalisera y
    x = y / norm(y);
    iterations = iterations + 1;
    if norm(x - x_old) < epsilon
        break;
    end
end

% H�rled egenv�rde
eigenvalue = x' * A * x;

iterations
eigenvalue

% Test eig:
%[V, D] = eig(A);
%x
% I D b�r v�rdet eigenvalue finnas - invers iteration hittar det minsta
% v�rdet
%D
% I V b�r v�r egenvektor x finnas (vi har hittat den andra kolonnen)
%V

%% 3 - del c
% Matris - approximera egenv�rden (invers iteration med skift)

clear all
format long

A = [0.2 -0.1 0.2; 0.3 0.8 -0.3; -0.2 0.1 -0.6];
epsilon = 10^(-8);


% Se del a och b
largestEigenvalue = 0.724499801999672;
smallestEigenvalue = 0.200000000000000;

% Startv�rde (gissning f�r egenv�rde (sigma) f�rs�k 1)
start1 = (abs(largestEigenvalue) + abs(smallestEigenvalue)) / 2;
% Startv�rde (gissning f�r egenv�rde (sigma) f�rs�k 1)
start2 = -start1;

% Startv�rde (obs kolonnmatris)
x = [1;1;1];
% Normera
x = x / norm(x);

% Gissning f�r egenv�rde (obs testa start1 och start2!)
sigma = start2;

iterations = 0;
while true
    % H�mta hem v�rden (P permutations matris) (�verdiagonal matris U)
    % (underdimensionell matris L)
    [L, U, P] = lu(A - eye(3) .* sigma);
    x_old = x;
    % Lz_k = Px_k (L^-1 * P * x)
    z = L\P * x;
    % Uy_k+1 = z_k (U^-1 * z)
    y = U\z;
    % Normalisera y
    x = y / norm(y);
    % H�rled egenv�rde (approximation)
    sigma = x' * A * x;
    iterations = iterations + 1;
    if norm(x - x_old) < epsilon
        break;
    end
end

eigenvalue = sigma;

iterations
eigenvalue

% Test eig:
%[V, D] = eig(A);
%x
% I D b�r v�rdet eigenvalue finnas - invers iteration hittar det minsta
% v�rdet
%D
% I V b�r v�r egenvektor x finnas (vi har hittat den andra kolonnen)
%V

%% 4

f = @(x) 2 * e^(-x ^2)