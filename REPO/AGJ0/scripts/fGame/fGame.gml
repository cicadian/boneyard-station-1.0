// State methods

function game_declare_methods(){

	function state_game_inactive(){
		var _stateMap = stateMap_game;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		stateMachine_push(state_game_default, _stateMap);
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	function state_game_default(){
		var _stateMap = stateMap_game;
		if (!stateMachine_get_init(_stateMap)){
			track0 = audio_play_sound(ambient_0, 0, true, 0.5);
			track1 = audio_play_sound(ambient_1, 1, true, 0);
			stateMachine_set_init(_stateMap, true);
			cursor_spr = cursor_default;
		}
		//if (counter_tutorial != -1){
		//	if (counter_tutorial >= counter_tutorial_max){
		//		dialog_index = __DIALOG.TUTORIAL;
		//		dialog_string = dialog_lookup(dialog_index, dialog_page);
		//		counter_tutorial = -1;
		//	}
		//	else{
		//		counter_tutorial++;
		//	}
		//}
		if (!dialog_displayed){
			if (mouse_check_button_pressed(MOUSE_INTERACT)){
				var _clickzone = instance_position(oPlayer.x, oPlayer.y, oClickzone);
				mouse_clear(MOUSE_INTERACT);
				if (_clickzone != noone){
					if (oPlayer.facing == _clickzone.wall){
						clickzone_execute(_clickzone);
					}
				}
				var _door = instance_position((oPlayer.grid_x + oPlayer.vec_x) * CELL_SIZE, (oPlayer.grid_y + oPlayer.vec_y) * CELL_SIZE, oDoor);
				if (_door != noone){
					if (state_door_get_closed(_door) && !state_door_get_locked(_door)){
						with (_door){
							audio_play_sound(dooropen, 0, 0);
							stateMachine_push(state_door_open, stateMap_door);
						}
					}
					else if (state_door_get_open(_door)){
						with (_door){
							audio_play_sound(doorclose, 0, 0);
							stateMachine_push(state_door_closed, stateMap_door);
						}
					}
					else if (state_door_get_locked(_door)){
						if (_door.name != "ALWAYSLOCKED"){
							audio_play_sound(doorlocked, 0, 0);
						}
					}
				}
			}
			var _walkzone = instance_position(oPlayer.x, oPlayer.y, oWalkzone);
			if (_walkzone != noone){
				if (!_walkzone.triggered){
					walkzone_execute(_walkzone);
					_walkzone.triggered = true;
				}
			}
		}

		if (dialog_index != -1 && !dialog_displayed){
			dialog_string = dialog_lookup(dialog_index, dialog_page);
			dialog_displayed = true;
		}
		
		if (dialog_displayed){
			lock_controls = true;
			if (dialog_index != -1){
				if (keyboard_check_pressed(KEY_SKIP) || mouse_check_button_pressed(MOUSE_INTERACT)){
					dialog_page++;
					if (dialog_page >= dialog_page_count){
						if (dialog_index == __DIALOG.LIGHT0){
							light_toggle();
						}
						dialog_page = 0;
						dialog_index = -1;
						dialog_string = "";
						dialog_displayed = false;
						lock_controls = false;
						dialog_portrait = -1;
					}
					else{
						dialog_string = dialog_lookup(dialog_index, dialog_page);
					}
				}
			}
		}
		
		if (dialog_index != -1){
			dialog_displayed = true;
		}
		else{
			lock_controls = false;
		}
		
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
}
// External functions

/// @func state_sample_get_inactive
/// @arg {id} id
function state_game_get_inactive(_id){
	return stateMachine_get_current(_id.stateMap_game) == state_game_default;
}