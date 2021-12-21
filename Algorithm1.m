clear all;
clc;
% alg1
disp('Please Input an Even Integer >= 46:');
k=input('k=');
tmp=floor((sqrt((8*k)+1)-1)/2);
out_tmp=['Please Input an Intergetr < ',num2str(tmp)];
disp(out_tmp);
m=input('m=');
while(k<46 || m>tmp)
    disp('Your Input Is Invalid!')
    disp('Please Input an Even Integer >=46:');
    k=input('k=');
    tmp=floor((sqrt((8*k)+1)-1)/2);
    out_tmp=['Please Input an Intergetr < ',num2str(tmp)];
    disp(out_tmp);
    m=input('m=');
end

% start alg
t=4*m+1;
n=2*k-t;
% construct the initial matrix
Ms = ones(k,n);
for i=1:1:k/2
    for j=i:1:i+k-2
        Ms(i,j)=0;
    end
end
for i=k/2+1:1:k
    for j1=1:1:m-1+i-k/2
        Ms(i,j1)=0;
    end
    for j2=k-3*m+i-k/2:1:n
        Ms(i,j2)=0;
    end
end

%--------------------------------------------------------------
%  step3
for i = k/2-m+2:1:k/2
    for j1=1:1:i-(k/2-m+1)
        Ms(i,j1)=0;
    end
    for j2=3*k/2-2*m:1:3*k/2-2*m+i-(k/2-m+2)
        Ms(i,j2)=1;
    end
end

%--------------------------------------------------------------
% step4
for i=k/2-2*m+2:1:k/2-m
    for j1=3*k/2-3*m:1:3*k/2-3*m+i-(k/2-2*m+2)
        Ms(i,j1)=1;
    end
    for j2=3*k/2-2-(i-(k/2-2*m+2)):1:3*k/2-2
        Ms(i,j2)=0;
    end
end

%--------------------------------------------------------------
% step5
for i=k/2-m+1:1:k/2
    for j1=3*k/2-4*m*m+m-1:1:3/2*k-2*m-1
        Ms(i,j1)=1;
    end
    for j2=3*k/2-1:1:3*k/2+4*m*m-3*m-1
        Ms(i,j2)=0;
    end
end

%--------------------------------------------------------------
% step6
for i=k/2-m+2:1:k/2
    for j1=k+2*m-1:1:3*k/2-4*m*m+m-2
        Ms(i,j1)=1;
    end
    for j2=3*k/2+4*m*m-3*m:1:n
        Ms(i,j2)=0;
    end
end

%--------------------------------------------------------------
% step7
for i=k/2+1:1:k/2+m-1
    for j1=i:1:k/2+m-1
        Ms(i,j1)=0;
    end
    for j2=3*k/2-4*m+(i-k/2):1:3*k/2-3*m-1
        Ms(i,j2)=1;
    end
end

%--------------------------------------------------------------
% step8
for i=k/2+2:1:k/2+m
    for j1=k-3*m+1:1:k-3*m+(i-k/2-1)
        Ms(i,j1)=0;
    end
    for j2=3*k/2-4*m:1:3*k/2-4*m-1+(i-k/2-1)
        Ms(i,j2)=1;
    end
end

%--------------------------------------------------------------
tmp_vector=k-sum(Ms);
for i=k/2+1:1:k
    for j1=k/2+m:1:k-3*m
        for j2=k-2*m+1:1:3*k/2-4*m-1
            if tmp_vector(j1)<(k+2*m)/2 && tmp_vector(j2)>(k+2*m)/2
                if Ms(i,j1)==1 && Ms(i,j2)==0
                    Ms(i,j1)=0;
                    Ms(i,j2)=1;
                    tmp_vector(j1)=tmp_vector(j1)+1;
                    tmp_vector(j2)=tmp_vector(j2)-1;
                end
            end
        end
    end
end

%--------------------------------------------------------------
% check final results
flag=0;
for i = tmp_vector
    if i~=(k+2*m)/2 && i~=(k+2*m)/2-1
        flag=1;
    end
end
if(flag==0)   
    disp('Output Matrix is :')
    disp(tmp_vector);
    disp("successful!");
end



