f=[]
%num2str(k)
for k = 1:182
		
	% Create an image filename, and read it in to a variable called imageData.
	jpgFileName = strcat('image', sprintf('%.4d', k), '.bmp');
	if exist(jpgFileName, 'file')
		imageData = imread(jpgFileName);
	    a1=rgb2gray(imageData);
        a1=im2double(a1);
        b1=reshape(a1,numel(a1),1);
        f1=ksdensity(b1,0:.005:1);
        f=[f f1'];
        fprintf('File %s has been read.\n', jpgFileName);
    else
		fprintf('File %s does not exist.\n', jpgFileName);
	end
	
end
save('kq3839.mat','f')




% a1 = imread('1.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% a1=[]
% a1 = imread('2.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f2=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('3.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f3=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('4.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f4=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('5.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f5=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('6.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f6=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('7.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f7=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('8.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f8=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('9.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f9=ksdensity(b1,0:.01:1);
% a1=[]
% a1 = imread('10.jpg');
% a1=rgb2gray(a1)
% a1=im2double(a1)
% chieu=size(a1,2)
% b1=[];
% for i=1:chieu
% b1=[b1;a1(:,i)]
% end
% f10=ksdensity(b1,0:.01:1);
% % a1=[]
% % a1 = imread('11.jpg');
% % a1=rgb2gray(a1)
% % a1=im2double(a1)
% % chieu=size(a1,2)
% % b1=[];
% % for i=1:chieu
% % b1=[b1;a1(:,i)]
% % end
% % f11=ksdensity(b1,0:.01:1);
% % a1=[]
% % a1 = imread('12.jpg');
% % a1=rgb2gray(a1)
% % a1=im2double(a1)
% % chieu=size(a1,2)
% % b1=[];
% % for i=1:chieu
% % b1=[b1;a1(:,i)]
% % end
% % f12=ksdensity(b1,0:.01:1);
% % a1=[]
% % a1 = imread('13.jpg');
% % a1=rgb2gray(a1)
% % a1=im2double(a1)
% % chieu=size(a1,2)
% % b1=[];
% % for i=1:chieu
% % b1=[b1;a1(:,i)]
% % end
% % f13=ksdensity(b1,0:.01:1);
% % a1=[]
% % a1 = imread('14.jpg');
% % a1=rgb2gray(a1)
% % a1=im2double(a1)
% % chieu=size(a1,2)
% % b1=[];
% % for i=1:chieu
% % b1=[b1;a1(:,i)]
% % end
% % f14=ksdensity(b1,0:.01:1);
% % a1=[]
% % a1 = imread('15.jpg');
% % a1=rgb2gray(a1)
% % a1=im2double(a1)
% % chieu=size(a1,2)
% % b1=[];
% % for i=1:chieu
% % b1=[b1;a1(:,i)]
% % end
% % f15=ksdensity(b1,0:.01:1);
% vung=0:.01:1;
% plot(vung,f1)
% hold on
% plot(vung,f2)
% plot(vung,f3)
% plot(vung,f4)
% plot(vung,f5)
% plot(vung,f6,'r')
% plot(vung,f7,'r')
% plot(vung,f8,'r')
% plot(vung,f9,'r')
% plot(vung,f10,'r')
% % plot(vung,f11,'k')
% % plot(vung,f12,'k')
% % plot(vung,f13,'k')
% % plot(vung,f14,'k')
% % plot(vung,f15,'k')
% hold off
% 
% x=vung;
% f=[f1' f2' f3' f4' f5' f6' f7' f8' f9' f10'];
% 
% %Khoi tao ma tran phan vung
% % U=[0 0 0 1 1 0 0 1 0 1 0 0 0 0 0
% %    1 0 1 0 0 1 1 0 0 0 1 0 1 0 1
% %    0 1 0 0 0 0 0 0 1 0 0 1 0 1 0];
% U=[1 1 1 1 1 0 0 0 0 0 
%    0 0 0 0 0 1 1 1 1 1];
% chieuu=size(U);
% w1=[];
% w2=[];
% w3=[];
% for i=1:chieuu(1,2)
% if U(1,i)==1
% w1=[w1 f(:,i)];
% end
% if U(2,i)==1
% w2=[w2 f(:,i)];
% end
% % if U(3,i)==1
% % w3=[w3 f(:,i)];
% % end
% end
% 
% 
% %Tính ma tran do rong chum
% W=[]
% for j=1:chieuu(1,2)
% W(1,j)=tuongtuchum([w1 f(:,j)],x);
% W(2,j)=tuongtuchum([w2 f(:,j)],x);
% %W(3,j)=tuongtuchum([w3 f(:,j)],x);
% end
% W
% 
% m=0
% Umoi=U;
% j=1;
% d=[];
% while j<chieuu(1,2)+.1
%     %Nhan dien chum phan tu dang thuoc
%     for i=1:chieuu(1,1)
%     if U(i,j)>0
%     k=i;
%     end
%     end
%     %ket thuc nhan dien
%     
%     %nhan dien cac phan tu khong thoa
% for i=1:chieuu(1,1)
%     if W(i,j)>W(k,j)
%      d=[d norm(W(i,j)-W(k,j))];
%         m=m+1;
%     end
% end
%    j=j+1; 
% end
% dmax=max(d);
% %Cap nhan lai ma tran
% j=1;
% while j<chieuu(1,2)+.1
% %Nhan dien chum phan tu dang thuoc
%     for i=1:chieuu(1,1)
%     if U(i,j)>0
%     k=i;
%     end
%     end
% 
%     for i=1:chieuu(1,1)
%     if W(i,j)>W(k,j)& norm(W(i,j)-W(k,j))==dmax
%         Umoi(k,j)=0;
%         Umoi(i,j)=1;
%     end
% end
% j=j+1;
% end
% U=Umoi
% 
% while m>0
% chieuu=size(U);
% w1=[];
% w2=[];
% w3=[];
% for i=1:chieuu(1,2)
% if U(1,i)==1
% w1=[w1 f(:,i)];
% end
% if U(2,i)==1
% w2=[w2 f(:,i)];
% end
% %  if U(3,i)==1
% %  w3=[w3 f(:,i)];
% %  end
% end
% 
% 
% %Tính ma tran do rong chum
% W=[]
% for j=1:chieuu(1,2)
% W(1,j)=tuongtuchum([w1 f(:,j)],x);
% W(2,j)=tuongtuchum([w2 f(:,j)],x);
% %W(3,j)=tuongtuchum([w3 f(:,j)],x);
% end
% W
% 
% m=0
% Umoi=U;
% j=1;
% d=[];
% while j<chieuu(1,2)+.1
%     %Nhan dien chum phan tu dang thuoc
%     for i=1:chieuu(1,1)
%     if U(i,j)>0
%     k=i;
%     end
%     end
%     %ket thuc nhan dien
%     
%     %nhan dien cac phan tu khong thoa
% for i=1:chieuu(1,1)
%     if W(i,j)>W(k,j)
%      d=[d norm(W(i,j)-W(k,j))];
%         m=m+1;
%     end
% end
%    j=j+1; 
% end
% dmax=max(d);
% %Cap nhan lai ma tran
% j=1;
% while j<chieuu(1,2)+.1
% %Nhan dien chum phan tu dang thuoc
%     for i=1:chieuu(1,1)
%     if U(i,j)>0
%     k=i;
%     end
%     end
% 
%     for i=1:chieuu(1,1)
%     if W(i,j)>W(k,j)& norm(W(i,j)-W(k,j))==dmax
%         Umoi(k,j)=0;
%         Umoi(i,j)=1;
%     end
% end
% j=j+1;
% end
% U=Umoi
% end
% U