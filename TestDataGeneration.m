%Point Data
x1 = [0 3 6];
y1 = [1 5 9];
v1 = [4 4 4];

x2 = [4 0 -4];
y2 = [3 3 3];
v2 = [0 0 0];

%Create Struct
for i=1:3
    r1.Frames(i) = struct('Vertical', y1(i),'Horizontal',x1(i), 'Velocity',v1(i));
    r2.Frames(i) = struct('Vertical', y2(i),'Horizontal',x2(i), 'Velocity',v2(i));
end


%Export as .mat
save('radar1data.mat','r1')
save('radar2data.mat','r2')