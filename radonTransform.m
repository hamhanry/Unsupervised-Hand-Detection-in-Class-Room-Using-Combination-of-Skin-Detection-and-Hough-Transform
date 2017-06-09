bw = edge(dataset.cropImage(:,:,145));
theta = 0:90;
[R,xp] = radon(bw,theta);
figure
imagesc(theta, xp, R); colormap(hot);
xlabel('\theta (degrees)');
ylabel('x^{\prime} (pixels from center)');
title('R_{\theta} (x^{\prime})');
colorbar