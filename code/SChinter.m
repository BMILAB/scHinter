function [DATA]=SChinter(data,Nc,f,w)
%data -  m*n expression matrix m:rows-cells,n:cols-gens
%Nc -the estimated categories
%f  -  a shrinkage factor f
%w  -  weight of different distance 
libsize = sum(data,2);
data = bsxfun(@rdivide, data, libsize) * median(libsize);
[TOT_rank]=dist_consensus(data,w);
[m,n]=size(data);
mean_num=floor(log2(m/Nc));
ex=2.^(1:mean_num);
thres=floor(m/Nc*0.9);

data_new=data;
for qq=1:length(ex)
    x=1:size(data,1);
    p=1/ex(qq);
    sgm=f*(1-p).^(x-1).*p;
    data_new=rdint(data_new,TOT_rank,sgm,m,thres,f);
    
end

DATA=data_new;
