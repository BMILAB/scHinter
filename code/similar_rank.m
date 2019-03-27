function [dist_ascend,result]=similar_rank(similar)

[m,n]=size(similar);
for i=1:m
    [dist_ascend(i,:),result(i,:)]=sort(similar(i,:),'ascend');
end
