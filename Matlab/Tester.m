% Name:   Tester
% Author: Kevin Wallis

more off;

sigma_init = 1;
y_init = [30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30; ...
    30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30];
% linspace(1,30,30);
n = 30;
% y_init =ones(n,1);
mu_init = 3;
theta_init = 1/3;
noisy_f_name = 'NoisyEllipsoidFitness';
goal_f_name = 'EllipsoidFitness';

[y_opt, f_dyn, noisy_f_dyn, sigma_dyn, y_dyn, lambda_dyn, fev_dyn] = ...
    CMSA_ES(sigma_init, y_init, mu_init, theta_init, noisy_f_name, goal_f_name);

figure(1)
hold on;
% semilogy(f_dyn)
semilogy(noisy_f_dyn)

[y_opt, f_dyn, noisy_f_dyn, sigma_dyn, y_dyn, lambda_dyn, fev_dyn] = ...
    PC_CMSA_ES(sigma_init, y_init, mu_init, theta_init, noisy_f_name, goal_f_name);

figure(2)
hold on;
% semilogy(f_dyn)
semilogy(noisy_f_dyn)