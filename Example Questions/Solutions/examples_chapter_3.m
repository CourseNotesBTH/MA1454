%% 3.2
clear all
format long

x = [-1;0;1;2];
y = [-3;-3;-1;9];

% The vander function needs a matrix that has n + 1 rows and n + 1 columns.
% In this example, giving our 3x3 matris will result in a polynomial of
% the second degree
values = vander(x([1, 2, 3]))\y([1,2,3])
% Retrieve the coefficients from solution
a = values(1, 1);
b = values(2, 1);
c = values(3, 1);
% Recreate the polynomial
p = @(x) a * x^2 + b * x + c;
fplot(p, [-1, 2]);

% Test our interpolation with a known value
fprintf("Testing f(%f) should be %f was %f\n", x(1), y(1), p(x(1)));

%% 3.3

% ...?

%% 3.5
clear all
format long

x = [16; 81; 256];
y = [2; 3; 4];

f = @(x) x.^(1/4);

% Create lineatly spaced values between 16 and 81
interval_a = linspace(16, 81, 100);
% Create lineatly spaced values between 81 and 256
interval_b = linspace(81, 256, 100);

% Calculate the splines' control points by giving x and corresponding y
% values
pp_a = spline(interval_a, f(interval_a')');
pp_b = spline(interval_b, f(interval_b')');
% Create functions for later use. These uses ppval to get a value for the
% corresponding x values from the control points
s_a = @(x) ppval(pp_b, x);
s_b = @(x) ppval(pp_b, x);

hold on
fplot(f, [16, 256]);
fplot(s_a, [16, 81]);
fplot(s_b, [81, 256]);
hold off

% Test our interpolation with a known value
fprintf("Testing f(%f) should be %f was %f\n", x(1), y(1), s_a(x(1)));
fprintf("Testing f(%f) should be %f was %f\n", x(2), y(2), s_a(x(2)));
fprintf("Testing f(%f) should be %f was %f\n", x(3), y(3), s_b(x(3)));
