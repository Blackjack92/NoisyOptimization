function [fitness] = SharpRidgeFitness(y)
  y_1 = -y(1);
  y_2 = 0;
  N = size(y, 2);
  
  for i=2:N
    y_2 = y_2 + (y(i)^2);  
  endfor
 
  fitness = y_1 + 100 * sqrt(y_2);
endfunction