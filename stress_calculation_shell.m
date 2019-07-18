function [node_Stress,node_Stress_S11,node_Stress_S12,node_Stress_S22]=stress_calculation_shell(res_stress_mises,elements,nodes,p,t)
elements=t;
node_Stress=zeros(size(nodes,1),1);                                                    % stress in each nodes 
node_Stress_S11=zeros(size(nodes,1),1);
node_Stress_S12=zeros(size(nodes,1),1);
node_Stress_S22=zeros(size(nodes,1),1);

for i=1:size(nodes,1)

    ind=find(res_stress_mises{2}(:,1)==i);
    
    
    S_mises=res_stress_mises{3}(ind(1,1));
    S_S11=res_stress_mises{4}(ind(1,1));
    S_S22=res_stress_mises{6}(ind(1,1));
    S_S12=res_stress_mises{5}(ind(1,1));

    
    S_mises=abs(S_mises);
    S_S11=abs(S_S11);
    S_S12=abs(S_S12);
    S_S22=abs(S_S22);
    
    node_Stress(i,1)=S_mises;
    node_Stress_S11(i,1)=S_S11;
    node_Stress_S12(i,1)=S_S12;
    node_Stress_S22(i,1)=S_S22;
end

%% figures generations
figure(16);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress,'facecolor','interp');colorbar();view(2);title('Von Mises');
figure(12);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress_S11,'facecolor','interp');colorbar();view(2);title('S11');
figure(13);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress_S12,'facecolor','interp');colorbar();view(2);title('S12');
figure(15);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress_S22,'facecolor','interp');colorbar();view(2);title('S22');
end


