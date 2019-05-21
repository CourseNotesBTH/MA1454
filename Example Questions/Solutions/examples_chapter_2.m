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

%...?

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

%...?
