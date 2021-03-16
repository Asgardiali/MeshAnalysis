function A=createCircuit(m,resistance)

s=max(size(resistance));

n=2*m-1; % Devrede bulunan direnç sayýsý

if(s~=n)
    error('Direnç sayýsý uyumsuzdur!!!')
end
r=[];
% Çevrim denklemlerinde tüm gerilimler pozitif deðerli olacak þekilde
% ayarladým.
A=zeros(m);
z=0;

for l=1:1:s
    r(l)=resistance(l);
end

for k=1:1:m-2
%GUI exe dönüþümünde syms hatasý olduðundan dolayý syms tanýmý yapmadým. Fakat eþitlikler aþaðýdaki gibi tanýmlanacaktýr.    
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








