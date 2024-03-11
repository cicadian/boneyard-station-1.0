// State methods

function game_declare_methods(){

	function state_game_inactive(){
		var _stateMap = stateMap_game;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		stateMachine_push(state_game_intro, _stateMap);
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	function state_game_intro(){
		var _stateMap = stateMap_game;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
			audio_play_sound(aDeerbell, 0, 0);
			draw_intro = true;
			draw_animatic = true;
		}
		if ((keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_lalt) && !keyboard_check_pressed(vk_ralt) && !keyboard_check_pressed(vk_enter)) || mouse_check_button_pressed(mb_any)){
			// clear any intro stuff!!
			intro_counter = 0;
			draw_intro = false;
			draw_black = true;
			stateMachine_push(state_game_opener, _stateMap);
		}
		if (intro_counter >= intro_counter_max){
			intro_counter = 0;
			if (intro_frame < intro_frame_max - 1){
				intro_frame++;
				intro_counter = -1;
			}
			else{
				draw_intro = false;
				draw_black = true;
				stateMachine_push(state_game_opener, _stateMap);	
			}
		}
		intro_counter++;
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	function state_game_opener(){
		var _stateMap = stateMap_game;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
			audio_play_sound(ambient_0, 0, 0);
			draw_black = false;
			surface_free(surf_spatter);
			surf_spatter = -1;
		}
		if ((keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_lalt) && !keyboard_check_pressed(vk_ralt) && !keyboard_check_pressed(vk_enter)) || mouse_check_button_pressed(mb_any)){
			animatic_counter = animatic_counter_max;
		}
		if (animatic_counter >= animatic_counter_max){
			animatic_counter = 0;
			if (animatic_frame == 0){
				animatic_string = "Boneyard Station."
			}
			if (animatic_frame == 1){
				animatic_string = "A far-flung scrapyard orbiting an ancient battlefield."
			}
			if (animatic_frame == 2){
				animatic_string = "Several days ago contact was lost, and none of the scheduled arrivals have returned."
			}
			if (animatic_frame == 3){
				animatic_string = "I've been sent to investigate the severity of this incident, and report back to my superiors what I discover."
			}
			if (animatic_frame < 5){
				animatic_frame++;
				animatic_counter = -1;
			}
			else{
				draw_animatic = false;
				draw_black = true;
				audio_stop_all();
				stateMachine_push(state_game_default, _stateMap);	
			}
		}
		animatic_counter++;
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	function state_game_outro(){
		var _stateMap = stateMap_game;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
			audio_stop_all();
			black_counter = 0;
			animatic_frame = 0;
			animatic_counter = 0;
			draw_black = false;
			
			draw_imtired = true;
			surface_free(surf_spatter);
			surf_spatter = -1;
			if (global.ending_flee){
				
			}
			else if (global.ending_eaten){
				
			}
			else if (global.ending_beastkiller){
				audio_play_sound(monster_die_final, 3, 0, 2);
			}
		}
		if ((keyboard_check_pressed(vk_anykey) && !keyboard_check_pressed(vk_lalt) && !keyboard_check_pressed(vk_ralt) && !keyboard_check_pressed(vk_enter)) || mouse_check_button_pressed(mb_any)){
			animatic_counter = animatic_counter_max;
		}
		if (animatic_counter >= animatic_counter_max){
			draw_animatic = true;
			animatic_counter = 0;
			if (global.ending_flee){
				spr_animatic = sEnding_Flee;
				if (animatic_frame == 0){
					animatic_string = "\"Must find the light.\""
				}
				if (animatic_frame == 1){
					animatic_string = "\"There! That beautiful glow...\""
				}
				if (animatic_frame == 2){
					animatic_string = ""
				}
				if (animatic_frame == 3){
				}
			}
			else if (global.ending_eaten){
				spr_animatic = sEnding_Eaten;
				animatic_string = "";
				/*
				if (animatic_frame == 0){
					animatic_string = "\"The light!\""
				}
				if (animatic_frame == 1){
					animatic_string = "\"There!\""
				}
				if (animatic_frame == 2){
					animatic_string = "\"Aghhh!!\""
				}
				if (animatic_frame == 3){
				}
				*/
			}
			else if (global.ending_beastkiller){
				spr_animatic = sEnding_Beastkiller;
				if (animatic_frame == 0){
					animatic_string = ""
				}
				if (animatic_frame == 1){
					animatic_string = "\"A beast that fears the shadows, I think that's a new one.\""
				}
				if (animatic_frame == 2){
					animatic_string = ""
				}
				if (animatic_frame == 3){
					animatic_string = "\"My head is starting to clear up now. I should report back what I've experienced.\""
				}
				if (animatic_frame == 4){
					animatic_string = "";
				}
			}
			if (animatic_frame < animatic_frame_max){
				if (global.ending_eaten){
					audio_play_sound(monster_cry, 2, 0, 2);
				}
				animatic_frame++;
				animatic_counter = -1;
			}
			else{
				game_end();
			}
		}
		animatic_counter++;
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
			oCont_Game.dialog_index = __DIALOG.INTRO_WASD;
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
					_walkzone.triggered = true;
					walkzone_execute(_walkzone);
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
function state_game_get_opener(_id){
	return stateMachine_get_current(_id.stateMap_game) == state_game_opener;
}