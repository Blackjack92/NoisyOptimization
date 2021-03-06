function [fitness] = Ellipsoid1Fitness(y)
  y_1 = 0;
  N = size(y, 2);
  
  for i=1:N
    y_1 = y_1 + i*(y(i)^2);  
  end
 
  fitness = y_1;
end