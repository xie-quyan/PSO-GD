
f_expr = @weierstrass;
x0 = rand(1);
alpha = 1e-3;
epsilon = 1e-6;
max_iter = 1000;

[x_opt, f_opt] = gradient_descent(f_expr, x0, alpha, epsilon, max_iter);
x0
disp(x_opt); % 应该接近于0，因为f(x) = x^2的最小值在x=0处
disp(f_opt); % 应该接近于0，因为f(x) = x^2的最小值是0