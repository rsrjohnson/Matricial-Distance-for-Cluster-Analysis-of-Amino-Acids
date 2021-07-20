function [clct]=centrosclust(clusts,Dnew,k)

clustelement=[];
clct=[];
for i=1:size(clusts,1)
   
    r=find(clusts(i,:));
    
    for j=1:length(r)
    clustelementt=utils.picdat( Dnew,k,clusts(i,r(j)));
    clustelement=[clustelement;clustelementt];
    end
    
    clctt=clustcent(clustelement,k );
    clustelement=[];
    clct=[clct;clctt];
    
end
end