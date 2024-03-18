syms x;
f_expr = sin(x);
x0 =[12,7];
alpha = 0.1;
epsilon = 1e-6;
max_iter = 1000;

[x_opt, f_opt] = gradient_descent(f_expr, x0, alpha, epsilon, max_iter);

disp(x_opt); % 应该接近于0，因为f(x) = x^2的最小值在x=0处
disp(f_opt); % 应该接近于0，因为f(x) = x^2的最小值是0