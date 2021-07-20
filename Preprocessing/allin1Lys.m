function [ Dnew ] = allin1Lys( D,k )



f=size(D,1);

noM=f/k;

piv=picdat( D,k,1);

Dnew=piv;

for t=2:noM

Dorig=picdat( D,k,t);

Dtras=mptosc(piv,Dorig);

Dnew=[Dnew;Dtras];


end


plot3(Dnew(:,1),Dnew(:,2),Dnew(:,3),'*black');
hold all
grid on

plot3(Dnew(3,1),Dnew(3,2),Dnew(3,3),'*r');
plot3(Dnew(1,1),Dnew(1,2),Dnew(1,3),'*g');


 plot3(Dnew(2:3,1),Dnew(2:3,2),Dnew(2:3,3),'b');
 plot3(Dnew(1:2,1),Dnew(1:2,2),Dnew(1:2,3),'b');
 plot3(Dnew([2 4],1),Dnew([2 4],2),Dnew([2 4],3),'b');
 
for l=0:noM-1
    
    plot3(Dnew([2+k*l 5+k*l:9+k*l ],1),Dnew([2+k*l 5+k*l:9+k*l ],2),Dnew([2+k*l 5+k*l:9+k*l ],3),'k');
  
end

end
