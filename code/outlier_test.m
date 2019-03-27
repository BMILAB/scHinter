%rare type test
clear;clc;close all;
load('outlierdata.mat');
Nc=7;
[m,n]=size(data);
cc=floor(m/Nc);
[TOT_rank]=dist_consensus(data);
outlier_candidate=0.1;
both=TOT_rank(:,floor(m*(1-outlier_candidate)):end);
both2=reshape(both,size(both,1)*size(both,2),1);
freq_t=zeros(size(TOT_rank,1),1);
for i=1:length(both2)
    freq_t(both2(i))=freq_t(both2(i))+1;
end
tmp_freq=sort(freq_t,'ascend');
outlier_per=0.05;
flag_freq=tmp_freq(floor(m-m*outlier_per));
ind_flag=find(freq_t>flag_freq);
new_label=1:m;
new_label(ind_flag)=[];

figure(1);
plot(1:m,tmp_freq);
xlabel('Sequence');
ylabel('Times');

[newdata] =tsne(full(data));
character2={'.r','.b','.k','.y','.c','.m'};
ind_col=[2 7 3 1 4 5 6];
figure(2)
for i=1:length(unique(cell_label))-1
    plot(newdata(cell_label==ind_col(i),1),newdata(cell_label==ind_col(i),2),character2{i},'markersize',10);hold on
end
plot(newdata(cell_label==ind_col(i),1),newdata(cell_label==ind_col(i),2),'.','color',[0.2 0.5 0.4],'markersize',10);hold on
xlabel('Dim1');
ylabel('Dim2');
legend('Day 3','Day 4','Day 4 late','Day 5 early','Day 5','Day 6','Day 7');
set(gca,'FontSize',15);  
set(get(gca,'XLabel'),'FontSize',15); 
set(get(gca,'YLabel'),'FontSize',15); 

figure(3)
plot(newdata(ind_flag,1),newdata(ind_flag,2),character2{1},'markersize',10);hold on;
plot(newdata(new_label,1),newdata(new_label,2),character2{2},'markersize',10);hold on;
xlabel('Dim1');
ylabel('Dim2');
legend('Outlier','Other observations')
set(gca,'FontSize',15); 
set(get(gca,'XLabel'),'FontSize',15); 
set(get(gca,'YLabel'),'FontSize',15); 