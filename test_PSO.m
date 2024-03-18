% 定义问题实例
problem.fitnessFunction = @(x) x^2; % 适应度函数
problem.lowerBound = -10; % 自变量的下界
problem.upperBound = 10; % 自变量的上界
problem.dimension = 1; % 自变量的维度

% 粒子群大小和最大迭代次数
swarmSize = 20;
maxIterations = 100;
inertiaWeight = 0.729; % 惯性权重
cognitiveWeight = 1.49445; % 认知权重
socialWeight = 1.49445; % 社会权重

% 运行粒子群优化算法
[bestPosition, bestFitness] = PSO(problem, swarmSize, maxIterations, inertiaWeight, cognitiveWeight, socialWeight);

% 显示结果
disp(bestPosition); % 应该接近于0，因为f(x) = x^2的最小值在x=0处
disp(bestFitness); % 应该接近于0，因为f(x) = x^2的最小值是0