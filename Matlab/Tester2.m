% Add relative path, so the functions do not need to be in the same
% subdirectory
mfilepath=fileparts(which(mfilename));
addpath(fullfile(mfilepath,'/FitnessFunctions'));

y_init = [30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30; ...
    30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30;30];

[fitness] = RosenbrockFitness(y_init);

plot(fitness)