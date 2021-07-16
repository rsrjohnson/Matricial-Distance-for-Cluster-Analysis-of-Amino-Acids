function [ D,k,l ] = redmtr( A )

function [dm]= pivmin(A)
    no=size(A,1);
for t=1:no-1
    
        d(t)=min(A(t,(t+1):end));
       
end
dm=min(d);
end

df=pivmin(A);

r=find(A==df, 1, 'last' );

[k,l] = ind2sub(size(A),r);

D=zeros(size(A)-1);

for i=1:size(A)-1
    for j=i+1:size(A)-1
        
        if i==k && j<l
           D(i,j)=min(A(k,j),A(l,j)); 
        end
        
        if i==k && j>=l
           D(i,j)=min(A(k,j+1),A(l,j+1)); 
        end
        
        if i<l && i~=k && j>=l
           D(i,j)=A(i,j+1);            
        end
        
        if i>k  && j<l
            D(i,j)=A(i,j);
        end
        
        if j==k && i~=k
            D(i,j)=min(A(i,k),A(i,l));
        end
            
        
        
        if i>=l && i~=k && j>=l
           D(i,j)=A(i+1,j+1); 
        end
        
        if j<k  
            D(i,j)=A(i,j);
            
        end
         
         if k<j && i<k && j<l
             
             D(i,j)=A(i,j);
             
         end
         
         
        
    end
end

D=D+D';

end