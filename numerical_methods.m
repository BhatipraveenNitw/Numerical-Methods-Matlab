% Numerical Methods in MATLAB
% Author: Praveen Bhati
% MSc Mathematics & Computing, NIT Warangal

clc;
clear;

%% Bisection Method
f = @(x) x^3 - x - 2;
a = 1; b = 2;

for i = 1:50
    c = (a + b)/2;
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
end
bisection_root = (a + b)/2;
disp("Bisection Method Root:");
disp(bisection_root);

%% Newton-Raphson Method
f = @(x) x^3 - x - 2;
df = @(x) 3*x^2 - 1;
x0 = 1.5;

for i = 1:20
    x0 = x0 - f(x0)/df(x0);
end
newton_root = x0;
disp("Newton-Raphson Root:");
disp(newton_root);

%% Secant Method
x0 = 1;
x1 = 2;

for i = 1:20
    x2 = x1 - f(x1)*(x1-x0)/(f(x1)-f(x0));
    x0 = x1;
    x1 = x2;
end
secant_root = x1;
disp("Secant Method Root:");
disp(secant_root);

%% Runge-Kutta 4th Order Method
f = @(x,y) x + y;
x0 = 0; 
y0 = 1;
h = 0.1;
n = 10;

x = x0;
y = y0;

for i = 1:n
    k1 = h*f(x,y);
    k2 = h*f(x+h/2, y+k1/2);
    k3 = h*f(x+h/2, y+k2/2);
    k4 = h*f(x+h, y+k3);
    y = y + (k1+2*k2+2*k3+k4)/6;
    x = x + h;
end

disp("Runge-Kutta Result:");
disp(y);

%% Simpson's Rule
f = @(x) x^2;
a = 0; b = 4; n = 10;
h = (b-a)/n;
sum = f(a) + f(b);

for i = 1:n-1
    x = a + i*h;
    if mod(i,2)==0
        sum = sum + 2*f(x);
    else
        sum = sum + 4*f(x);
    end
end

simpson_result = (h/3)*sum;
disp("Simpson Rule Result:");
disp(simpson_result);
