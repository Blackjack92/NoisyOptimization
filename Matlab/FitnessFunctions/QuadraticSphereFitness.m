% fitness function
function [fitness] = QuadraticSphereFitness(y)
  fitness = abs(y*y');
end