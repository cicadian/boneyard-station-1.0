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
	switch (_event){
		case __DIALOG.MUSE_ARMORY:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "The airlock is to the left, I should go right first to get my weapon from the locker.";
			}
			break;
		case __DIALOG.ARMORY_OPEN_CASE:
			_str = "";
			break;
		case __DIALOG.ARMORY_GET_GUN:
			dialog_page_count = 2;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "I've had this pistol most of my career, though I've never needed to fire it."
			}
			if (_page == 1){
				_str = "\"Here's hoping...\"";
			}
			break;
		case __DIALOG.ARMORY_HAVE_GUN:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "I already got my weapon, there's nothing else useful in here."
			}
			break;
		case __DIALOG.ARMORY_REMINDER:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "I shouldn't try to board the station unarmed. With no way to communicate with the station commander I have no way of knowing if it's safe to board."
			}
			break;
		case __DIALOG.ENGINE:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "This is the fuel hatch for my ship, I better not mess with this."
			}
			break;
		case __DIALOG.MUSE_STATION:
			dialog_page_count = 3;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "\"...\"";
			}
			if (_page == 1){
				_str = "This looks bad.";
			}
			if (_page == 2){
				_str = "I need to find an access panel if I want to get anywhere.";
			}
			break;
		case __DIALOG.LIGHT0:
			dialog_page_count = 2;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "Looks like someone has removed the fuel crystals from the power grid nearby.";
			}
			if (_page == 1){
				_str = "There's controls here for the emergency lights, but until power is restored I won't be able to access much of the station.";
			}
			break;
		case __DIALOG.POWERSTATION_NOFUEL:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "Someone has taken the fuel from this receptacle, I won't be able to explore the rest of the station until I find some way to turn the power back on.";
			}
			break;
		case __DIALOG.POWERSTATION_FUELINHAND:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "There we go, back where you belong.";
			}
			break;
		case __DIALOG.POWERSTATION_HASFUEL:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "Station power is restored, I should try looking around for a way up to the main deck.";
			}
			break;
		case __DIALOG.MUSE_ENEMIES:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "Better get my weapon ready before going any further.";
			}
			break;
		case __DIALOG.FUEL_PICKUP:
			dialog_page_count = 1;
			dialog_portrait = sPort_Player;
			if (_page == 0){
				_str = "This must be the missing fuel for the station. What is going on here?";
			}
			break;
		case __DIALOG.MAD_CAPTAIN:
			dialog_page_count = 5;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "\"Is there anyone there?\"";
				audio_play_sound(doorknock, 0, 0);
			}
			if (_page == 1){
				dialog_portrait = sPort_Captain;
				_str = "\"Go away! This one hides in the shadows. Have to get away!\"";
			}
			if (_page == 2){
				dialog_portrait = sPort_Player;
				_str = "\"Please I only want to find out what happened here. Can't you tell me anything?\"";
			}
			if (_page == 3){
				dialog_portrait = sPort_Captain;
				_str = "\"It beckons to us... Do not believe. Do not see. Keep to the shadows...\"";
			}
			if (_page == 4){
				dialog_portrait = sPort_Player;
				_str = "\"...\"";
			}
			break;
		case __DIALOG.MAD_CAPTAIN_2:
			dialog_page_count = 2;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "I don't think whoever is behind this door will help me.";
				audio_play_sound(doorknock, 0, 0);
			}
			break;
	}
	return _str;
}