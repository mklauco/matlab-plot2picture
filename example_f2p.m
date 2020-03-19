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
% rasters = {'png', 'bmp', 'jpg', 'tikz'};
rasters = {'pdf'};
xlabel('time')
ylabel('output')
f = get(gcf);
% return
for k = 1:1:length(rasters)
    f2p('step', 'Xlim', [0, 15], 'Ylim', [0, 5], 'Ytol', 0.2, 'Xtol', 0.2,...
        'extension', rasters{k}, 'Path', path, 'dpi', 120, 'papersize', [15, 10], 'Xsplit', 4)
end

%% Log-scale plots

x = logspace(-1, 1, 1000);
y = exp(x);

figure
hold on
loglog(x, y)
loglog(0.05, 100, 'bo')
loglog(5, 100, 'bo')
f2p('log', 'xscale', 'log', 'xlim', [-2, 2], 'Xtol', 0.0, 'Ytol', 1,...
    'yscale', 'log', 'Ylim', [-1, 7], 'Xsplit', 2,'Ysplit', 7, 'extension', 'pdf')
f = get(gcf);