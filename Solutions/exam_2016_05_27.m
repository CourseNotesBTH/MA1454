%% 1
clear all
format long

% Given funktion
f = @(x) sin(1 / x);
% Givet intervall
a = 0.1;
b = 1.0;
% Antal delintervall
n = 100;
% Steglängd
h = (b - a) / n;

S = 0;
for i = 0:n-1
   a_ = a + i * h;
   b_ = a + (i + 1) * h;
   S = S + (b_ - a_) / 6 * (f(a_) + 4 * f((a_ + b_) / 2) + f(b_));
end

fprintf("Svar: %f\n", S);

%% 2
clear all
format long

% Given funktion
f = @(x) x.^2 - cos(3 * sin(x) - 1);
df = @(x) 2.*x + sin(3 * sin(x) - 1) / (3 * cos(x));
% Tillåtet fel
epsilon = 1e-8;

% Gissning
x = 0.5;
% Fel
error = 100;

while error > epsilon
   old_x = x;
   x = x - f(x) / df(x);
   error = abs(old_x - x);
end

fprintf("Svar: x = %f\n", x);
fprintf("Kontroll: f(x) = %f, borde vara 0\n", f(x));

%% 3
clear all
format long

% Given matris
A = [0.2 -0.1 0.2; 0.3 0.8 -0.3; -0.2 0.1 -0.6];

% Tillåtet fel
epsilon = 1e-8;

% Egenvärden
e = [];

%%% Egenvärdet med störst absolutbelopp - potensmetoden
% Gissning
x = [0.5; 0.5; 0.5];
% Fel
error = 100;

while error > epsilon
   old_x = x;
   Y = A * x;
   x = Y / norm(Y);
   error = norm(old_x - x);
end

e = [e, x' * A * x];

%%% Egenvärdet med minst absolutbelopp - inversiteration
% Gissning
x = [0.5; 0.5; 0.5];
% L, U och P
[L, U, P] = lu(A);
% Fel
error = 100;

while error > epsilon
    old_x = x;
    Z = L\P * x;
    Y = U\Z;
    x = Y / norm(Y);
    error = norm(old_x - x);
end

x
e = [e, x' * A * x];
true_e = eig(A);

fprintf("Svar: e = [%f, %f, x]\n", e(1), e(2));
fprintf("Kontroll: e = [%f, %f, %f]\n", true_e(1), true_e(2), true_e(3));

%% 4
clear all
format long

f = @(x) 2 * exp(-x.^2) + exp(-(x-2).^2);
x = [-1 0 1 2 3];

%%% Uppgift A
k = 4

%% 5
clear all
format long

% Given funktion
dy = @(x, y) x .* sin(x .* cos(y)) - y;
% Givet startvärde
y0 = 2.5;
% Givet intervall
a = 0;
b = 3;
n = 100;
h = (b - a) / n;

% Runge Kuttas
A = [0 0 0 0; 1/2 0 0 0; 0 1/2 0 0; 0 0 1 0];
c = [0; 1/2; 1/2; 1];
b = [1/6; 2/6; 2/6; 1/6];
s = 4;

x = linspace(0, 3, n);

y = [y0];
K = [0; 0; 0; 0];
for k = 1:length(x)-1
   for j = 1:s
       K(j) = dy(x(k) + h * c(j), y(k) + h * A(j,:) * K);
   end
   y(k + 1) = y(k) + h * b' * K;
end

pp = spline(x, y);
S = @(x) ppval(pp, x);

fplot(S, [0, 3]);