/// @func dialog_lookup
/// @desc {void} lookup table for dialog and sets the current page max
/// @arg {real} event
/// @arg {real} page
function dialog_lookup(_event, _page){
	var _str = "LINE MISSING"
	dialog_page_count = 1;
	switch (_event){
		case __DIALOG.BRIDGE_CONSOLE_START:
			dialog_page_count = 4;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "I've docked with the station but nobody is responding to my hails. Maybe I should try again?";
			}
			if (_page == 1){
				_str = "\"This is Captain Damian of the scout vessel Kestrel calling Boneyard Station, does anyone read me?\"";
			}
			if (_page == 2){
				_str = "\"Damn...\""
			}
			if (_page == 3){
				_str = "Guess I better head to the back of my ship and see if I can get through the airlock. It might be a good idea to arm myself too.";
			}	
			break;
	}
	return _str;
}