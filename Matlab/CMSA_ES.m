% Name:   CMSA_ES
% Author: Kevin Wallis
%--------------------------------------------------------------------------
%| Input parameters                                                       |
%--------------------------------------------------------------------------
%| Name                | Type        | Description                        |
%--------------------------------------------------------------------------
%| sigma_init          | Real        | Scaling factor/ Mutation strength  |
%| y_init              | [N]         | Initialization vector              |
%| mu_init             | Integer     | Number of parents                  |
%| theta_init          | Real        | Ratio between mu/lambda            |
%--------------------------------------------------------------------------
%| Output parameters                                                      |
%--------------------------------------------------------------------------
%| Name                | Type        | Description                        |
%--------------------------------------------------------------------------
%| y_opt               | [N]         | Optimal output vector              |
%| f_dyn               | [M]         | Fitness value after each run       |
%| noisy_f_dyn         | [M]         | Noisy fitness value after each run |
%| sigma_dyn           | [M]         | Mutation strength after each run   |
%| y_dyn               | [M x N]     | y vector after each run            |
%| lambda_dyn          | [M]         | Number of offsprings after each run|
%| noisy_f_name        | String      | Noisy function name                |
%| goal_f_name         | String      | Goal function name                 |
%| fev_dyn             | [M]         | Function evaluations after each run|
%--------------------------------------------------------------------------
function [y_opt, f_dyn, noisy_f_dyn, sigma_dyn, y_dyn, lambda_dyn, fev_dyn] = ...
    CMSA_ES(sigma_init, y_init, mu_init, theta_init, noisy_f_name, goal_f_name)
    
    % Add relative path to the fitness functions
    mfilepath=fileparts(which(mfilename));
    addpath(fullfile(mfilepath,'/FitnessFunctions'));
    addpath(fullfile(mfilepath,'/NoisyFitnessFunctions'));

    % Initialize input parameters
    parent.sigma = sigma_init;
    parent.y = y_init;
    n = length(y_init);
    mu = mu_init;
    lambda = floor(mu/theta_init);
    
    % Initialize number of runs
    numberOfRuns = 1000;
    generation = 0;
    fevaluations = 0;
    
    % Initialize output parameters
    sigma_dyn = [];
    y_dyn = zeros(n, numberOfRuns);
    f_dyn = zeros(numberOfRuns);
    noisy_f_dyn = zeros(numberOfRuns);
    sigman_dyn = zeros(numberOfRuns);
    fev_dyn = zeros(numberOfRuns);
    lambda_dyn = zeros(numberOfRuns);
    
    % Initialize covariance matrix
    C = eye(n);
    adjacence_C = 1; 
    
    % Initialize tau
    tau_sigma = 1/sqrt(2*n);
    tau_c = 1 + n*(n+1)/(2*mu);
    
    % Offsrping struct
    offspring_t = struct('sigma', 1, 's', 1, 'z', 1, 'y', [], 'f', 0);
    
    % Main loop
    while (numberOfRuns > 0) 
       numberOfRuns = numberOfRuns - 1;
       
       % Performance improvement
       %clear offspringPopulation;
       offspringPopulation = repmat(offspring_t, 1,lambda);

       % Generate offsprings
       for l=1:lambda
           offspring.sigma = parent.sigma * exp(tau_sigma*randn(1));
           offspring.s = chol(C)' * randn(n,1);
           offspring.z = offspring.sigma .* offspring.s;
           offspring.y = parent.y + offspring.z;
           offspring.f = feval(noisy_f_name, offspring.y);
           offspringPopulation(l) = offspring;
       end
       
        % Ordering
        ranks = RankPopulation(offspringPopulation, '');
        
        % Selection
        sum.sigma = 0;
        sum.y = 0; 
        sum.s = 0;
        
        for m=1:mu
          sum.sigma = sum.sigma + ranks(m).sigma;
          sum.s = sum.s + ranks(m).s;
          sum.y = sum.y + ranks(m).y;
        end
        
        % Centroid evaluation
        parent.sigma = sum.sigma/mu;
        parent.s = sum.s ./ mu;
        parent.y = sum.y ./ mu;
        parent.f = feval(goal_f_name, parent.y);
        parent.f_noisy = feval(noisy_f_name, parent.y);
        
        % Covariance matrix update
        C = (1 - 1/tau_c) .^ adjacence_C.*C + adjacence_C/tau_c.*(parent.s*parent.s');
        
        % Create output
        generation = generation + 1;
        f_dyn(generation) = parent.f;
        noisy_f_dyn(generation) = parent.f_noisy;
        sigman_dyn(generation) = parent.sigma;
        y_dyn(:, generation) = parent.y;
        fev_dyn(generation) = fevaluations + lambda;
        lambda_dyn(generation) = lambda;
    end
    
    y_opt = parent.y;
    
end