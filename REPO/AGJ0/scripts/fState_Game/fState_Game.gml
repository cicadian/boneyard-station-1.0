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
			stateMachine_set_init(_stateMap, true);
		}
		if (counter_tutorial != -1){
			if (counter_tutorial >= counter_tutorial_max){
				dialog_index = __DIALOG.TUTORIAL;
				dialog_string = dialog_lookup(dialog_index, dialog_page);
				counter_tutorial = -1;
			}
			else{
				counter_tutorial++;
			}
		}
		
		if (dialog_displayed){
			lock_controls = true;
			if (dialog_index != -1){
				if (keyboard_check_pressed(KEY_SKIP) || mouse_check_button_pressed(MOUSE_INTERACT)){
					dialog_page++;
					if (dialog_page >= dialog_page_count){
						dialog_page = 0;
						dialog_index = -1;
						dialog_string = "";
						lock_controls = false;
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