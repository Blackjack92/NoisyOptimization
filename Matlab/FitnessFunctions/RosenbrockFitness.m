function [fitness] = RosenbrockFitness(y)
  y_1 = 0;
  N = size(y, 2);
  
  for i=1:(N-1)
    y_1 = y_1 + 100*((y(i)^2-y(i+1))^2+(y(i)-1)^2);  
  end
 
  fitness = y_1;
end