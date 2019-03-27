function data_new=rdint(data,TOT_rank,sgm,m,thres,f)
% data -  expression matrix
% TOT_rank - similarity ranking between cells
% sgm   -  sigma values for similarity weight
% m    -  num of cells in data
% thres  - expectation of each cluster
% f  -  a shrinkage factor f
sim_mat=[];%Temporary coefficient matrix
for k=1:m%which sample
    tmp=zeros(1,m);
    rand_c=randperm(thres);
    sgm=[sgm(rand_c) sgm(thres+1:end)];
    tmp(TOT_rank(k,:))=sgm;
    sim_mat=[sim_mat;tmp];
end
SM_mat=sim_mat+diag((1-f)*ones(size(data,1),1));
data_new=(SM_mat)*data;