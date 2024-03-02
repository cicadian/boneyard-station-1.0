// State methods

function sample_declare_methods(){
	
	/// @func sample_init
	/// @desc {void} sets up instance
	sample_init = function(){
		// Run from create event
	}
	
	function state_sample_inactive(){
		var _stateMap = stateMap_sample;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		stateMachine_push(state_sample_default, _stateMap);
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
	function state_sample_default(){
		var _stateMap = stateMap_sample;
		if (!stateMachine_get_init(_stateMap)){
			stateMachine_set_init(_stateMap, true);
		}
		if (stateMachine_get_done(_stateMap)){
			stateMachine_set_done(_stateMap, false);
		}
	}
}
// External functions

enum _SAMPLE_TYPE {
	NONE,
	DEFAULT
}

/// @func sample_create
/// @desc {void} creates a sample object
/// @arg {real} x
/// @arg {real} y
/// @arg {real} type
function sample_create(_x, _y, _type){
var _id = instance_create_layer(_x, _y, global.layer_collider, oSample, 
	{
		type: _type,
	});
}

/// @func state_sample_get_inactive
/// @arg {id} id
function state_sample_get_inactive(_id){
	return stateMachine_get_current(_id.stateMap_sample) == state_sample_default;
}