% Tentamen
% 27 maj 2016

%% 1
% Simpsons regel (svar: 0.5 ish)
% m = 2*n (förra formelsamlingen)
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

% Integralens värde
integral = 0;
% För varje delintervall
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

% Plot ger ungefär y=0 då x=0.7
x = linspace(0, 1.5, 200);
y = f(x);
dy = df(x);
plot(x, y);

% Första gissningen (från ploten)
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

% Test: sätt in värdet (bör ge väldigt nära 0)
f(xn)

%% 3 - del a
% Matris - approximera egenvärden (potensmetod), första egenvärdet

clear all
format long

A = [0.2 -0.1 0.2; 0.3 0.8 -0.3; -0.2 0.1 -0.6];
epsilon = 10^(-8);


% Startvärde (obs kolonnmatris)
x = [1;1;1];
% Normera
x = x / norm(x);

iterations = 0;
while true
   x_old = x;
   y = A * x;
   x = y / norm(y);
   iterations = iterations + 1;
   % Avbryt om längden på vektorn är mindre än epsilon
   if norm(x - x_old) < epsilon
       break
   end
end

% Egenvektorn är nu x, härled egenvärdet
eigenvalue = x' * A * x;

iterations
eigenvalue

% Test eig:
%[V, D] = eig(A);
%x
% I D bör värdet eigenvalue finnas - potensmetoden hittar det största
% värdet
%D
% I V bör vår egenvektor x finnas (vi har hittat den första kolonnen)
%V

%% 3 - del b
% Matris - approximera egenvärden (invers iteration), lägsta egenvärdet
% (minst absolutbelopp)

clear all
format long

A = [0.2 -0.1 0.2; 0.3 0.8 -0.3; -0.2 0.1 -0.6];
epsilon = 10^(-8);

% Hämta hem värden (P permutations matris) (överdiagonal matris U)
% (underdimensionell matris L)
[L, U, P] = lu(A);

% Startvärde (obs kolonnmatris)
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

% Härled egenvärde
eigenvalue = x' * A * x;

iterations
eigenvalue

% Test eig:
%[V, D] = eig(A);
%x
% I D bör värdet eigenvalue finnas - invers iteration hittar det minsta
% värdet
%D
% I V bör vår egenvektor x finnas (vi har hittat den andra kolonnen)
%V

%% 3 - del c
% Matris - approximera egenvärden (invers iteration med skift)

clear all
format long

A = [0.2 -0.1 0.2; 0.3 0.8 -0.3; -0.2 0.1 -0.6];
epsilon = 10^(-8);


% Se del a och b
largestEigenvalue = 0.724499801999672;
smallestEigenvalue = 0.200000000000000;

% Startvärde (gissning för egenvärde (sigma) försök 1)
start1 = (abs(largestEigenvalue) + abs(smallestEigenvalue)) / 2;
% Startvärde (gissning för egenvärde (sigma) försök 1)
start2 = -start1;

% Startvärde (obs kolonnmatris)
x = [1;1;1];
% Normera
x = x / norm(x);

% Gissning för egenvärde (obs testa start1 och start2!)
sigma = start2;

iterations = 0;
while true
    % Hämta hem värden (P permutations matris) (överdiagonal matris U)
    % (underdimensionell matris L)
    [L, U, P] = lu(A - eye(3) .* sigma);
    x_old = x;
    % Lz_k = Px_k (L^-1 * P * x)
    z = L\P * x;
    % Uy_k+1 = z_k (U^-1 * z)
    y = U\z;
    % Normalisera y
    x = y / norm(y);
    % Härled egenvärde (approximation)
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
% I D bör värdet eigenvalue finnas - invers iteration hittar det minsta
% värdet
%D
% I V bör vår egenvektor x finnas (vi har hittat den andra kolonnen)
%V

%% 4

f = @(x) 2 * e^(-x ^2)