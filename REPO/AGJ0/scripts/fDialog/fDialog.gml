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
			dialog_page_count = 1;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "I don't think whoever is behind this door will help me.";
				audio_play_sound(doorknock, 0, 0);
			}
			break;
		case __DIALOG.MUSE_CARGO:
			dialog_page_count = 1;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "This must be another docked ship. The door is unlocked..."
			}
			break;
		case __DIALOG.BRIDGE_CONSOLE_END:
			dialog_page_count = 8;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "This is the station commander's desk, maybe he left a station log behind when this all started?"
			}
			if (_page == 1){
				dialog_portrait = sPort_Player;
				_str = "There's got be a disc or file somewhere in here..."
			}
			if (_page == 2){
				dialog_portrait = sPort_Player;
				_str = "\"These ones were taken in the last few days.\" \n2634.8.10.14:23 Junkyard Auditor's Report \n2634.8.11.08:46 Fuel delivery \n2634.8.11.16:12 Sensor Anomaly";
			}
			if (_page == 3){
				dialog_portrait = sPort_Player;
				_str = "Let's start with the oldest one first."
			}
			if (_page == 4){
				dialog_portrait = sPort_Commander;
				_str = "\"Station log: I've just read the final audit on the last batch of scuttled freighters we recieved. They were all said to have been used for hauling rare minerals, but one of them has an unmarked cargo shuttle in it.\"";
			}
			if (_page == 5){
				dialog_portrait = sPort_Commander;
				_str = "\"Scans haven't determined the contents so I will be sending a team to investigate. We don't want to take apart anything potentially hazardous.\"";
			}
			if (_page == 6){
				dialog_portrait = sPort_Commander;
				_str = "\"Station log: The team I sent to investigate the unmarked shuttle doesn't have the equipment necesarry to open it. I have asked them to bring it to the mech bay. Hopefully there's nothing dangerous inside.\"";
			}
			if (_page == 7){
				dialog_portrait = sPort_Player;
				_str = "I can unlock the mechbay from here, it shouldn't be far.";
				with (oDoor){
					//if (name == "MECHBAY_CORRIDOR"){
						stateMachine_push(state_door_closed, stateMap_door);
					//}
				}
			}
			break;
		case __DIALOG.BRIDGE_CONSOLE_END_2:
			dialog_page_count = 5;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "It looks like the fuel delivery log is corrupted, but a fuel delivery would explain the docked ship I was on earlier."
			}
			if (_page == 1){
				dialog_portrait = sPort_Player;
				_str = "The last log entry is ready."
			}
			if (_page == 2){
				dialog_portrait = sPort_Commander;
				_str = "\"Station log: We've taken the shuttle aboard and my crew is working on opening it. There is some kind of sensor anomaly we've detected inside. I've been told there's no radiation threat, maybe someone left some seafood in the fridge and forgot about it.\"";
			}
			if (_page == 3){
				dialog_portrait = sPort_Commander;
				_str = "\"Station! I've activated the automated distress signal, but nothing feels real anymore, have I? Did I kill my crew? Did they kill me? Where is my light? When is help arriving? I keep.. pacing. Power will run out soon, where is that delivery... I... Who?\"";
			}
			if (_page == 4){
				_str = "I should leave, this is a job for a star cruiser, a research ship. Not a scout pilot."
				with (oWalkzone){
					if (type == __WALKZONE_TYPE.FEAR){
						available = true;
					}
				}
			}
			break;
		case __DIALOG.BRIDGE_CONSOLE_END_3:
			dialog_page_count = 2;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "Wait, there's something else here..."
			}
			if (_page == 1){
				dialog_portrait = sPort_Player;
				_str = "the shaDows     Keep LIHTJG light At bay the light feaRR"
			}
			break;
		case __DIALOG.MUSE_FEAR:
			dialog_page_count = 1;
			if (_page == 0){
				dialog_portrait = sPort_Player;
				_str = "I shouldn't go back, it's too dark, I should... Find the mechbay"
				global.unlock_flee = true;
			}
			break;
	}
	return _str;
}