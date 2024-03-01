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