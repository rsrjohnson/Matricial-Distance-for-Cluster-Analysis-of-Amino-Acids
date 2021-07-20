function [ cantint ] = countint( veclust )

for i=1:max(veclust(:,2))
   
    cantint(i,1)=i;
    cantint(i,2)=length(find(veclust(:,2)==i));
end

end

