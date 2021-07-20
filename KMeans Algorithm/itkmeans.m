function [ clustert2,kj,centroidsk ] = itkmeans(resp,Dnew,k)
centroidsk=centrosclust(resp,Dnew,k);

noM=size(Dnew,1)/k;
noC=size(centroidsk,1)/k;

for i=1:noC
    for j=1:noM
        
        distacent(i,j)=utils.frodist(utils.picdat(centroidsk,k,i),utils.picdat(Dnew,k,j));
        
    end
end

for i=1:size(distacent,2)
    
    s=min(distacent(:,i));
    
    r=find(distacent==s,1);
    
    [ki,li] = ind2sub(size(distacent),r);
    
    
    kj(i,1)=i;
    kj(i,2)=ki;
    
    
end

for i=1:noM
   
    clustert1(kj(i,2),kj(i,1))=kj(i,1);
        
end

for i=1:size(clustert1,1)
   
    r=find(clustert1(i,:));
    
    clustert2(i,:)=[r zeros(1,size(clustert1,2)-length(r))];
        
    cont(i)=length(r);
    
end

cant=max(cont);

clustert2(:,cant+1:end)=[];

end

