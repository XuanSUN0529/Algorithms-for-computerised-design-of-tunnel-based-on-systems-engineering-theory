function [chrom1,chrom2] = inipop(uniqueData,NIND,N)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
chrom1=zeros(NIND,N);
chrom2=zeros(NIND,N);
dis1=pi*rand(NIND,N);
agen1=2*pi*rand(NIND,N);
dis2=pi*rand(NIND,N);
agen2=2*pi*rand(NIND,N);
for i=1:NIND
    for j=1:N
        chrom1(i,j)=uniqueData(j,1)+dis1(i,j)*cos(agen1(i,j));
        chrom2(i,j)=uniqueData(j,2)+dis2(i,j)*cos(agen2(i,j));
    end
end   
end

