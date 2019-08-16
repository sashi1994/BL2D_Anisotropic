function [node_Stress,node_Stress_S11,node_Stress_S12,node_Stress_S22]=stress_calculation_shell(res_stress_mises,elements,nodes,p,t)
elements=t;
node_Stress=zeros(size(nodes,1),1);                                                    % stress in each nodes 
node_Stress_S11=zeros(size(nodes,1),1);
node_Stress_S12=zeros(size(nodes,1),1);
node_Stress_S22=zeros(size(nodes,1),1);

for i=1:size(nodes,1)

%     ind=find(res_stress_mises{2}(:,1)==i);
%     
%     v=[];
%     v11=[];
%     v12=[];
%     v22=[];
%     for j=1:size(ind)
%         v=[v;res_stress_mises{3}(ind(j,1))];
%         v11=[v11;res_stress_mises{4}(ind(j,1))];
%         v12=[v12;res_stress_mises{5}(ind(j,1))];
%         v22=[v22;res_stress_mises{6}(ind(j,1))];
%     end
  
    
    %%
%     a=max(v11);
%     b=min(v11);
%     if abs(a)>abs(b)
%     S_S11=a;
%     else
%     S_S11=b;
%     end
%     
%     
%     a=max(v22);
%     b=min(v22);
%     if abs(a)>abs(b)
%     S_S22=a;
%     else
%     S_S22=b;
%     end
%     
%     a=max(v12);
%     b=min(v12);
%     if abs(a)>abs(b)
%     S_S12=a;
%     else
%     S_S12=b;
%     end


ind1=find(elements(:,1)==i);
ind2=find(elements(:,2)==i);
ind3=find(elements(:,3)==i);
    
    S_mises=[];
    S_S11=[];
    S_S12=[];
    S_S22=[];
    
    for j=1:size(ind1,1)
        S_mises=[S_mises;(res_stress_mises{3}(ind1(j)))];
        S_S11=[S_S11;(res_stress_mises{4}(ind1(j)))];
        S_S22=[S_S22;(res_stress_mises{6}(ind1(j)))];
        S_S12=[S_S12;(res_stress_mises{5}(ind1(j)))];
    end
    
    for j=1:size(ind2,1)
        S_mises=[S_mises;(res_stress_mises{3}(ind2(j)))];
        S_S11=[S_S11;(res_stress_mises{4}(ind2(j)))];
        S_S22=[S_S22;(res_stress_mises{6}(ind2(j)))];
        S_S12=[S_S12;(res_stress_mises{5}(ind2(j)))];
    end
    
    for j=1:size(ind3,1)
        S_mises=[S_mises;(res_stress_mises{3}(ind3(j)))];
        S_S11=[S_S11;(res_stress_mises{4}(ind3(j)))];
        S_S22=[S_S22;(res_stress_mises{6}(ind3(j)))];
        S_S12=[S_S12;(res_stress_mises{5}(ind3(j)))];
    end
    
    S_mises=mean(S_mises);
    S_S11=mean(S_S11);
    S_S12=mean(S_S12);
    S_S22=mean(S_S22);
    
    node_Stress(i,1)=(S_mises);
    node_Stress_S11(i,1)=(S_S11);
    node_Stress_S12(i,1)=(S_S12);
    node_Stress_S22(i,1)=(S_S22);
end

%% figures generations
figure(16);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress,'facecolor','interp');colorbar();view(2);title('Von Mises');
figure(12);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress_S11,'facecolor','interp');colorbar();view(2);title('S11');
figure(13);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress_S12,'facecolor','interp');colorbar();view(2);title('S12');
figure(15);clf;trisurf(t,p(:,1),p(:,2),zeros(size(p,1),1),node_Stress_S22,'facecolor','interp');colorbar();view(2);title('S22');
end


