%% init
close all
clear

%% Simple y = f(x) ploting, linear scale
% multiple steps
G1 = tf(2, [1, 4]);
G2 = tf(2, [0.5, 1, 2]);

[y1, t1] = step(G1, 20);
[y2, t2] = step(G2, 20);

path = '../';
figure
hold on
stairs(t1, y1);
stairs(t2, y2);
rasters = {'png', 'bmp', 'jpg', 'tikz', 'pdf'};
% rasters = {'pdf', 'png'};
xlabel('time')
ylabel('output')
f = get(gcf);
% return
for k = 1:1:length(rasters)
    f2p('step', 'Xlim', [0, 15], 'Ylim', [0, 5], 'Ytol', 0.2, 'Xtol', 0.2,...
        'extension', rasters{k}, 'Path', path, 'dpi', 120,...
        'papersize', [100, 10], 'Xsplit', 4)
end