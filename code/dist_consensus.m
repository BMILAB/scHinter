function [tot_score]=dist_consensus(data,w)
[sm_e]=similarity(data,'Euclidean');
[sm_m]=similarity(data,'Manhattan');
[sm_c]=similarity(data,'cosine');%good
[sm_r]=similarity(data,'correlation');
[sm_s]=similarity(data,'spearman');

SM={sm_e,sm_m,sm_c,sm_r,sm_s};

for j=1:length(SM)%which measure
    [dist_ascend{j},rank{j}]=similar_rank(SM{j});
end
[consen_rank]=consens_rank(rank,w);
[~,tot_score]=similar_rank(consen_rank);
% [tot_rank]=consens_rank(tot_score);
% TOT_rank=tot_rank;