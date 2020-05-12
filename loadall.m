%loadall.m

%Centre on a reference file
%Edit this line to choose which file to reference your initial map on
%You can zoom around after this
ref=loadgpx("..\heatmap\data\activities\1289707912.gpx");
minx=min(ref(:,5));
maxx=max(ref(:,5));
miny=min(ref(:,4));
maxy=max(ref(:,4));

%scale up ref file a bit
deltax=maxx-minx;
deltay=maxy-miny;

%choose a scale factor for the initial map
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

%Edit this to point to a folder full of your GPX files
myDir = "..\heatmap\data\activities\";
myFiles = dir(fullfile(myDir,'*.gpx'));

hold off;
for k = 1:length(myFiles)
  baseFileName = myFiles(k).name;
  fullFileName = fullfile(myDir, baseFileName);
  %fprintf(1, 'Now reading %s\n', fullFileName);
  
  %use loadgpx to import the file
  coords{k}=loadgpx(fullFileName);
  fnames{k}=fullFileName;
  p(k)=plot(coords{k}(:,5),coords{k}(:,4)); hold on;
  p(k).LineWidth=2;  %2 pixel width - you can change this
  p(k).Color=[1 0 0 0.1];  %we use an alpha of 0.1 - you can change this and the colour
  xlim([minx maxx]);
  ylim([miny maxy]); 
  title(k);  %title displays the number of files processed
  drawnow;
end

%Add the google maps background using a function from another project
plot_google_map;

%animate (if you like) - you could take a vid of this
set(p,'Visible','off'); for i=1:numel(p);set(p(i),'Visible','on');drawnow;end;