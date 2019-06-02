%% 1
clear all
format long

% Given funktion
f = @(x) sqrt(x .* exp(cos(x)));
% Givet intervall
a = 0;
b = 4;
% Antal delintervall
n = 100;
h = (b - a) / n;

I = 0;
for i = 0:n-1
    a_ = a + i * h;
    b_ = a + (i + 1) * h;
    I = I + (b_ - a_) / 2 * (f(a_) + f(b_));
end

fprintf("Svar: %f\n", I);

%% 2

% Given funktion
f = @(x) log(x.^2 + 1) / (x.^2 -2) + exp(-x);

epsilon = 1e-10;

old_x = 0;
x = 0.5;
error = 100;

while error > epsilon
   temp_x = x;
   x = x - f(x) * (x - old_x)/(f(x) - f(old_x));
   old_x = temp_x;
   error = abs(temp_x - x);
end

fprintf("Svar: x = %f. Kontroll f(x) = %f\n", x, f(x));

%% 3
clear all
format long

A = [1 3 0 5; -7 2 8 -1; 4 16 9 1; 13 0 1 6; 7 5 3 1];

a1 = A(:,1);
a2 = A(:,2);
a3 = A(:,3);
a4 = A(:,4);

proj = @(a, u) (a .* u) / norm(u) .* u;

u1 = a1;
u2 = a2 - proj(u1, a2);
u3 = a3 - proj(u1, a3) - proj(u2, a3);
u4 = a4 - proj(u1, a4) - proj(u2, a4) - proj(u3, a4);

Q = [u1/norm(u1), u2/norm(u2), u3/norm(u3), u4/norm(u4)];
R = Q' * A;

Q