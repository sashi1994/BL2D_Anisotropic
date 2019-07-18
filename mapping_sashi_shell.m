function [eigen]=mapping_sashi_shell(eigen,t,p,nodes,sigma_user,minimum_size)
 
node_map=zeros(size(nodes,1),1);                                                       % nodes with their length after node_mapping 
%% node_mapping formula 
h_min=1/(minimum_size)^2;
for i=1:size(nodes,1)
    V=eigen(i).vector;
    D=eigen(i).value;
    h_mat=abs(D);
    mat=V;
    mat_trans=transpose(V);
    
    if h_mat(1,1)>h_min 
        h_mat(1,1)=h_min;
    elseif h_mat(2,2)>h_min
        h_mat(2,2)=h_min;
    end
    
    h_mat=mat*h_mat*mat_trans;
    eigen(i).map=[h_mat(1,1),h_mat(1,2),h_mat(2,2)];
end

end
