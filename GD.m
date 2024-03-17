% FILEPATH: /e:/code/matlab_code/PSO-GD/GD.m

function [x_opt, f_opt] = gradient_descent(f, grad_f, x0, alpha, epsilon, max_iter)
    % Gradient Descent Algorithm for n-dimensional optimization
    % Inputs:
    %   - f: objective function
    %   - grad_f: gradient of the objective function
    %   - x0: initial point
    %   - alpha: learning rate
    %   - epsilon: convergence threshold
    %   - max_iter: maximum number of iterations
    % Outputs:
    %   - x_opt: optimal solution
    %   - f_opt: optimal function value

    x = x0; % initialize x
    iter = 0; % initialize iteration counter

    while iter < max_iter
        grad = grad_f(x); % compute gradient at current point
        x_new = x - alpha * grad; % update x using gradient descent step

        % Check convergence
        if norm(x_new - x) < epsilon
            break;
        end

        x = x_new; % update x
        iter = iter + 1; % increment iteration counter
    end

    x_opt = x; % optimal solution
    f_opt = f(x_opt); % optimal function value
end
