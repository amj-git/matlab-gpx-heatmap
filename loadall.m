

%Centre on a reference file

ref=loadgpx("data\activities\1289707912.gpx");
minx=min(ref(:,5));
maxx=max(ref(:,5));
miny=min(ref(:,4));
maxy=max(ref(:,4));

%scale up ref file a bit
deltax=maxx-minx;
deltay=maxy-miny;

scale=1.5;
minx=minx-deltax*(scale-1);
maxx=maxx+deltax*(scale-1);
miny=miny-deltay*(scale-1);
maxy=maxy+deltay*(scale-1);

%Plot the "heatmap"
figure(1);
clf;
xlim([minx maxx])
ylim([miny maxy])
axis equal;
grid on;
hold on;
myDir = "data\activities\";
myFiles = dir(fullfile(myDir,'*.gpx'));

hold off;
for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(myDir, baseFileName);
  %fprintf(1, 'Now reading %s\n', fullFileName);
  
  coords{k}=loadgpx(fullFileName);
  fnames{k}=fullFileName;
  p(k)=plot(coords{k}(:,5),coords{k}(:,4)); hold on;
  p(k).LineWidth=2;
  p(k).Color=[1 0 0 0.1];
  xlim([minx maxx]);
  ylim([miny maxy]); 
  title(k);
  drawnow;
end

plot_google_map;

%animate
set(p,'Visible','off'); for i=1:numel(p);set(p(i),'Visible','on');drawnow;end;