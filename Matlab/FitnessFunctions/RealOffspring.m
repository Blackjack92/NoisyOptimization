% function to create offsprings
function [y_offspring] = RealOffspring(y_parental, sigma)
  mutation = randn(size(y_parental, 2), 1);
  y_offspring = y_parental + sigma * (mutation');
end