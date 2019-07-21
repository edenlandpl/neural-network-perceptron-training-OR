//---- perceptron trenowanie
//---- okreslenie par wektorow trenujacych
//---- dla funktora AND
A=ones(4,4);
A(1,2)=-1; A(1,3)=-1; A(1,4)=-1;
A(2,2)=-1; A(2,4)=-1;
A(3,3)=-1; A(3,4)=-1;
//---- wykreslenie obszaru klasyfikacji
for i=1:4
    if A(i,4)==1
        plot(A(i,2),A(i,3),'ko:');
     else
        plot(A(i,2),A(i,3),'r+:');
     end
end
mtlb_axis([-2 2 -2 2])
//---- ustalenie poczatkowych wartosci wag
W=[0 0 0];
//---- proces trenowania
disp(W);
Zmiana=1;
while (Zmiana==1)
   Zmiana=0;
     for i=1:4 //--- kolejno pobiera wektory trenujace
        S=A(i,1)*W(1)+A(i,2)*W(2)+A(i,3)*W(3);
        Sig=0;
         if S>0
            Sig=1;
         else
            Sig=-1;
         end
         if ((Sig>0) & (A(i,4)==1)) | ((Sig<0) & (A(i,4)==-1))
            W=W;
         else
            Zmiana=1; 
            if (S~=0)
                for j=1:3
                     W(j)=W(j)+0.5*(A(i,4)-Sig)*A(i,j);
                end
            end
         end
         if S==0
            Zmiana=1;
                for j=1:3
                    W(j)=W(j)+(A(i,4)*A(i,j));
         end
     end
     disp(W);
     end
end
//---- wykreslenie otrzymanej linii podzialu
k=0;
for i=-2:0.01:2
    k=k+1;
     XX(k)=i;
     YY(k)=-((W(2)/W(3))*i)-(W(1)*1)/W(3);
end
plot(XX,YY);
mtlb_axis([-2 2 -2 2]) 
