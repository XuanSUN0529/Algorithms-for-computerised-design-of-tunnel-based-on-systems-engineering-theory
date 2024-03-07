clc;
clear;
local=xlsread('C:\Users\25845\Documents\WeChat Files\wxid_du7lzh943j7l21\FileStorage\File\2023-04\副本大佛寺井田范围（坐标变换后）.xlsx');
x=local(:,7);
y=local(:,8);
[vx,vy]=voronoi(x,y);
subplot(2,3,1)
plot(x,y,'r*-')
hold on
voronoi(x,y)
xlabel('X')
ylabel('Y')
title('(A)Shape of the well field after voronoi diagram processing')
for i=1:26
    inserts(1,i)=0.5*(x(i)+x(i+1));
    inserts(2,i)=0.5*(y(i)+y(i+1));
    k(i)=(y(i)-y(i+1))/(x(i)-x(i+1));
end
inserts(1,27)=0.5*(x(27)+x(1));
inserts(2,27)=0.5*(y(27)+y(1));
k(27)=(y(27)-y(1))/(x(27)-x(1));
in=inpolygon(vx,vy,x,y);
vxin=in.*vx;
vyin=in.*vy;
vxin(:,any(vxin==0))=[];
vyin(:,any(vyin==0))=[];
subplot(2,3,2)
plot(x,y,'r*-')
hold on
plot(vxin,vyin)
title('(B)vorinoi graph after removing external nodes - well-field shape')
xlabel('X')
ylabel('Y')
[nearx,neary]=fun_resort(vxin,vyin,inserts,k);
nearx(:,43)=[]
neary(:,43)=[]
subplot(2,3,3)
plot(inserts(1,:),inserts(2,:),'r*')
hold on
plot(x,y,'b*-')
hold on
plot(nearx,neary,'k-')
title('(C)vorinoi diagram - wellfield shape main skeleton')
xlabel('X')
ylabel('Y')
%subplot(2,3,4)
%a=[14319.0670000017;12929.0659999996;12111.0710000023;5857.09099999815;5366.09499999881;4626.10000000149;3650.10700000078;2769.10300000012;2100.13700000197;177.122000001371;630.119999997318;973.119999997318;1348.11999999732;412.126999996603;536.145000003278;2538.14800000191;4491.14699999988;6718.14100000262;7335.14100000262;12156.2639999986;12299.1209999993;12549.1489999965;13419.1000000015;14349.1059999987;14499.1049999967;14499.0659999996;14319.0670000017;
%   9017.175;
%9019.682;
%9840.938;
%9017.175;
%8295.458;
%8497.753;
%8497.753;
%8295.458
% ];
%b=[2933.39099999983;2687.38899999997;2440.38499999978;708.356999999844;783.358000000008;659.362999999896;458.358000000007;307.364000000060;-18.6409999998286;-6.64199999999255;410.362000000197;937.367000000086;1507.38100000005;1533.37500000000;3499.39900000021;5275.42599999998;6118.44100000011;6505.44799999986;7471.46700000018;7370.39600000018;7039.46799999988;6519.37399999984;6499.45699999994;7149.46799999988;7114.47800000012;2981.39000000013;2933.39099999983;
%   5526.217;
%5471.64;
%5525.752;
%5526.217;
%3938.739;
%3938.739;
%3739.491;
%3739.491
% ];
%plot(x,y,'r*-')
%hold on
%voronoi(a,b)
%hold on
%plot(a(28:31),b(28:31),'r+-')
%plot(a(32:35),b(32:35),'b-')
%title('(D)vorinoi图-井田形状主骨架')
%xlabel('相对X坐标')
%ylabel('相对Y坐标')
%subplot(2,3,5)
%[va,vb]=voronoi(a,b)
%in=inpolygon(va,vb,a,b);
%vain=in.*va;
%vbin=in.*vb;
%vain(:,any(vain==0))=[];
%vbin(:,any(vbin==0))=[];
%plot(x,y,'r*-')
%hold on
%plot(a(28:31),b(28:31),'r+-')
%plot(a(32:35),b(32:35),'b-')
%hold on
%plot(vain,vbin)
%title('(E)vorinoi图-井田形状主骨架')
%xlabel('相对X坐标')
%ylabel('相对Y坐标')
%subplot(2,3,6)
%plot(inserts(1,:),inserts(2,:),'r*')
%hold on
%plot(x,y,'b*-')
%hold on
%plot(nearx,neary,'k-')
%hold on
%plot(a(28:31),b(28:31),'r+-')
%plot(a(32:35),b(32:35),'b-')
%title('(F)vorinoi图-井田形状主骨架')
%xlabel('相对X坐标')
%ylabel('相对Y坐标')

%xi=13000:100:14000;
%yi=-((1/k(1))*(xi-inserts(1,1)))+inserts(2,1)
%subplot(2,2,3)
%plot(xi,yi)
%hold on
%plot(x,y,'r*-')
%hold on
%plot(vxin,vyin)
%hold on
%plot(inserts(1,1),inserts(2,1),'ko')

    
    