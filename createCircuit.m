function A=createCircuit(m,resistance)

s=max(size(resistance));

n=2*m-1; % Devrede bulunan diren� say�s�

if(s~=n)
    error('Diren� say�s� uyumsuzdur!!!')
end
r=[];
% �evrim denklemlerinde t�m gerilimler pozitif de�erli olacak �ekilde
% ayarlad�m.
A=zeros(m);
z=0;

for l=1:1:s
    r(l)=resistance(l);
end

for k=1:1:m-2
%GUI exe d�n���m�nde syms hatas� oldu�undan dolay� syms tan�m� yapmad�m. Fakat e�itlikler a�a��daki gibi tan�mlanacakt�r.    
%equ(k+1,1)= (i(k)*r(2*k))+(i(k+1)*(r(2*k+1)+r(2*k+2)-r(2*k)))+(i(k+2)*(-r(2*k+2)))==0;
    
    A(k+1,z+1)=double(r(2*k));
    A(k+1,z+2)=double((r(2*k+1)+r(2*k+2)-r(2*k)));
    A(k+1,z+3)=double((-r(2*k+2)));
    z=z+1;   
end

% equ(1,1)=(i(1)*(r(1)+r(2)))+(i(2)*(-r(2)))==v1;
% equ(m,1)=(i(m)*(r(n-1)-r(n)))+(i(m-1)*(-r(n-1)))==v2;

A(1,1)=double((r(1)+r(2)));
A(1,2)=double((-r(2)));
A(m,m-1)=double((-r(n-1)));
A(m,m)=double(r(n-1)-r(n));








