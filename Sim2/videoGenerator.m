% temp1 = 'framesTest2/testframe_';
temp1 = 'data/data/class5/s1frame';
temp2 = '.png';

writerObj = VideoWriter('video/test_3Noise(alpha)_64_3.avi');
writerObj.FrameRate = 10; % 20

open(writerObj);
n_frames = 128; %60 gor test 1 % 40
for i = 1:n_frames
    frame = imread(strcat(temp1,num2str(i),temp2));
    writeVideo(writerObj,frame);
end
close(writerObj);