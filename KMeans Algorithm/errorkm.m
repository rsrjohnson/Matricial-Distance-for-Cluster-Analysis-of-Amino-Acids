function [ Ea ] = errorkm(clusts,Dnew,k,clct)

for i=1:size(clusts,1)
    
   sub=clusts(i,:);
   r=find(sub);
   d=[];
   if ~isempty(r)
   for j=1:length(r)
      
       d(j)=utils.frodist(utils.picdat(clct,k,i),utils.picdat(Dnew,k,sub(r(j))));
       
   end
   end
    
   Ea(i)=sum(d);
    
end
    
    Ea=sum(Ea);

end

