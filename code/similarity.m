%similarity of single cell
function [result]=similarity(data,varargin)
%Euclidean Distance
if strcmp(varargin,'Euclidean')==1
    ju=zeros(size(data,1),size(data,1));
    id=size(data,1)-1:-1:1;
    Y=pdist(data,'euclidean');
    for i=1:length(id)
        ju(i+1:end,i)=Y(1:id(i));
        Y(1:id(i))=[];
    end
    result=ju+ju';
    
    %Manhattan Distance
elseif strcmp(varargin,'Manhattan')==1
    ju=zeros(size(data,1),size(data,1));
    id=size(data,1)-1:-1:1;
    Y=pdist(data,'cityblock');
    for i=1:length(id)
        ju(i+1:end,i)=Y(1:id(i));
        Y(1:id(i))=[];
    end
    result=ju+ju';
    
    %mahalanobis Distance
elseif strcmp(varargin,'mahalanobis')==1
    ju=zeros(size(data,1),size(data,1));
    id=size(data,1)-1:-1:1;
    Y=pdist(data,'mahalanobis');
    for i=1:length(id)
        ju(i+1:end,i)=Y(1:id(i));
        Y(1:id(i))=[];
    end
    result=ju+ju';
    
    %cosine Distance
elseif strcmp(varargin,'cosine')==1
    ju=zeros(size(data,1),size(data,1));
    id=size(data,1)-1:-1:1;
    Y=pdist(data,'cosine');
    for i=1:length(id)
        ju(i+1:end,i)=Y(1:id(i));
        Y(1:id(i))=[];
    end
    result=ju+ju';
    
    %correlation Distance
elseif strcmp(varargin,'correlation')==1
    ju=zeros(size(data,1),size(data,1));
    id=size(data,1)-1:-1:1;
    Y=pdist(data,'correlation');
    for i=1:length(id)
        ju(i+1:end,i)=Y(1:id(i));
        Y(1:id(i))=[];
    end
    result=ju+ju';
    
    %spearman Distance
elseif strcmp(varargin,'spearman')==1
    ju=zeros(size(data,1),size(data,1));
    id=size(data,1)-1:-1:1;
    Y=pdist(data,'spearman');
    for i=1:length(id)
        ju(i+1:end,i)=Y(1:id(i));
        Y(1:id(i))=[];
    end
    result=ju+ju';
end