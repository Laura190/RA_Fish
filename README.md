# RA_Fish

A collection of ImageJ macros for analysing macrophage response to bacterial infections in zebrafish

## InfectionSites.ijm
Automatically detects areas of bacterial infection and allows user to select which regions are considered sites. Assumes the infection site is the same for all time.

### How to use
1. Open a single channel image stack in Fiji (or split channels from a multichannel image stack)
2. Run macro
3. When prompted either select single ROIs and add them to the manager or select groups of ROIs and use More...> OR (Combine) to group them and then add the new group to the manager. Click OK.
4. Convex hulls of the selected regions will be output to the ROI manager

### Troubleshooting
Huang threshold is used, this may be to be changed depending on data

## TracksIntersectRois.ijm
Identifies tracks (from TrackMate analysis) which intersect ROIs in the ROI manager.

### How to use
1. Open ROI manager and add ROIs (or use ROIs from InfectionSites.ijm)
2. Open .csv of the Spots TrackMate results in Fiji
3. Run macro
4. Number of windows equal to ROIs will be opened. Each window will contain a list of the track IDs that contain a spot which intersects the ROI at any time.

## SubsetTracks.ijm
Pulls relevent information about the tracks of interest

### How to use
1. Open list of track IDs for tracks of interest in Fiji (or use opened windows from TrackIntersectRois.ijm)
2. Open .csv of Tracks TrackMate results in Fiji
3. Run macro
4. Will open window containing a subset of information about the requested tracks, track ID, track displacement and track mean speed

### Troubleshooting
Other values from the Tracks.csv file can be added.
