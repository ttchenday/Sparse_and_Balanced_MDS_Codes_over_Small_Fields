clc
clear all
% alg2
disp('Please Input an Even Integer:');
k=input('k=');
tmp=floor(sqrt(k));
out_tmp=['Please Input an Integer u Between 2 and ',num2str(tmp)];
disp(out_tmp);
u=input('u=');
while(u<2||u>tmp)
    disp('Your Input Is Invalid!')
    disp('Please Input an Even Integer >= 46:');
    k=input('k=');
    tmp=floor(sqrt(k));
    out_tmp=['Please input an integer u between 2 and ',num2str(tmp)];
    disp(out_tmp);
    u=input('u=');
end

%--------------------------------------------------------------
%Initialization
n=k+u;
a=k-u;
c=k-u-1;
if a==c
    b=0;
else
    b=c;
end

theta=u*(u-1);
Ms=ones(k,n);

for i=1:1:u+2
    for j=i:1:i+k-2
        Ms(i,j)=0;
    end
end

for i=u+3:1:k
    for j=1:1:i-(u+2)
        Ms(i,j)=0;
    end
    for j=i:1:n
        Ms(i,j)=0;
    end
end

tmp_vector=k-sum(Ms);
%Step3-4-----------------------------------------------------------------------------------------------------------

for j1=k:1:n-2
    for j2=1:1:u*(u-1)/2
        for i=3:1:u*(u-1)/2+2
            if tmp_vector(j2)<a && tmp_vector(j1)>a && Ms(i,j1)==0 && Ms(i,j2)==1
                Ms(i,j1)=1;
                Ms(i,j2)=0;
                tmp_vector(j1)=tmp_vector(j1)-1;
                tmp_vector(j2)=tmp_vector(j2)+1;
            end
        end
    end
end

%Step5-6-----------------------------------------------------------------------------------------------------------

for j1=a+1:1:k-1
    for j2=u*(u-1)/2+1:1:u*(u-1)
        for i=u*(u-1)/2+3:1:u*(u-1)+2
            if tmp_vector(j2)<a && tmp_vector(j1)>a && Ms(i,j1)==0 && Ms(i,j2)==1
                Ms(i,j1)=1;
                Ms(i,j2)=0;
                tmp_vector(j1)=tmp_vector(j1)-1;
                tmp_vector(j2)=tmp_vector(j2)+1;
            end
        end
    end
end

%--------------------------------------------------------------
% check final results
flag=0;
for i = tmp_vector
    if i~=a && i~=b
        flag=1;
    end
end
if(flag==0)
    disp('Output Matrix is :')
    disp(tmp_vector);
    disp("successful!");
end




