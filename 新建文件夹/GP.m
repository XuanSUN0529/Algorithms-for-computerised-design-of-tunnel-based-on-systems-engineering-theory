clc;
clear;
load('1225.mat')
%参数设置
NIND=100;
MAXGEN=100;
Pc=0.9;
Pm=0.05;
GGPA=0.9;
N=60;
%% 初始化种群
%创建坐标字典
uniqueData = unique(nearx);
count = histc(nearx, uniqueData); 
uniqueData(1,:)=[];
count(1,:)=[];
for i=1:60
    count(i,46)=0;
    for j=1:45
    count(i,46)=count(i,46)+count(i,j);
    end
end
for i=1:60
    for j=1:count(i,46)
        answer=find(nearx==uniqueData(i,1));
       
    uniqueData(i,2+j) = answer(j);
    
    end
    answer=[];
end
for i=1:60
     uniqueData(i,2)=neary(uniqueData(i,3));
end
[chrom1,chrom2] = inipop(uniqueData,NIND,N);
%% 优化
gen=0;
%% 计算适应度
resort=zeros(1,100);
changex=nearx;
changey=neary;
len=zeros(NIND,1);
fixdpoint=zeros(4,26);
movepoint=zeros(4,45);
for i=1:26
    fixdpoint(1,i)=x(i);
    fixdpoint(2,i)=y(i);
    fixdpoint(3,i)=x(i+1)-x(i);
    fixdpoint(4,i)=y(i+1)-y(i);
end

tic;
  i=1
 [storex,storey] = adpt(i,count,chrom1,chrom2,uniqueData,fixdpoint);
plot(x,y,'md-')
hold on
plot(nearx,neary,'k-')
hold on
plot(storex,storey,'go-')
 toc
 
 
                       % plot(inserts(1,:),inserts(2,:),'r*')
                       % hold on
                       % plot(x,y,'md-')
                       % hold on
                        %plot(nearx,neary,'k-')
                        %hold on
                        %plot(movepoint(1,1),movepoint(2,1),'ro',movepoint(1,1)+movepoint(3,1),movepoint(2,1)+movepoint(4,1),'ro')
                        %hold on
                        %plot(fixdpoint(1,8),fixdpoint(2,8),'ko',fixdpoint(1,8)+fixdpoint(3,8),fixdpoint(2,8)+fixdpoint(4,8),'ko')
                        %title('(C)vorinoi图-井田形状主骨架')
                        %xlabel('相对X坐标')
                        %ylabel('相对Y坐标')
                        %plot(storex,storey,'go-')
                         




