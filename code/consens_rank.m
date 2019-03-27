function [tot_score]=consens_rank(sim_rank_tot,w)
if iscell(sim_rank_tot)
    [m,n]=size(sim_rank_tot{1});
    flag_cell=1;
else
    [m,n]=size(sim_rank_tot);
    flag_cell=0;
end
score=zeros(m,m);%rows:sample,cols:score
lab_samp=[1:m];
tot_score=zeros(m,m);
if flag_cell==1;
    num_measure=length(sim_rank_tot);
else
    num_measure=1;
end
%%%%%%%%different dist consensus%%%%%%%
for i=1:num_measure%which measure
    if flag_cell==1
        tmp_data=sim_rank_tot{i};
    else
        tmp_data=sim_rank_tot;
    end
    for j=1:m%which sample
        score(j,tmp_data(j,:))=lab_samp;
    end
    tot_score=tot_score+w(i)*score;
end