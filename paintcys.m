function [ ] = paintcys(Dnew,k,clustmember,Mc )

ind=clustmember(:,2);

ind2=find(ind);

indft=ind(ind2(1));

for i=2:length(ind2)
 
indf=ind(ind2(i));

if indf ~=indft(1:end)
indft=[indft;indf];
end

end


for i=1:length(indft)
    a=find(ind==indft(i));
    for j=1:length(a)
        M=utils.picdat(Dnew,k,a(j));
        plot3(M([2 5:6],1),M([2 5:6],2),M([2 5:6],3),'Color',Mc(i,:));
        hold all
        
    end
end



end

