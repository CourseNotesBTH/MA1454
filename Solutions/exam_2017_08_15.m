%% 1
clear all
format long
clf

f = @(x) sqrt(x .* abs(cos(3 .* x)) + 1);

x = linspace(0, 1.5, 11);
y = f(x')';

c = vander(x)\y';

p = @(x) polyval(c, x);

hold on
scatter(x, y);
fplot(p, [0, 1.5])
hold off

fprintf("Svar: %fx^10 + %fx^9 + %fx^8 + %fx^7 + %fx^6 + %fx^5 + %fx^4 + %fx^3 + %fx^2 + %fx + %f\n", c(1), c(2), c(3), c(4), c(5), c(6), c(7), c(8), c(9), c(10), c(11));

%% 2

f = @(x) (exp(-x) + x) / sqrt(x + 1);
a = 0;
b = 2;

N = [50, 100, 200];
epsilon = 1e-12;

for i = 1:size(N, 2)
   n = N(i);
   h = (b - a) / n;
   I = 0;
   for j = 0:n-1
      a_ = a + j * h;
      b_ = a + (j + 1) * h;
      I = I + (b_ - a_) / 6 * (f(a_) + 4 * f((a_ + b_) / 2) + f(b_));
   end
   fprintf("n=%.10f => I=%.10f\n", n, I);
end

%% 3

