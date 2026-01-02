function root = bisection_method(f, a, b)
for i = 1:50
    c = (a + b)/2;
    if f(a)*f(c) < 0
        b = c;
    else
        a = c;
    end
end
root = (a + b)/2;
end
