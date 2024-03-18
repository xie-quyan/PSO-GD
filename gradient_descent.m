function [x_opt, f_opt] = gradient_descent(f_expr, x0, alpha, epsilon, max_iter)
  % 梯度下降算法用于n维优化
  % 输入:
  %   - f_expr: 目标函数表达式
  %   - x0: n维自变量的初始值
  %   - alpha: 学习率
  %   - epsilon: 收敛阈值
  %   - max_iter: 最大迭代次数
  % 输出:
  %   - x_opt: 最优解
  %   - f_opt: 最优函数值

  x = x0; % 初始化x
  iter = 0; % 初始化迭代次数计数器

  grad_f = gradient(f_expr); % 计算目标函数的梯度

  while iter < max_iter
      grad = double(subs(grad_f, symvar(f_expr), x)); % 计算当前点的梯度
      x_new = x - alpha * grad; % 使用梯度下降步骤更新x

      % 检查收敛
      if norm(x_new - x) < epsilon
          break;
      end

      x = x_new; % 更新x
      iter = iter + 1; % 增加迭代次数计数器
  end

  x_opt = x; % 最优解
  f_opt = double(subs(f_expr, symvar(f_expr), x_opt)); % 最优函数值
end