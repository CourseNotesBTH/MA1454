%% 1
clear all
format long
clf

% Rewritten to the form f(x) = 0
f = @(x) x ^ (2 - sin(3 * x)) / x - 1.7;
a = 1;
b = 2;
epsilon = 1e-12;

fplot(f, [a, b])

error = 1e100;
guess = 0;
while error > epsilon
    c = (a + b) / 2;
    if (f(a) * f(c) < 0)
        b = c;
    else
        a = c;
    end
    error = abs(guess - c);
    guess = c;
end

fprintf("x = %f\n", guess);
fprintf("Control: f(%f) = %f. Should be 0\n", guess, f(guess));


%% 2 a
clear all
format long
clf

f = @(x) sin(x.^2 .* log(3.9 - x) .* cos(x - 1.3) + 0.8);
X = linspace(0, 3, 7);

Y = f(X');

values = vander(X)\Y;

P = @(x) polyval(values, x);

clf
hold on
fplot(f, [0, 3]);
scatter(X, Y);
fplot(P, [0, 3]);
hold off

%% 2 b
clear all
format long

f = @(x) sin(x.^2 .* log(3.9 - x) .* cos(x - 1.3) + 0.8);
a = 0;
b = 3;

N = [5, 50, 500];
for i = 1:size(N, 2)
    n = N(i);
    
    step = (b - a) / n;
    a_ = a;
    b_ = a + step;
    sum = 0;
    for j = 1:n-1
       sum = sum + (b_ - a_) / 6 * (f(a_) + 4 * f((a_ + b_) / 2) + f(b_));
    end
    fprintf("n=%d: %f (should be %f)\n", n, sum, quad(f, a, b));
end

%% 3

A = [1 0 -1; 3 1 4; 0 3 11; -3 5 7];
[Q, R] = qr(A);

%% 4

f = @(x, y) x * y + sin(x * y) - 1;
g = @(x, y) x^2 + (y - 1)^2 - 1;

a = 0;
b = 1;

v = [0.5; 0.5];
epsilon = 1e-10;
iterations = 0;

%% 5
clear all
format long

A = [3 0 1 2; -1 -1 3 4; 0 0 19 2; 5 4 5 2];

% Potens
epsilon = 1e-16;
error = 1e100;
x = [1; 1; 1; 1];
x = x / norm(x);
y = 0;
while error > epsilon
    x_old = x;
    y = A * x;
    x = y / norm(y);
    error = norm(x - x_old);
end

eig = x' * A * x;
fprintf("eig(A) -> %f\n", eig);

