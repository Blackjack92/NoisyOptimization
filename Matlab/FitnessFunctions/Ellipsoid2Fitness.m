function [fitness] = Ellipsoid2Fitness(y)
  fitness = 0;
  N = size(y, 2);
  for i=1:N
    fitness = fitness + (i^2) * (y(i)^2);  
  end
end