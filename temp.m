a=60;
rotI = dataset.cropImage(:,:,a);
BW = edge(rotI,'canny');
[H,theta,rho] = hough(BW);
figure
imshow(imadjust(mat2gray(H)),[],...
       'XData',theta,...
       'YData',rho,...
       'InitialMagnification','fit');
xlabel('\theta (degrees)')
ylabel('\rho')
axis on
axis normal 
hold on
colormap(gca,hot)

%GET THE PEAKS
P = houghpeaks(H,1,'threshold',ceil(0.3*max(max(H(:)))));

%DEPICT PEAKS IN HOUGH FREQ
x = theta(P(:,2));
y = rho(P(:,1));
hold on
plot(x,y,'s','color','black');

%GET THE LINES
lines = houghlines(BW,theta,rho,P,'FillGap',5,'MinLength',7);

%DEPICT PEAKS IN REAL IMAGE
figure, imshow(dataset.cropImage(:,:,a)), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
%    plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end

% % highlight the longest line segment
% plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

% normalized(:,:,i) = zeros(size(dataset.cropImage,1), size(dataset.cropImage,2), 'double');
% normalized(xy(1,1)-50:xy(1,1)+50,xy(1,2)-50:xy(1,2)+50,i) = 1;

% create boundary selection
% width=25;
% height = 50;
% a = zeros(size(dataset.cropImage,1), size(dataset.cropImage,2), 'double');
% a(xy(1,2)-height:xy(1,2)+height,xy(1,1)-width:xy(1,1)+width,1) = ...
%     dataset.cropImage(xy(1,2)-height:xy(1,2)+height,xy(1,1)-width:xy(1,1)+width,a);
% figure;imshow(a);

 s  = regionprops(rotI,'centroid');
 normalized(:,:,1) = dataset.cropImage(s.Centroid(1,2)-height:s.Centroid(1,2)+height, ...
     s.Centroid(1,1)-width:s.Centroid(1,1)+width,1);
 figure; imshow(normalized(:,:,1));
