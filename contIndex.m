function  conIndexList = contIndex( map, elmntIndex, contVal )
%contIndex maps from element index to contingency index
%    CONINDEXLIST = CONTINDEX( MAP, ELMNTINDEX, CONTVAL )
%
%   CONINDEXLIST contains the index of contingency from the index of
%   element
%
%   MAP is the corresponding contingency map (contingencies.xxx)
%
%   ELMNTINDEX is the index of an element
%
%   CONTVAL are the values of the contingencies.xxx container
%
%
%   Copyright (c) 2019, Gers USA
%   by Daniel Agudelo-Martinez daniel.agudelo@gers.com.co


% Find the value in the contingencies map of the element with index 'elmntIndex' 
%aux_conIndex=arrayfun(@(x) map.mpc2psse(x), elmntIndex, 'UniformOutput',false);
% Find the index where the value of 'elmntIndex' matches a value in the
% contingencies map
%aux2_conIndex=cellfun(@(x) find(strcmp(contVal,x)), aux_conIndex, 'UniformOutput',false);
aux2_conIndex=arrayfun(@(x) find(strcmp(contVal,map.mpc2psse(x))), elmntIndex, 'UniformOutput',false);
% Data output with adequate format
aux2_conIndex(cellfun('isempty',aux2_conIndex))=[];
conIndexList=cell2mat(aux2_conIndex);

end

