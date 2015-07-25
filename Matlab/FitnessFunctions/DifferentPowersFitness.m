function [fitness] = DifferentPowersFitness(y)
  fitness = 0;
  N = size(y, 2);
  
  for i=1:N
    fitness = fitness + (y(i)^2)^(1 + 5 * ((i - 1) / (N - 1)));
  end
end