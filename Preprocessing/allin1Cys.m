function [ Dnew ] = allin1Cys( D,k )

Dnew=utils.transform(D,k);

plot3(Dnew(:,1),Dnew(:,2),Dnew(:,3),'*black');
hold all
grid on

plot3(Dnew(2:3,1),Dnew(2:3,2),Dnew(2:3,3),'-b'); %Backbone
%legend('Backbone','Location','Best');

plot3(Dnew(3,1),Dnew(3,2),Dnew(3,3),'*r'); %Carboxilo
plot3(Dnew(1,1),Dnew(1,2),Dnew(1,3),'*g'); %Amino




plot3(Dnew(1:2,1),Dnew(1:2,2),Dnew(1:2,3),'b');
plot3(Dnew([2 4],1),Dnew([2 4],2),Dnew([2 4],3),'b');

 
 
noM=size(D,1)/k;
 
for l=0:noM-1
    
    plot3(Dnew([2+k*l 5+k*l:6+k*l ],1),Dnew([2+k*l 5+k*l:6+k*l ],2),Dnew([2+k*l 5+k*l:6+k*l ],3),'k');
  
end
end

