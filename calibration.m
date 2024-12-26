% bias_pitch=mean(pitch);
bias_yaw=mean(yaw);
bias_pitch1=mean(pitch1);
bias_pitch2=mean(pitch2);
bias_pitch3=mean(pitch3);
bias_pitch4=mean(pitch4);

pitch_v=[0,bias_pitch;-15*pi/180,bias_pitch1;15*pi/180,bias_pitch2;-30*pi/180,bias_pitch3;30*pi/180,bias_pitch4];
% pitch_w(:,2)=pitch_w(:,2)+0.0318*ones(size(pitch_w(:,2)));
line=polyfit(pitch_v(:,1),pitch_v(:,2),1);
s1=line(1);
x=linspace(-0.6,0.6);
y=polyval(line,x);

bias_pitch=polyval(line,0);
figure()
scatter(pitch_v(:,1),pitch_v(:,2));
hold on;
plot(x,y);

%save('pitch_v')
