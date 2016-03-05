function MatchedObj = bestmatch1 (NewPecstrumArray,RefPecstrum,C)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 for i = 1:length(NewPecstrumArray(:,1))
 disList(i) = distancef(NewPecstrumArray(i,:),RefPecstrum,C);
 end
  
for i=1:length(disList)
    if disList(i) == min(disList)
        MatchedObj =i;
        break;
    end
end