function [adaptdegree,storex,storey] = adpt(i,count,chrom1,chrom2,uniqueData,fixdpoint)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
load('1225.mat')
movepoint=zeros(4,45);
changex=zeros(2,45);
changey=zeros(2,45);
adaptdegree=0;
for j=1:60
        for p=1:count(j,46)
            changex(uniqueData(j,2+p))=chrom1(i,j);
            changey(uniqueData(j,2+p))=chrom2(i,j);
        end
end
for k=1:45
        movepoint(1,k)=changex(1,k);
        movepoint(2,k)=changey(1,k);
        movepoint(3,k)=changex(2,k)-changex(1,k);
        movepoint(4,k)=changey(2,k)-changey(1,k);
end
    syms t u v a b
storex=nan(2,300);
storey=nan(2,300);
    s=0;
    
    for o=1:45
    ju=zeros(1,3);    
        if ju(1)==1&&ju(2)==1
            storex(:,s-1)=[];
            storey(:,s-1)=[];
            storex(:,s-2)=[];
            storey(:,s-2)=[];
        else
            if ju(1)==1,ju(2)==1
               storex(:,s-1)=[];
               storey(:,s-1)=[];
            end
        end
        temp=zeros(2,5);
        ju=zeros(1,3);%判断是否取值
        for g=0:floor(sqrt(movepoint(3,o)^2+movepoint(4,o)^2)/320)
            u=g*320/sqrt(movepoint(3,o)^2+movepoint(4,o)^2);
            S=solve(movepoint(3,o)*a+movepoint(4,o)*b==0,a^2+b^2==1);
            
            
            for p=1:2
                e=0;%确保每条骨架垂线点只取一个值
                m=0;%刷新m取值
                
                s=(length(storex(~isnan(storex)))/2)+1;%刷新s取值
                
                for m=1:26
                    eqns=[[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)]+v*[S.a(p),S.b(p)]==[fixdpoint(1,m),fixdpoint(2,m)]+t*[fixdpoint(3,m),fixdpoint(4,m)],t>0,t<1];
                    Q=solve(eqns,[v,t]);
                    if isempty(Q.v)==0&&Q.v>600&&Q.v<3000
                        an=judge(storex,storey,movepoint,o,u,S.a(p),S.b(p));
                        refreshdata(plot(storex,storey,'go-'))
                        if 100000==an 
                             if ju(1)==0&&ju(2)==0,ju(3)==1
                                 
                                answer1=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)];
                                answer2=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)]+Q.v*[S.a(p),S.b(p)];
                                storex(1,s)=answer1(1);
                                storey(1,s)=answer1(2);
                                storex(2,s)=answer2(1);
                                storey(2,s)=answer2(2);
                               
                                temp(p,1)=answer1(1);
                                temp(p,2)=answer1(2);
                                temp(p,3)=Q.v;
                                temp(p,4)=S.a(p);
                                temp(p,5)=S.b(p);
                               
                                
                                e=e+1;
                                s=s-length(storex(:,any(storex==0)));
                                storex(:,any(storex==0))=[];
                                storey(:,any(storey==0))=[];
                                ju(p)=ju(p)+1;
                                ju(3)=0;
                                plot(storex,storey,'go-')
                             else
                                answer1=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)];
                                answer2=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)]+Q.v*[S.a(p),S.b(p)]; 
                                storex(1,s+2)=answer1(1);
                                storey(1,s+2)=answer1(2);
                                storex(2,s+2)=answer2(1);
                                storey(2,s+2)=answer2(2); 
                                storex(1,s)=storex(1,s-1);
                                storex(2,s)=storex(1,s+2);
                                storey(1,s)=storey(1,s-1);
                                storey(2,s)=storey(1,s+2);
                                
                                
                              storex(1,s+1)=temp(p,1)+min(Q.v,temp(p,3))*temp(p,4);
                                storey(1,s+1)=temp(p,2)+min(Q.v,temp(p,3))*temp(p,5);
                                storex(2,s+1)=answer1(1)+min(Q.v,temp(p,3))*S.a(p);
                                storey(2,s+1)=answer1(2)+min(Q.v,temp(p,3))*S.b(p);
                                 adaptdegree=adaptdegree+(320*min(Q.v,temp(p,3)))/71291911.410;
                                 temp(p,1)=answer1(1);
                                temp(p,2)=answer1(2);
                                temp(p,3)=Q.v;
                                temp(p,4)=S.a(p);
                                temp(p,5)=S.b(p);
                                
                                e=e+1;
                                ju(p)=ju(p)+1;
                                s=s-length(storex(:,any(storex==0)));
                                storex(:,any(storex==0))=[];
                                storey(:,any(storey==0))=[];
                                ju(3)=1;
                                plot(storex,storey,'go-')
                             end
                         else
                             if an>600&&an<3000
                                if ju(1)==0&&ju(2)==0,ju(3)==1
                                answer1=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)];
                                answer2=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)]+an*[S.a(p),S.b(p)];
                                storex(1,s)=answer1(1);
                                storey(1,s)=answer1(2);
                                storex(2,s)=answer2(1);
                                storey(2,s)=answer2(2);
                                
                                temp(p,1)=answer1(1);
                                temp(p,2)=answer1(2);
                                temp(p,3)=an;
                                temp(p,4)=S.a(p);
                                temp(p,5)=S.b(p);
                                
                                e=e+1;
                                s=s-length(storex(:,any(storex==0)));
                                storex(:,any(storex==0))=[];
                                storey(:,any(storey==0))=[];
                                ju(p)=ju(p)+1;
                                ju(3)=0;
                                plot(storex,storey,'go-')
                                else
                                 answer1=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)];
                                answer2=[movepoint(1,o),movepoint(2,o)]+u*[movepoint(3,o),movepoint(4,o)]+an*[S.a(p),S.b(p)];
                                storex(1,s+2)=answer1(1);
                                storey(1,s+2)=answer1(2);
                                storex(2,s+2)=answer2(1);
                                storey(2,s+2)=answer2(2); 
                                storex(1,s)=storex(1,s-1);
                                storex(2,s)=storex(1,s+2);
                                storey(1,s)=storey(1,s-1);
                                storey(2,s)=storey(1,s+2);
                                
                                storex(1,s+1)=temp(p,1)+min(an,temp(p,3))*temp(p,4);
                                storey(1,s+1)=temp(p,2)+min(an,temp(p,3))*temp(p,5);
                                storex(2,s+1)=answer1(1)+min(an,temp(p,3))*S.a(p);
                                storey(2,s+1)=answer1(2)+min(an,temp(p,3))*S.b(p);
                                 adaptdegree=adaptdegree+(320*min(an,temp(p,3)))/71291911.410;
                                 temp(p,1)=answer1(1);
                                temp(p,2)=answer1(2);
                                temp(p,3)=judge(storex,storey,movepoint,o,u,S.a(p),S.b(p));
                                temp(p,4)=S.a(p);
                                temp(p,5)=S.b(p);
                                
                                ju(p)=ju(p)+1;
                                ju(3)=1;
                                e=e+1;
                                s=s-length(storex(:,any(storex==0)));
                                
                                plot(storex,storey,'go-')
                                end
                             end
                         end
                    end
                    if e==1
                        break
                    end
                end
            end
        end
    end
storex
storey
end