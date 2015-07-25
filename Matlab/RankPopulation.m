% Name:   RankPopulation
% Author: Kevin Wallis
%--------------------------------------------------------------------------
%| Input parameters                                                       |
%--------------------------------------------------------------------------
%| Name                | Type        | Description                        |
%--------------------------------------------------------------------------
%| offspringPopulation | [M x N]     | Offspring population which should  |
%|                     |             | be ranked                          |
%| ordering            | String      | Ordering type                      |
%--------------------------------------------------------------------------
%| Output parameters                                                      |
%--------------------------------------------------------------------------
%| Name                | Type        | Description                        |
%--------------------------------------------------------------------------
%| raning               | [M x N]    | Ranking of the population          |
%--------------------------------------------------------------------------
function [ranking] = RankPopulation(offspringPopulation, ordering)
    % Initialize output
    clear ranking;

    lambda = size(offspringPopulation, 2);
    for l=1:lambda
        indexBestValue = FindBest(offspringPopulation);
        ranking(l) = offspringPopulation(indexBestValue);
        offspringPopulation(indexBestValue).f = inf; 
    end
end

function [index] = FindBest(offspringPopulation)
    % Initialize parameters    
    lambda = size(offspringPopulation, 2);
    bestValue = offspringPopulation(1).f;
    index = 1;
    
    for l=2:lambda
        if (offspringPopulation(l).f < bestValue)
            bestValue = offspringPopulation(l).f;
            index = l;
        end
    end
end