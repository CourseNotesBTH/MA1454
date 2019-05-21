clear all
close all

figure('name', 'Uppgift d');

%% Fråga b
a=1;
b=5;
h=1;
y_0=-1;
f = @(t,y) 3*(y-t.^2+3)^(2/3)+2*t;

[t_k, y_fram] = eulerfram(a,b,h,f,y_0);

hold on
scatter(t_k, y_fram);
hold off

%% Fråga c
y_trap = zeros(length(t_k),1);
y_k = 0;

for i = 1:length(t_k)-1
    
    y_trap(i) = y_k;
    [t, y] = eulerfram(t_k(i),t_k(i+1),h,f,y_k);
    y_l = y(2);
    delta = 1;
    
    while abs(delta) > 1*10^(-1)
        y_l1 = y(1) + h/2 * (f(t(2),y_l) + f(t(1),y(1)));
        delta = y_l1 - y_l;
        y_l = y_l1;
    end
  
    y_k = y_l;
    
end

y_trap(length(t_k)) = y_k;

hold on
scatter(t_k, y_trap);
hold off

%% Fråga d

p = @(x) x.^3+x.^2-3;

x_plot = linspace(a,b,101);

hold on
plot(x_plot, p(x_plot))
hold off

%% Fråga a
function [t_k, y_fram] = eulerfram(a,b,h,f,y_0)
    
    t_k = a:h:b;
    y_k = y_0;
    y_fram = zeros(length(t_k),1);
    
    for i = 1:length(t_k)-1
        y_fram(i) = y_k;
        y_k1 = y_k + h * f(t_k(i),y_k);
        y_k = y_k1;
    end
    
    y_fram(length(t_k)) = y_k;
    
end
