%simple example
clear;clc;
load('matlab.mat');
Nc=5;%estimated categories
f=0.9;%shrinkage factor
w=[0.2,0.2,0.2,0.2,0.2];
%5 dist equal consensus(Euclidean,Manhattan,Cosine,Pearson,Spearman,respectively); 
[DATA]=SChinter(data,Nc,f,w);