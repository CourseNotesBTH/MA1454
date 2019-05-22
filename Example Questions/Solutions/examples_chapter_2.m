%% 2.2
clear all
format long

% Original function
f = @(x) x^3 + x^2 - 3;
% Derivative
df = @(x) 3 * x^2 + 2 * x;
% Start value
x = 0.5;
% Number of iterations to perform
iterations = 1;

for i = 1:iterations
   x = x - f(x) / df(x);
end

fprintf("Approximation is %f\n", x);
fprintf("Control: function value at %f is %f. Should be 0\n", x, f(x));

%% 2.3
clear all
format long

% Original function
f = @(x) x^3 + x^2 - 3;
% Derivative
df = @(x) 3 * x^2 + 2 * x;
% Start value
x = 0.5;
% Dampening
a = 0.6;
% Number of iterations to perform
iterations = 1;

for i = 1:iterations
   x = x - a * (f(x) / df(x));
end

fprintf("Approximation is %f\n", x);
fprintf("Control: function value at %f is %f. Should be 0\n", x, f(x));

%% 2.4
clear all
format long

% Note: since it's not equal to 0, move the y-value over to the left hand
% side for each function
f1 = @(x1, x2, x3) x1^2 + x2^2 + x3^2 - 3;
f2 = @(x1, x2, x3) x1^2 - x2;
f3 = @(x1, x2, x3) x2^2 + x3 -2;

% Calculate the matrix by hand. Each row corresponds to a function. Each
% column to a certain x
J = @(x1, x2, x3) [2 * x1, 2 * x2, 2 * x3; 2 * x1, -1, 0; 0, 2 * x2, 1];

% Initial guess
X = [0.5; 0.5; 0.5];

% Start error (should be large, at least larger than allowed_error)
error = 1e100;
allowed_error = 1e-16;

while error > allowed_error
    % Calculate the F matrix (aka f(x_k))
    F = [f1(X(1), X(2), X(3)); f2(X(1), X(2), X(3)); f3(X(1), X(2), X(3))];
    % Calculate the Y matrix (aka s_k)
    Y = J(X(1), X(2), X(3))\-F;
    X = X + Y
    error = norm(Y);
end

fprintf("Solution is (%f, %f, %f)\n", X(1), X(2), X(3));
fprintf("Controls: f1(X)=%f. Should be 0\n", f1(X(1), X(2), X(3)));
fprintf("Controls: f2(X)=%f. Should be 0\n", f2(X(1), X(2), X(3)));
fprintf("Controls: f3(X)=%f. Should be 0\n", f3(X(1), X(2), X(3)));

%% 2.5
clear all
format long

% Original function
f = @(x) x^3 + x^2 - 3;
% x value one steps back
x_old = 0.5;
% current x value
x = 1.5;
% Number of iterations to perform
iterations = 1;

for i = 1:iterations
   temp_x = x;
   x = x - f(x) * (x - x_old) / (f(x) - f(x_old));
   x_old = temp_x;
end

fprintf("Approximation is %f\n", x);
fprintf("Control: function value at %f is %f. Should be 0\n", x, f(x));

%% 2.6
clear all
format long

% Original function
f = @(x) x^3 + x^2 - 3;
% x value one steps back
x_old = -1;
% current x value (NOTE: this will not work since x=0 is a bad guess.
% It will cause division by zero. Try x = 0.5 and 10 iterations)
x = 0;
% Number of iterations to perform
iterations = 1;

fprintf("Approximations are ");
for i = 1:iterations
   temp_x = x;
   x = x - f(x) * (x - x_old) / (f(x) - f(x_old));
   x_old = temp_x;
   fprintf("%f, ", x);
end
fprintf("\n");

%% 2.5
clear all
format long

% Original function
f = @(x) x^3 + x^2 - 3;
% Iteration method
g = @(x) x - f(x) / 5;
df = @(x) 1 - (3 * x^2 + 2 * x) / 5;

% To verify the method we need to check that there is a x so that 
% x => f(x) = 0 and g(x) = x. Find the likely value for x by looking at the
% plot below. Enter it as a guess
fplot(f);
guess = 1;
% Solve the actual value for x
[x, y] = fsolve(f, guess);
fprintf("x = %f, f(x) = %f (should be 0) and g(x) = %f (should be %f)", x, f(x), g(x), x);

% Number of iterations
iterations = 1;

x = 1;
for i = 1:iterations
    x = g(x);
end

fprintf("Approximation is %f\n", x);
fprintf("Control: function value at %f is %f. Should be 0\n", x, f(x));

%% 2.8
% NOTE! Incomplete. Kan skalera
% Note! Unlikely to be on the exam

f1 = @(x1, x2, x3) x1^2 + x2^2 + x3^2 / 2 - 1;
f2 = @(x1, x2, x3) x1^2 / 3 - x2;
f3 = @(x1, x2, x3) x2^2 / 2 + x3;

% Skalera var för sig så att summan av absolutbeloppen av derivatan är
% mindre än 1!
% g1 får x1, g2 får x2, g3 får x3 -> skalera också!
g1 = @(x1, x2, x3) f1(x1, x2, x3) + x1;
g2 = @(x1, x2, x3) f2(x1, x2, x3) + x2;
g3 = @(x1, x2, x3) f3(x1, x2, x3) + x1 + x2 + x3;

% Calculate the matrix by hand. Each row corresponds to a function. Each
% column to a certain x
J = @(x1, x2, x3) [2 * x1, 2 * x2, 2*x3 / 2; 2 * x1 / 3, -x2, 0; 0, 2 * x2, x3];

% Initial guess
X = [0.5; 0.5; 0.5];

% Start error (should be large, at least larger than allowed_error)
error = 1e100;
allowed_error = 1e-16;

while error > allowed_error
    % Calculate the F matrix (aka f(x_k))
    X = [g1(X(1), X(2), X(3)); g2(X(1), X(2), X(3)); g3(X(1), X(2), X(3))];
    % Calculate the Y matrix (aka s_k)
    Y = J(X(1), X(2), X(3))\-X;
    error = norm(Y);
end

fprintf("Solution is (%f, %f, %f)\n", X(1), X(2), X(3));
fprintf("Controls: f1(X)=%f. Should be 0\n", f1(X(1), X(2), X(3)));
fprintf("Controls: f2(X)=%f. Should be 0\n", f2(X(1), X(2), X(3)));
fprintf("Controls: f3(X)=%f. Should be 0\n", f3(X(1), X(2), X(3)));