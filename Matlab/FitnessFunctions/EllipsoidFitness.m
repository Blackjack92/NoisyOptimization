function [fitness] = EllipsoidFitness(y)
  y_1 = 0;
  N = size(y, 2);
  
  for i=1:N
    y_1 = y_1 + 1e6^((i-1)/(N-1))*(y(i)^2);
  endfor
  
  fitness = y_1;
endfunction