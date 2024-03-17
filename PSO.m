% FILEPATH: /e:/code/matlab_code/PSO-GD/PSO.m

function [bestPosition, bestFitness] = PSO(problem, swarmSize, maxIterations)
    % Initialize swarm
    swarm = initializeSwarm(problem, swarmSize);
    
    % Initialize best position and fitness
    bestPosition = swarm(1).position;
    bestFitness = swarm(1).fitness;
    
    % Main loop
    for iteration = 1:maxIterations
        % Update particle positions and velocities
        swarm = updateParticles(swarm, bestPosition);
        
        % Evaluate fitness for each particle
        swarm = evaluateFitness(swarm, problem);
        
        % Update best position and fitness
        for i = 1:swarmSize
            if swarm(i).fitness < bestFitness
                bestPosition = swarm(i).position;
                bestFitness = swarm(i).fitness;
            end
        end
    end
end
