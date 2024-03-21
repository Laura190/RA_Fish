//Open spot results from TrackMate
//open("Spots.csv");
Table.deleteRows(1, 3);
n_spots=Table.size();
for (k = 0; k < roiManager("count"); k++) {
roiManager("Select", k);
count=1;
track_ids=0;
selectWindow("Spots.csv");
for (i = 0; i < n_spots; i++) {
	ar_id = newArray(1);
	an_id = parseFloat(Table.getString("TRACK_ID", i));
	ar_id[0]= an_id;
	x=parseFloat(Table.getString("POSITION_X", i));
	x=x/0.1489266;
	y=parseFloat(Table.getString("POSITION_Y", i));
	y=y/0.1489266;
	if (Roi.contains(x, y)) {
		if (count==1) {
			track_ids = ar_id;
			count++;
		} else {
			j=0;
			unique_track = true;
			while (unique_track && j<count-1) {
				if (an_id != track_ids[j]) {
					unique_track = true;
				} else {
					unique_track = false;
				}
				j++;
			}
			if (unique_track){
				track_ids = Array.concat(track_ids,an_id);	
				count++;
			}
		}
	}
}
Array.sort(track_ids);
Array.show(track_ids);
Table.rename("track_ids", "track_ids-"+d2s(k, 0));
}