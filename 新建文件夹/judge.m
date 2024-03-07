function [Uv] = judge(storex,storey,movepoint,o,u,Sap,Sbp)
%UNTITLED 重复检测
%   此处显示详细说明
syms c v
V=100000;
for k=1:(length(storex(~isnan(storex)))/2)+1
    
   eqns=[[storex(1,k),storey(1,k)]+c*[storex(2,k)-storex(1,k),storey(2,k)-storey(1,k)]==[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)]+v*[Sap,Sbp],c<1,c>0];
    U=solve(eqns,[c,v]);
    if isempty(U.v)==0&&V>abs(U.v)&&U.v>0
        V=U.v;
    
    end
end
    Uv=V;
end


