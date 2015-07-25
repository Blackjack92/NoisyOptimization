function [fitness] = SchwefelFitness(y)
  y_1 = 0;
  N = size(y, 2);
  
  for i=1:N
    for j=1:i
      y_1 = y_1 + (y(j)^2);  
    end
  end
 
  fitness = y_1;
end