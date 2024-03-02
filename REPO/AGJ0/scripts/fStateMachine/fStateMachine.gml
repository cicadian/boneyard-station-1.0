/// @func stateMachine_init
/// @desc {void} builds a state machine from a map
/// @arg {map} stateMap
/// @arg {script} stateDefault
function stateMachine_init(_stateMap, _stateDefault){
	_stateMap[? "PRV"] = _stateDefault;
	_stateMap[? "CUR"] = _stateDefault;
	_stateMap[? "NEXT"] = _stateDefault;
	_stateMap[? "INIT"] = false;
	_stateMap[? "DONE"] = false;
}

/// @func stateMachine_push
/// @desc {void} updates stateMap with the new state
/// @arg {script} state
/// @arg {map} stateMap
function stateMachine_push(_state, _stateMap){
	_stateMap[? "PRV"] = _stateMap[? "CUR"];
	_stateMap[? "NEXT"] = _state;
	stateMachine_set_done(_stateMap, true);
}

/// @func stateMachine_run
/// @desc {void} exceutes the current state
/// @arg {map} stateMap
function stateMachine_run(_stateMap){
	var _curState = _stateMap[? "CUR"];
	if (is_method(_curState)){
		method_call(_curState, []);
	}
	else{
		script_execute(_curState);
	}
}

/// @func stateMachine_get_init
/// @desc {type} gets if the current state has run startup code yet
/// @arg {map} stateMap
function stateMachine_get_init(_stateMap){
	return _stateMap[? "INIT"];
}

/// @func stateMachine_get_done
/// @desc {type} gets if the current state has run end code yet
/// @arg {map} stateMap
function stateMachine_get_done(_stateMap){
	return _stateMap[? "DONE"];
}

/// @func stateMachine_get_previous
/// @desc {script} gets the previous state machine script
/// @arg {map} stateMap
function stateMachine_get_previous(_stateMap){
	return _stateMap[? "PRV"];
}

/// @func stateMachine_get_current
/// @desc {script} gets the current state machine script
/// @arg {map} stateMap
function stateMachine_get_current(_stateMap){
	return _stateMap[? "CUR"];
}

/// @func stateMachine_set_init
/// @desc {void} sets the given statemap to be initialized
/// @arg {map} stateMap
/// @arg {bool} flag
function stateMachine_set_init(_stateMap, _flag){
	_stateMap[? "INIT"] = _flag;
}

/// @func stateMachine_set_done
/// @desc {void} sets the given statemap to be finished
/// @arg {map} stateMap
/// @arg {bool} flag
function stateMachine_set_done(_stateMap, _flag){
	_stateMap[? "DONE"] = _flag;
	if (!_flag){
		_stateMap[? "CUR"] = _stateMap[? "NEXT"];
		stateMachine_set_init(_stateMap, false);
	}
}