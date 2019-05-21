%% 4.1
clear all
format long

f = @(x) exp(-x^2);
a = 0;
b = 1;

F = (f(b) + f(a)) * (b - a) / 2;

fprintf("F=%f\n", F);

%% 4.2
clear all
format long

f = @(x) exp(-x^2);
a = 0;
b = 1;

F = (b - a) / 6 * (f(b) + 4 * f((a + b) / 2) + f(a));

fprintf("F=%f\n", F);

%% 4.3
clear all
format long

f = @(x) exp(-x^2);
a = 0;
b = 1;
h = 0.25;
% Calculate the number of iterations
n = (a + b) / h;

% Create each point we will encounter. Matlab subtracts 1 from the third
% parameter, hence n + 1
points = linspace(a, b, n + 1);

F = 0;
for i = 1:size(points, 2) - 1
    a = points(i);
    b = points(i + 1);
    F = F + (f(b) + f(a)) * (b - a) / 2;
end

fprintf("F=%f\n", F);

%% 4.4
clear all
format long

f = @(x) exp(-x^2);
a = 0;
b = 1;
h = 0.25;
% Calculate the number of iterations
n = (b - a) / h;

iterations = n - 1;

F = f(a);
for i = 1:iterations
    if mod(i, 2) == 1
        F = F + 4 * f(a + i * h);
    else
        F = F + 2 * f(a + i * h);
    end
end
F = F + f(b);

F = h / 3 * F;

fprintf("F=%f\n", F);

%% 4.5

% ...?

%% 4.6

% ...?

%% 4.7
clear all
format long

f = @(x) (exp(-x^2)) / sqrt(x);
% Note: won't work because of division by zero
a = 0;
b = 1;
h = 0.25;
% Calculate the number of iterations
n = (b - a) / h;

iterations = n - 1;

F = f(a) / 2;
for i = 1:iterations
    F = F + f(a + i * h);
end
F = F + f(b) / 2;

F = h * F;

fprintf("F=%f\n", F);