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
%--------------------------------------------------------------------------
function [y_opt, f_dyn, noisy_f_dyn, sigma_dyn, y_dyn, lambda_dyn] = ...
    CMSA_ES(sigma_init, y_init, mu_init, theta_init)
    
    % Initialize input parameters
    sigma = sigma_init;
    y_parent = y_init;
    n = length(y_parent);
    mu = mu_init;
    lambda = floor(mu/theta_init);
    
    % Initialize output parameters
    y_opt = [];
    f_dyn = [];
    noisy_f_dyn = [];
    sigma_dyn = [];
    y_dyn = [];
    lambda_dyn = [];
    
    % Initialize covariance matrix
    C = eye(n);
    
    % Main loop
    
end