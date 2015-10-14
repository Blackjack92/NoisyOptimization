Bug report: 

line 1332 in bibpopcmaes.m: 

   if any(xmean == xmean + 0.2*sqrt(diagC)) 

should correctly read

   if any(xmean == xmean + 0.2*sigma*sqrt(diagC)) 

the code has been changed accordingly, which might have (limited) effects on the outcome of a replication. 


Where to start: readmebibpopcmaes.m


