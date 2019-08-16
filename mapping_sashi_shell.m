function [eigen]=mapping_sashi_shell(eigen,t,p,nodes,sigma_user,minimum_size)
h_min=1/(minimum_size)^2;
node_map=zeros(size(nodes,1),1);                                                       % nodes with their length after node_mapping 
%% node_mapping formula 

for i=1:size(nodes,1)
    V=eigen(i).vector;
    D=eigen(i).value;
    sigma=abs(D);
    h_mat=zeros(2,2);
    mat=V;
    mat_trans=transpose(V);
%%    
% 
    if sigma(1,1)>=sigma_user
        h_mat(2,2)=minimum_size;
    else  
        h_mat(2,2)=minimum_size*(sigma_user/sigma(1,1));
        if h_mat(2,2)==inf
            h_mat(2,2)=100;
        end
    end
    
    
    if sigma(2,2)>=sigma_user        
        h_mat(1,1)=minimum_size;
    else 
        h_mat(1,1)=minimum_size*(sigma_user/sigma(2,2));
        if h_mat(1,1)>inf
            h_mat(1,1)=100;
        end
    end
%     h_mat(2,2)=1/(h_mat(2,2)^2);
%     h_mat(1,1)=1/(h_mat(1,1)^2);    
    % Factor multiplication
    ff=6;
    if h_mat(1,1)>ff*h_mat(2,2)
        h_mat(1,1)=ff*h_mat(2,2);
    else 
        if h_mat(2,2)>ff*h_mat(1,1)
            h_mat(2,2)=ff*h_mat(1,1);
        end
    end
    
    h_mat(1,1)=1/(h_mat(1,1))^2;
    h_mat(2,2)=1/(h_mat(2,2))^2;
%%    
%     sigma(2,2)=1/(sigma(2,2)^2);
%     sigma(1,1)=1/(sigma(1,1)^2);
%     if sigma(1,1)>h_min 
%         sigma(1,1)=h_min;
%     end
%     if sigma(2,2)>h_min
%         sigma(2,2)=h_min;
%     end
%%
    h_mat_out=mat*h_mat*mat_trans;
    eigen(i).map=[h_mat_out(1,1),h_mat_out(1,2),h_mat_out(2,2)];
end

end
