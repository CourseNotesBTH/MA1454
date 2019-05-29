%% 1

x = @(k) 0.15 .* k;
f = @(x) sqrt(x .* abs(cos(3 .* x)) + 1);

interval = linspace(0, 10, 11);

X = x(interval')';
Y = f(x(interval'))';

values = vander(X([1, 2, 3, 4])\Y([1, 2, 3, 4]))
a = values(1, 1)
b = values(2, 1)
c = values(3, 1)
d = values(4, 1)
p = @(x) a*x.^4 + b*x.^3 + c*x.^2 + d*x;

p([X(1), X(2), X(3)]')
Y([1, 2, 3])