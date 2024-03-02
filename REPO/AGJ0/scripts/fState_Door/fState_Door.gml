// State methods

function door_declare_methods(){

	state_door_inactive = function(){
		var _stateMap = stateMap_door;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		stateMachine_push(state_door_closed, _stateMap);
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	state_door_open = function(){
		var _stateMap = stateMap_door;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		if (keyboard_check_pressed(vk_escape)){
			stateMachine_push(state_door_closed, _stateMap);
		}
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	state_door_closed = function(){
		var _stateMap = stateMap_door;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		if (keyboard_check_pressed(vk_escape)){
			stateMachine_push(state_door_open, _stateMap);
		}
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
}
// External functions

/// @func state_door_get_inactive
/// @arg {id} id
function state_door_get_inactive(_id){
	return stateMachine_get_current(_id.stateMap_door) == _id.state_door_default;
}

/// @func state_door_get_closed
/// @arg {id} id
function state_door_get_closed(_id){
	return stateMachine_get_current(_id.stateMap_door) == _id.state_door_closed;
}

/// @func state_door_get_open
/// @arg {id} id
function state_door_get_open(_id){
	return stateMachine_get_current(_id.stateMap_door) == _id.state_door_open;
}