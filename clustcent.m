function [ cc ] = clustcent( D,k )


noM=size(D,1)/k;
s=utils.picdat( D,k,1);

for i=2:noM
   s=s+utils.picdat( D,k,i);
end

cc=s/noM;

end

