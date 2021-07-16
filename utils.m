classdef utils
    
    methods(Static)
        
        function [ A ] = picdat( D,k,inde )

            A= D(1+(inde-1)*k:inde*k,1:end);

        end
        
        function [ D ] = frodist(A,B )

            D=norm(A-B,'fro');

        end        
            
        function [ B ] = mptosc(A,B)

            n=size(A,1);

            for i=1:4

                h1=A(i,1)-B(i,1);
                h2=A(i,2)-B(i,2);
                h3=A(i,3)-B(i,3);

                for k=i:n

                    B(k,1)=B(k,1)+h1;
                    B(k,2)=B(k,2)+h2;
                    B(k,3)=B(k,3)+h3;


                end
            end

        end
        
        
        function [ mdd ] = mdisfro( Dnew,k )

            noM=size(Dnew,1)/k;
            for i=1:noM
                for j=i:noM

                    mdd(i,j)=utils.frodist(utils.picdat( Dnew,k,i ),utils.picdat( Dnew,k,j));

                end
            end

            mdd=mdd+mdd';

        end
        
        function [Dnew]=transform(D,k)
            
            piv=utils.picdat( D,k,1);

            Dnew=piv;
            
            noM=size(D,1)/k;

            for t=2:noM

                Dorig=utils.picdat( D,k,t);

                Dtras=utils.mptosc(piv,Dorig);

                Dnew=[Dnew;Dtras];

            end
        end

        
    end
end


