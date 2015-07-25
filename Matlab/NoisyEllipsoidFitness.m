function [fitness] = NoisyEllipsoidFitness(y)
  y_1 = 0;
  N = size(y, 2);
  
  for i=1:N
    y_1 = y_1 + i*(y(i)^2) + randn(1);  
  end
 
  fitness = y_1;
end
