# matlab-gpx-heatmap
Create heatmap in matlab from GPX files (e.g. from Strava history)
I wrote this to avoid paying Strava for a personal heatmap.
You need matlab.

## Source Data
The source data needs to be a load of GPX files saved in one folder.
You might find unzipall.bat a useful template if you need to unzip.  This requires 7zip.
You might find copyup.bat a useful tempalte if your files then end up in lots of sub-folders.  Remember the final \ in this.

## GPX Reader
Copied from this https://uk.mathworks.com/matlabcentral/fileexchange/24154-gpx-file-reader

## Google Map Data
Copied from this amazing piece of work: https://www.mathworks.com/matlabcentral/fileexchange/27627-zoharby-plot_google_map
Follow the instructions there to get your google maps API key
Paste your API key into testmap.m, and run this once to check it works.  You don't need to do that again.

## Usage
Edit loadall.m to point to your files.  Choose one of the files as the reference to centre the map on.
Run loadall.m
You can scroll around and zoom in the MATLAB figure and the plot_google_map.m magic will update the map.
Save using edit/copy figure or see the plot_google_map doc above on getting a higher res figure.

## Example Output
Here is my local running data

![Image of Greenhouse System Architecture](https://github.com/amj-git/greenhouse/blob/master/doc/Greenhouse%20Application%20Architecture.png)


