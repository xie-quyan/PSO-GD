% 定义一个粒子群优化（PSO）算法函数
% 输入参数包括问题实例、粒子群大小、最大迭代次数
% 输出最优位置与最优适应度

function [bestPosition, bestFitness] = PSO(problem, swarmSize, maxIterations, inertiaWeight_out, cognitiveWeight_out, socialWeight_out)
    
    global inertiaWeight cognitiveWeight socialWeight;
    inertiaWeight = inertiaWeight_out;
    cognitiveWeight = cognitiveWeight_out;
    socialWeight = socialWeight_out;
    
    % 初始化粒子群
    swarm = initializeSwarm(problem, swarmSize);
    
    % 初始化最佳位置和最佳适应度
    [bestFitness, site] = min(swarm(1).fitness);
    bestPosition = swarm(site).position;

    % 主循环
    for iteration = 1:maxIterations
        % 更新粒子的位置和速度
        swarm = updateParticles(swarm, bestPosition,problem);
        
        % 评估每个粒子的适应度
        swarm = evaluateFitness(swarm, problem);
        
        % 更新最佳位置和适应度
        for i = 1:swarmSize
            if swarm(i).fitness < bestFitness
                bestPosition = swarm(i).position;
                bestFitness = swarm(i).fitness;
            end
        end
    end
end

% 初始化粒子群
function swarm = initializeSwarm(problem, swarmSize)
    swarm(swarmSize) = struct('position', [], 'velocity', [], 'fitness', [], 'bestPosition', [], 'bestFitness', []);
    for i = 1:swarmSize
        % 随机生成粒子的初始位置
        swarm(i).position = rand(1, problem.dimension) .* (problem.upperBound - problem.lowerBound) + problem.lowerBound;
        swarm(i).bestPosition = swarm(i).position;
        
        % 初始化粒子的速度为零向量
        swarm(i).velocity = zeros(1, problem.dimension);
        
        % 计算粒子的初始适应度
        swarm(i).fitness = problem.fitnessFunction(swarm(i).position);
        swarm(i).bestFitness = swarm(i).fitness;
    end
end

% 更新粒子的位置和速度，并考虑边界影响
function swarm = updateParticles(swarm, bestPosition, problem)
    global inertiaWeight  % 惯性权重
    global cognitiveWeight  % 认知权重
    global socialWeight  % 社会权重
    
    for i = 1:length(swarm)
        % 更新粒子的速度
        swarm(i).velocity = inertiaWeight * swarm(i).velocity ...
            + cognitiveWeight * rand(1) * (swarm(i).bestPosition - swarm(i).position) ...
            + socialWeight * rand(1) * (bestPosition - swarm(i).position);
        
        % 更新粒子的位置
        swarm(i).position = swarm(i).position + swarm(i).velocity;

        % 考虑边界影响
        % 限制粒子的位置在问题定义的边界内
        swarm(i).position = max(swarm(i).position, problem.lowerBound);
        swarm(i).position = min(swarm(i).position, problem.upperBound);
    end
end

% 评估每个粒子的适应度
function swarm = evaluateFitness(swarm, problem)
    for i = 1:length(swarm)
        % 计算粒子的适应度
        swarm(i).fitness = problem.fitnessFunction(swarm(i).position);
        [swarm(i).position, swarm(i).fitness] = gradient_descent(problem.fitnessFunction, swarm(i).position, 1e-3, 1e-6, 200, problem.upperBound, problem.lowerBound);

        % 更新粒子的最佳位置和适应度
        if swarm(i).fitness < swarm(i).bestFitness
            swarm(i).bestPosition = swarm(i).position;
            swarm(i).bestFitness = swarm(i).fitness;
        end
    end
end