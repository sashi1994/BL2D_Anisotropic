function eigen=principal_direction(node_stress,node_Stress_S11,node_Stress_S12,node_Stress_S22)
eigen = struct([]);
    
for i=1:size(node_stress,1)
    matrix=[node_Stress_S11(i) node_Stress_S12(i);node_Stress_S12(i) node_Stress_S22(i)];
    [v,D]=eig(matrix);
    eigen(i).value=D;
    eigen(i).vector=v;
    eigen(i).map=[];
    
end
end