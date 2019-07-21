//---- perceptron trenowanie
//---- okreslenie par wektorow trenujacych
//---- dla funktora OR
A=ones(8,5);        // większa tabela, trzywejściowa funkcja logiczna
A(1,2)=-1; A(1,3)=-1; A(1,4)=-1; A(1,5)=-1;
A(2,2)=-1; A(2,3)=-1; A(2,5)=-1;
A(3,2)=-1; A(3,4)=-1; A(3,5)=-1;
A(4,2)=-1; A(4,5)=-1;
A(5,3)=-1; A(5,4)=-1; A(5,5)=-1;
A(6,3)=-1;
A(7,4)=-1; A(7,5)=-1;
A(8,5)=-1; // tutaj zakończone .... dalej poprawic

//---- wykreslenie obszaru klasyfikacji
for i=1:5
    if A(i,5)==1
        plot(A(i,2),A(i,3),'ko:');
     else
        plot(A(i,2),A(i,3),'r+:');
     end
end
mtlb_axis([-2 2 -2 2])
//---- ustalenie poczatkowych wartosci wag
W=[0 0 0 0];        // poszerzenie wartosci wag o element
//---- proces trenowania
disp(W);            // wektor wag, zmieniany dynamicznie w zależności czy jest poprawny, zapamiętany w W(x)
Zmiana=1;
while (Zmiana==1)
   Zmiana=0;
     for i=1:4      //--- kolejno pobiera wektory trenujace
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
// zapytanie o u1 i u2. proces trenowania, odpowiedz 

u1 = input('Podaj u1: ');
u2 = input('Podaj u2: ');


S = 1 * W(1) + u1 * W(2) + u2 * W(3); // sprawdzanie klasyfikacji, wg wcześniejszej tabeli (macierzy) na podstawie wyuczonego zestawu wag W(x)
Sig = 0;        // zerowanie 

if S > 0 then   // sprawdzamy znak, większe mniejsze od 0
    Sig = 1;
end
if S < 0 then
    Sig = -1;
end
disp(Sig,'Sig = ');

//---- wykreslenie otrzymanej linii podzialu
k=0;
for i=-2:0.01:2
    k=k+1;
     XX(k)=i;
     YY(k)=-((W(2)/W(3))*i)-(W(1)*1)/W(3);
end
plot(XX,YY);
mtlb_axis([-2 2 -2 2]) 
