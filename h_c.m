function [] = h_c(s,N)

% % c = linspace(0.001,1,100);
% % h = linspace(0.01,0.1,100);
% % s = 0.1;
% % N = 50;
% 
% x_0 = (4.*N.*s.*(c+h))./(((2.*c)+h).^2);
% x = x_0 - 1;
% 
% % y = h*m*m*N*0.5/((2*c)+h)
%  
% P = @(m,s,c,h,N) (((4.*s)+(((2.*c)+h).*(1-m.^2))).^x).*exp(h.*m.*m.*N.*0.5./((2.*c)+h));
% I = integral(@(m)P(m,s,c,h,N),-1,1,'ArrayValued',true);
% 
% P0 = I;
% 
% Pf = @(m,s,c,h,N,P0) ((((4.*s)+(((2.*c)+h).*(1-m.^2))).^x).*exp(h.*m.*m.*N.*0.5/((2.*c)+h))./P0);
% If = integral(@(m)2*m*Pf(m,s,c,h,N,P0),0,1,'ArrayValued',true);
% 
% 
% fileID = fopen('h_c.txt','w');
% for i = 1:1:size(h,2)
%     h(i);
%     fprintf(fileID,'%f \t %f \t %f\n',h(i),c(i),If(i));
% end

c = linspace(0.001,1000,50); %setting axes range
h = linspace(0.001,1000,50);

% s = 0.0001;
% N = 50;

[C,H] = meshgrid(c,h);

x_0 = (4.*N.*s.*(C+H))./(((2.*C)+H).^2); %Maing the PDF more readable by using compact forms
x_0_prime = (4.*N.*s.*(C+H))./(((2.*C)+H).^2);
x = x_0 - 1;

y = H.*N.*0.5./((2.*C)+H);

C(1,:)
H(1,:)
C(2,:)
H(2,:)
fileID = fopen('H_C.txt','w');
% for i = 1:1:size(c,2)
%     P = @(m,s,C,H,N) (((4.*s)+(((2.*C(i,:))+H(i,:)).*(1-m.^2))).^x).*exp(y.*m.*m)

P = @(m,s,C,H,N) (((4.*s)+(((2.*C)+H).*(1-m.^2))).^x).*exp(y.*m.*m);
I = integral(@(m)P(m,s,C,H,N),-1,1,'ArrayValued',true);

P0 = I; %obtaining the value of P_0, the normalisation constant 
% Pf = @(m,s,C,H,N,P0) ((((4.*s)+(((2.*C(i,:))+H(i,:)).*(1-m.^2))).^x).*exp(y.*m.*m)./P0);
Pf = @(m,s,C,H,N,P0) ((((4.*s)+(((2.*C)+H).*(1-m.^2))).^x).*exp(y.*m.*m)./P0);
If = integral(@(m)2*m*Pf(m,s,C,H,N,P0),0,1,'ArrayValued',true); %using the value of P_0 to obtain the expecation value
%     for j = 1:1:size(h,2)
%         fprintf(fileID,'%f \t %f \t %f\n',H(i,j),c(i,j),If(i));
%     end
% end

surf(C,H,If);colorbar
fclose(fileID)
