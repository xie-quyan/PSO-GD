function [x_opt, f_opt] = gradient_descent(f_expr, x0, alpha, epsilon, max_iter, upper, lower)
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
  last_step = 1e-2; % 上一步的梯度
  h = 1e-6; % 适当小的值  

  while iter < max_iter
      xp = x + h;
      xm = x - h;
      grad = (f_expr(xp) - f_expr(xm)) / (2 * h); % 使用一阶差分法计算梯度
      x_tem = x - alpha * grad;
      while (abs(last_step)*2 < abs(grad*alpha)) || any([x_tem - lower,1]< 0) || any([x_tem - upper,-1]> 0)
        alpha = alpha / 2;
          x_tem = x - alpha * grad;
      end
      x_new = x - alpha * grad; % 使用梯度下降步骤更新x

      % 检查收敛
      if norm(x_new - x) < epsilon
          break;
      end

      x = x_new; % 更新x
      iter = iter + 1; % 增加迭代次数计数器
  end

  x_opt = x; % 最优解
  f_opt = f_expr(x); % 最优函数值
end