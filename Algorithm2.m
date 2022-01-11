clear all;
clc;
% alg1
disp('Please Input an Even Integer >= 4:');
k=input('k=');
tmp1=ceil((sqrt((8*k)+1)+1)/2);
tmp2=floor(k-sqrt(k));
out_tmp=['Please Input an Intergetr < ',num2str(tmp2),'> ',num2str(tmp1)];
disp(out_tmp);
t=input('t=');
while(k<4 || t>tmp2 || t<tmp1)
    disp('Your Input Is Invalid!')
    disp('Please Input an Even Integer >=4:');
    k=input('k=');
    tmp1=ceil((sqrt((8*k)+1)+1)/2);
    tmp2=floor(k-sqrt(k));
    out_tmp=['Please Input an Intergetr < ',num2str(tmp2),'> ',num2str(tmp1)];
    disp(out_tmp);
    t=input('t=');
end

%--------------------------------------------------------------
%Initialization
n=2*k-t;
a=ceil((k*(k-1))/(2*k-t));
c=floor((k*(k-1))/(2*k-t));
if a==c
    b=0;
else
    b=c;
end

theta=modp(k*(k-1),n);
Ms=ones(k,n);

%theta>=n/2
if theta>=n/2
    for i = 1:1:k-a+1
        for j=i:1:i+k-2
            Ms(i,j)=0;
        end
    end
    for i = k-a+2:1:k/2
        for j=1:1:i-(k-a+1)
            Ms(i,j)=0;
        end
        for j=i:1:2*k-a-1
            Ms(i,j)=0;
        end
    end
    for i=k/2+1:1:k
        for j=1:1:a-k/2-1+i-k/2
            Ms(i,j)=0;
        end
        for j=k/2+a+1-t+i-k/2:1:n
            Ms(i,j)=0;
        end
    end
else %theta<n/2
    for i = 1:1:k-a+2
        for j=i:1:i+k-2
            Ms(i,j)=0;
        end
    end
    for i = k-a+3:1:k/2
        for j=1:1:i-(k-a+2)
            Ms(i,j)=0;
        end
        for j=i:1:2*k-a
            Ms(i,j)=0;
        end
    end
    for i=k/2+1:1:k
        for j=1:1:a-k/2-2+i-k/2
            Ms(i,j)=0;
        end
        for j=k/2+a-t+i-k/2:1:n
            Ms(i,j)=0;
        end
    end
end

tmp_vector=k-sum(Ms);
count_first_a=size(find(tmp_vector(1:k/2)==a),2)+size(find(tmp_vector(k:n)==a),2);
count_first_b=size(find(tmp_vector(1:k/2)==b),2)+size(find(tmp_vector(k:n)==b),2);
%if theta>=n/2
if theta>=n/2
    count_IV_a=size(find(tmp_vector(2*k-a:n)==a),2);
    count_IV_b=size(find(tmp_vector(2*k-a:n)==b),2);
    flag=0;
    % Step3(move the extra zeros in column [k+a-t+1,2k-a-1] to column [2k-a,n])-----------------------------------------------------------------------------------------------------------------------------------
    flag_a=a;
    flag_b=b;
    
    for j2=n:-1:2*k-a
        for j1=2*k-a-1:-1:k+a-t+1
            for i=2:1:k/2
                if count_IV_a+count_IV_b<a-t+1 || count_first_b==n-theta+1
                    if count_first_a>=theta
                        flag_a=b;
                        flag_b=b;
                    end
                    if count_first_b>=n-theta
                        flag_b=a;
                        flag_a=a;
                    end
                    if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                        Ms(i,j1)=1;
                        Ms(i,j2)=0;
                        tmp_vector(j1)=tmp_vector(j1)-1;
                        tmp_vector(j2)=tmp_vector(j2)+1;
                        count_IV_a=size(find(tmp_vector(2*k-a:n)==a),2);
                        count_IV_b=size(find(tmp_vector(2*k-a:n)==b),2);
                        count_first_a=size(find(tmp_vector(1:k/2)==a),2)+size(find(tmp_vector(k:n)==a),2);
                        count_first_b=size(find(tmp_vector(1:k/2)==b),2)+size(find(tmp_vector(k:n)==b),2);
                    end
                else
                    flag=1;
                    break;
                end
            end
            if flag==1
                break;
            end
        end
        if flag==1
            break;
        end
    end
    %Step3(move the extra zeros in column [k,k+a-t] to column [2k-a,n])
    %-----------------------------------------------------------------------------------------------------------------------------------------
    if flag==0
        flag_a=b;
        flag_b=b;
        
        for j2=n:-1:2*k-a
            for j1=k:1:k+a-t
                for i=2:1:k/2
                    if count_IV_a+count_IV_b<a-t+1 || count_first_b==n-theta+1
                        if count_first_a>=theta
                            flag_a=b;
                            flag_b=b;
                        end
                        if count_first_b>=n-theta
                            flag_b=a;
                            flag_a=a;
                        end
                        if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                            Ms(i,j1)=1;
                            Ms(i,j2)=0;
                            tmp_vector(j1)=tmp_vector(j1)-1;
                            tmp_vector(j2)=tmp_vector(j2)+1;
                            count_IV_a=size(find(tmp_vector(2*k-a:n)==a),2);
                            count_IV_b=size(find(tmp_vector(2*k-a:n)==b),2);
                            count_first_a=size(find(tmp_vector(1:k/2)==a),2)+size(find(tmp_vector(k:n)==a),2);
                            count_first_b=size(find(tmp_vector(1:k/2)==b),2)+size(find(tmp_vector(k:n)==b),2);
                        end
                    else
                        flag=1;
                        break;
                    end
                end
                if flag==1
                    break;
                end
            end
            if flag==1
                break;
            end
        end
    end
    %Step3(if the columns in [2k-a,n] still miss zeros, take zeros from columns in [a-k/2-1])
    %--------------------------------------------------------------------------------------------------------------------------
    if flag==0
        flag_a=b;
        flag_b=b;
        
        for j1=1:1:a-k/2-1
            for j2=n:-1:2*k-a
                for i=k-a+2:1:k/2
                    if count_IV_a+count_IV_b<a-t+1
                        if count_first_a>=theta
                            flag_a=b;
                            flag_b=b;
                        end
                        if count_first_b>=n-theta
                            flag_b=a;
                            flag_a=a;
                        end
                        if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                            Ms(i,j1)=1;
                            Ms(i,j2)=0;
                            tmp_vector(j1)=tmp_vector(j1)-1;
                            tmp_vector(j2)=tmp_vector(j2)+1;
                            count_IV_a=size(find(tmp_vector(2*k-a:n)==a),2);
                            count_IV_b=size(find(tmp_vector(2*k-a:n)==b),2);
                            count_first_a=size(find(tmp_vector(1:k/2)==a),2)+size(find(tmp_vector(k:n)==a),2);
                            count_first_b=size(find(tmp_vector(1:k/2)==b),2)+size(find(tmp_vector(k:n)==b),2);
                        end
                    else
                        flag=1;
                        break;
                    end
                end
                if flag==1
                    break;
                end
            end
            if flag==1
                break;
            end
        end
    end
    
    %---------------------------------------------------------------------------------------------------------------------------
    %Step5(ajust the positions of zerosin column [k/2+1,k+a-t] until the matrix is balanced.)
    
    flag=0;
    count_a=size(find(tmp_vector(1:n)==a),2);
    count_b=size(find(tmp_vector(1:n)==b),2);
    flag_a=a;
    flag_b=b;
    
    for j2=k/2+1:1:2*a-t
        for j1=2*a-t+1:1:k+a-t
            for i = k/2+1:1:k
                if count_a+count_b <n
                    if count_a>=theta
                        flag_a=b;
                        flag_b=b;
                    end
                    if count_b>=n-theta
                        flag_b=a;
                        flag_a=a;
                    end
                    if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                        Ms(i,j1)=1;
                        Ms(i,j2)=0;
                        tmp_vector(j1)=tmp_vector(j1)-1;
                        tmp_vector(j2)=tmp_vector(j2)+1;
                        count_a=size(find(tmp_vector(1:n)==a),2);
                        count_b=size(find(tmp_vector(1:n)==b),2);
                    end
                else
                    flag=1;
                    break;
                end
            end
            if flag==1
                break;
            end
        end
        if flag==1
            break;
        end
    end
    
else
    %--------------------------------------------------------------------------------------------------------------------------------
    %theta<n/2;
    
    count_IV_a=size(find(tmp_vector(2*k-a+1:n)==a),2);
    count_IV_b=size(find(tmp_vector(2*k-a+1:n)==b),2);
    flag=0;
    
    %Step6(move the extra zeros in column [k+a-t,2k-a] to column [2k-a+1,n])
    %-------------------------------------------------------------------------------------------------------------------------------------------------
    flag_a=a;
    flag_b=b;
    
    for j1=2*k-a:-1:k+a-t
        for j2=n:-1:2*k-a+1
            for i=2:1:k/2
                if count_IV_a+count_IV_b<a-t || count_first_b==n-theta+1
                    if count_first_a>=theta
                        flag_a=b;
                        flag_b=b;
                    end
                    if count_first_b>=n-theta
                        flag_b=a;
                        flag_a=a;
                    end
                    if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                        Ms(i,j1)=1;
                        Ms(i,j2)=0;
                        tmp_vector(j1)=tmp_vector(j1)-1;
                        tmp_vector(j2)=tmp_vector(j2)+1;
                        count_IV_a=size(find(tmp_vector(2*k-a+1:n)==a),2);
                        count_IV_b=size(find(tmp_vector(2*k-a+1:n)==b),2);
                        count_first_a=size(find(tmp_vector(1:k/2)==a),2)+size(find(tmp_vector(k:n)==a),2);
                        count_first_b=size(find(tmp_vector(1:k/2)==b),2)+size(find(tmp_vector(k:n)==b),2);
                    end
                else
                    flag=1;
                    break;
                end
            end
            if flag==1
                break;
            end
        end
        if flag==1
            break;
        end
    end
    %mu'
    %-------------------------------------------------------------------------------------------------------------------------------
    find(tmp_vector==a);
    find(tmp_vector==b);
    
    count_sec_a=size(find(tmp_vector(k+a-t:2*k-a)==a),2);
    count_sec_b=size(find(tmp_vector(k+a-t:2*k-a)==b),2);
    if flag==1
        flag1=0;
        flag_a=a;
        flag_b=a;
        for j1=k+a-t:1:2*k-a
            for j2=k/2-2:-1:1
                for i=k/2:-1:k-a+3
                    if count_sec_a+count_sec_b<k-2*a+t+1 || count_first_b==n-theta+1
                        if count_first_a>=theta
                            flag_a=b;
                            flag_b=b;
                        end
                        if count_first_b>=n-theta
                            flag_b=a;
                            flag_a=a;
                        end
                        if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                            Ms(i,j1)=1;
                            Ms(i,j2)=0;
                            tmp_vector(j1)=tmp_vector(j1)-1;
                            tmp_vector(j2)=tmp_vector(j2)+1;
                            count_sec_a=size(find(tmp_vector(k+a-t:2*k-a)==a),2);
                            count_sec_b=size(find(tmp_vector(k+a-t:2*k-a)==b),2);
                            count_first_a=size(find(tmp_vector(1:k/2)==a),2)+size(find(tmp_vector(k:n)==a),2);
                            count_first_b=size(find(tmp_vector(1:k/2)==b),2)+size(find(tmp_vector(k:n)==b),2);
                        end
                    else
                        flag1=1;
                        break;
                    end
                end
                if flag1==1
                    break;
                end
            end
            if flag1==1
                break;
            end
        end
    end
    
    %-------------------------------------------------------------------------------------------------------------------------------
    %Step6(move the extra zeros in column [k,k+a-t-1] to column [2k-a+1,n])
    if flag==0
        flag_a=b;
        flag_b=b;
        
        for j1=k:1:k+a-t-1
            for j2=n:-1:2*k-a+1
                for i=2:1:k/2
                    if count_IV_a+count_IV_b<a-t || count_first_b==n-theta+1
                        if count_first_a>=theta
                            flag_a=b;
                            flag_b=b;
                        end
                        if count_first_b>=n-theta
                            flag_b=a;
                            flag_a=a;
                        end
                        if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                            Ms(i,j1)=1;
                            Ms(i,j2)=0;
                            tmp_vector(j1)=tmp_vector(j1)-1;
                            tmp_vector(j2)=tmp_vector(j2)+1;
                            count_IV_a=size(find(tmp_vector(2*k-a+1:n)==a),2);
                            count_IV_b=size(find(tmp_vector(2*k-a+1:n)==b),2);
                            count_first_a=size(find(tmp_vector(1:k/2)==a),2)+size(find(tmp_vector(k:n)==a),2);
                            count_first_b=size(find(tmp_vector(1:k/2)==b),2)+size(find(tmp_vector(k:n)==b),2);
                        end
                    else
                        flag=1;
                        break;
                    end
                end
                if flag==1
                    break;
                end
            end
            if flag==1
                break;
            end
        end
    end
    %Step8(ajust the positions of zerosin column [k/2+1,k+a-t-1] until the matrix is balanced.)
    %-------------------------------------------------------------------------------------------------------
    flag=0;
    count_a=size(find(tmp_vector(1:n)==a),2);
    count_b=size(find(tmp_vector(1:n)==b),2);
    flag_a=a;
    flag_b=b;
    
    for j2=k/2+1:1:2*a-t-1
        for j1=2*a-t:1:k+a-t-1
            for i = k/2+1:1:k
                if count_a+count_b <n
                    if count_a>=theta
                        flag_a=b;
                        flag_b=b;
                    end
                    if count_b>=n-theta
                        flag_b=a;
                        flag_a=a;
                    end
                    if tmp_vector(j1)>flag_a && tmp_vector(j2)<flag_b && Ms(i,j1)==0 && Ms(i,j2)==1
                        Ms(i,j1)=1;
                        Ms(i,j2)=0;
                        tmp_vector(j1)=tmp_vector(j1)-1;
                        tmp_vector(j2)=tmp_vector(j2)+1;
                        count_a=size(find(tmp_vector(1:n)==a),2);
                        count_b=size(find(tmp_vector(1:n)==b),2);
                    end
                    
                else
                    flag=1;
                    break;
                end
            end
            if flag==1
                break;
            end
        end
        if flag==1
            break;
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



