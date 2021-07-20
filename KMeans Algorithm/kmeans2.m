% Algoritmo de k-means


function [clustertemp,asigs,ctr ] = kmeans2(D,k,NoC,e,~)

if nargin<5
  Dnew = D;
else
    
   Dnew=utils.transform(D,k);
    
end


%%%%% Representando aminoacidos y realizando traslaciones

noM=size(D,1)/k;

%%%%%%%%%%

%Eligiendo centros iniciales

 seed=8466;
 rng(seed)
 z=randperm(noM);
 
 z=z(1:NoC);


%%%%%%%%%%
   
 %%%Formando Clusters 
   
   ODat=1:noM;
   for i=1:length(z)
   ODat(z(i))=0;
   end
   
   ODat=find(ODat);
   
   
    Mdist=utils.mdisfro(Dnew,k);
    
    
    
    for i=1:length(z)
        for j=1:length(ODat)
            c(i,j)=Mdist(z(i),ODat(j));
        end
    end
    
   
   for i=1:size(c,2)
      
       s=min(c(:,i));
       
       r=find(Mdist==s, 1, 'last' );

      [ki,li] = ind2sub(size(Mdist),r);
       
     
     kj(i,1)=ki;
     kj(i,2)=li;
    
       
   end
   
   
   indj=[];
   
   for i=1:size(kj,1)
       
          if sum(kj(i,1)==z)==1
           kv(i)=kj(i,1);
          else kv(i)=kj(i,2);
          end
           
           
   end 
   
       
       clust=zeros(length(z),length(ODat));
     
      
   for i=1:size(kj,1)
      for j=1:size(kj,1)
      indfila(j,:)=kv(i)==kj(j,:);
       
      end
      
      for t=1:size(kj,1)
          
         if sum(indfila(t,:))==1
            ind=t ;
            indj=[indj;ind];
         end
         
      end
      
      if ~isempty(indj)
      clust(i,1:length(indj)+1)=[kv(i) ODat(indj)];   
      end
      
      ODat(indj)=[];
      kj(indj,:)=[];
      indj=[];
      
   end
   
   c1=clust(:,1);
   resp=clust;
   
   if sum(find(c1==0))>0
       %zt=z;
       for i=1:length(c1)
           
           r=find(z==c1(i));
           
           %a=ind2sub(length(z),r);
           
           z(r)=[];
           
       end
       
       clustf=[];
       
       for i=1:size(clust,1)
           
           if sum(clust(i,:))>0
               clustf=[clustf;clust(i,:)];
               
           end
           
          
       end
       
       for i=1:length(z)
          clustf=[clustf;[z(i) zeros(1,size(clustf,2)-1)]] ;
           
       end
      
       resp=clustf;

   end
   
   %Error inicial
   for i=1:NoC
       subresp=resp(i,:);
       r=find(subresp);
       d=[];
       if length(r)>1
           for j=2:length(r)
               d(j-1)=Mdist(subresp(r(1)),subresp(r(j)));
           end
           E(i)=sum(d);
       end
       
   end

E1=sum(E);
   
% Calculando centros y función de error
    
[clustertemp,asigs,ctr]=itkmeans( resp,Dnew,k);
Ea=errorkm(clustertemp,Dnew,k,ctr);
Et=E1;

while abs(Ea-Et)>e
    
    Et=Ea;
    [clustertemp,asigs,ctr]=itkmeans(clustertemp,Dnew,k);
    Ea=errorkm(clustertemp,Dnew,k,ctr);
   

end  
     
end
