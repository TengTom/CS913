temp1 = 'framesTest2/testframe_';
temp2 = '.png';

writerObj = VideoWriter('framesTest2/video/test_concertration.avi');
writerObj.FrameRate = 10; % 20

open(writerObj);
n_frames = 40; %60 gor test 1
for i = 1:n_frames
    frame = imread(strcat(temp1,num2str(i),temp2));
    writeVideo(writerObj,frame);
end
close(writerObj);