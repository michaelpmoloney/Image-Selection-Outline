%Michael Moloney
%CSC 4630 Homework #11
%Account: mmoloney1
%Due Date: Nov.6,2018

%select file. save it to variable. save copy of file.
picture_a = imread(uigetfile);
picture_b = picture_a;
%get size of picture. Display picture
[maxrow,maxcol,depth] = size(picture_a);
imshow(picture_a);
%select points on picture
[x,y] = ginput(2);
for p=1:2
    x(p)=round(x(p));
    y(p)=round(y(p));
end
%check boundaries
for n=1:2
if(x(n)<0||x(n)>maxcol)
    disp('the point is not on the image. Using default.');
    if(x(n)<=0)
        x(n)=1;
    else
        x(n)=maxcol;
    end
end
end
if(x(2)<x(1))
    temp=x(1);
    x(1)=x(2);
    x(2)=temp;
end
for m=1:2
if(y(m)<0||y(m)>maxrow)
    disp('the point is not on the image. Using default.');
    if(y(m)<=0)
        y(m)=1;
    else
        y(m)=maxrow;
    end
end
end
if(y(2)<y(1))
    temp=y(1);
    y(1)=y(2);
    y(2)=temp;
end
%make rectangle
picture_b(y(1):y(2),x(1):x(2),1)=255;
picture_b(y(1):y(2),x(1):x(2),2)=0;
picture_b(y(1):y(2),x(1):x(2),3)=0;
imshow(picture_b);
%replace middle of pic b rectangle with pic a to create outline
pic_b_inner = picture_a(y(1)+5:y(2)-5,x(1)+5:x(2)-5,:);
picture_b(y(1)+5:y(2)-5,x(1)+5:x(2)-5,:) = pic_b_inner;
imshow(picture_b);