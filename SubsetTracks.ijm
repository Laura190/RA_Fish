n_tracks=Table.size();
tracks=Table.getColumn("Value");
selectWindow("Tracks.csv");
//Table.deleteRows(1, 3);
total_tracks=Table.size();
track_index=newArray(n_tracks);
track_displacement=newArray(n_tracks);
track_mean_speed=newArray(n_tracks);
n_nans=0;
for (i = 0; i < n_tracks ; i++) {
	track=tracks[i];
	if (!isNaN(track)) {
		count = 0;
		while (Table.get("TRACK_ID", count)!=track && count < total_tracks-1) { 
			count++;
		}
		if (Table.get("TRACK_ID", count)==track) {
		track_index[i]=Table.get("TRACK_INDEX", count);
		track_displacement[i]=Table.get("TRACK_DISPLACEMENT", count);
		track_mean_speed[i]=Table.get("TRACK_MEAN_SPEED", count);
		} else {
			track_index[i]=NaN;
			track_displacement[i]=NaN;
			track_mean_speed[i]=NaN;
		}
	} else {
		n_nans++;
	}
}
track_index=Array.trim(track_index,n_tracks-n_nans);
track_displacement=Array.trim(track_displacement,n_tracks-n_nans);
track_mean_speed=Array.trim(track_mean_speed,n_tracks-n_nans);
Array.show("subtrack",track_index, track_displacement, track_mean_speed);
