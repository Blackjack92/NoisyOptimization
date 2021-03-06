function [fitness] = TabletFitness(y)
  N = size(y, 2);
  y_1 = y(1)^2;
  y_2 = 0;
  for i=2:N
    y_2 = y_2 + (y(i)^2);
  end
  fitness = 1e6 * y_1 + y_2;
end