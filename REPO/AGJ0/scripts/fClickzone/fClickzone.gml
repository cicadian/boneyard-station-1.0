/// @func clickzone_build
/// @desc {void} builds a clickzone wall
/// @arg {id} id
/// @arg {vbuff} vbuff
function clickzone_build(_id, _vbuff){
	
	var _u = oCont_World.texcoord_floor_u;
	switch (_id.type){
		case __CLICKZONE_TYPE.START_CONSOLE:
			_u = oCont_World.texcoord_console_u;
			break;
		case __CLICKZONE_TYPE.ENGINE:
			_u = oCont_World.texcoord_engine_u;
			break;
		case __CLICKZONE_TYPE.ARMORY:
			_u = oCont_World.texcoord_armory_u;
			break;
		case __CLICKZONE_TYPE.EMERGENCY_LIGHTSWITCH:
			_u = oCont_World.texcoord_lightswitch_u;
			break;
		case __CLICKZONE_TYPE.EMERGENCY_LIGHTSWITCH_2:
			_u = oCont_World.texcoord_lightswitch_u;
			break;
		case __CLICKZONE_TYPE.FUEL_SLOT:
			_u = oCont_World.texcoord_fuelslot_u;
			break;
		case __CLICKZONE_TYPE.FUEL:
			_u = oCont_World.texcoord_fuelslot_u;
			break;
		case __CLICKZONE_TYPE.ELEVATOR_UP:
			_u = oCont_World.texcoord_elevator_u;
			break;
		case __CLICKZONE_TYPE.ELEVATOR_DOWN:
			tex = oCont_World.world_tex_1;
			_u = oCont_World.texcoord_elevator_u;
			break;
		case __CLICKZONE_TYPE.BRIDGE_CONSOLE:
			_u = oCont_World.texcoord_fuel_u;
			if (wall == __CELL_WALLS.NORTH){
				tex = oCont_World.world_tex_0;
			}
			else if (wall == __CELL_WALLS.WEST){
				tex = oCont_World.world_tex_1;
			}
			else if (wall == __CELL_WALLS.EAST){
				tex = oCont_World.world_tex_2;
			}
			break;
	}
	var _v = oCont_World.texcoord_special_v;
	world_build_wall(_id.grid_x, _id.grid_y, _id.wall, _vbuff, _u, _v);
}
/// @func clickzone_execute
/// @desc {void} runs clickzone behavior
/// @arg {id} id
function clickzone_execute(_id){
	switch (_id.type){
		case __CLICKZONE_TYPE.START_CONSOLE:
			//dialog event for pressing console at start
			if (!global.unlock_flee){
				oCont_Game.dialog_index = __DIALOG.BRIDGE_CONSOLE_START;
				audio_play_sound(switchsound, 0, false);
			}
			else{
				stateMachine_push(state_game_ending_flee, stateMap_game);
			}
			
			break;
		case __CLICKZONE_TYPE.ARMORY:
			//dialog event for pressing console at start
			if (_id.stage == 0){
				_id.tex = oCont_World.world_tex_1;
				audio_play_sound(openbox, 0, false);
				_id.stage++;
			}
			else if (_id.stage == 1){
				oCont_Game.dialog_index = __DIALOG.ARMORY_GET_GUN;
				audio_play_sound(takegun, 0, false);
				_id.tex = oCont_World.world_tex_2;
				global.has_gun = true;
				_id.stage++;
			}
			else if (_id.stage == 2){
				oCont_Game.dialog_index = __DIALOG.ARMORY_HAVE_GUN;
			}
			break;
		case __CLICKZONE_TYPE.EMERGENCY_LIGHTSWITCH:
			//dialog event for pressing console at start
			if (_id.stage == 0){
				oCont_Game.dialog_index = __DIALOG.LIGHT0;
				_id.stage++;
			}
			else if (_id.stage == 1){
				light_toggle();
			}
			break;
		case __CLICKZONE_TYPE.EMERGENCY_LIGHTSWITCH_2:
			light_toggle();
			break;
		case __CLICKZONE_TYPE.ENGINE:
			//dialog event for useless engine hatch on starting ship
			oCont_Game.dialog_index = __DIALOG.ENGINE;
			break;
		case __CLICKZONE_TYPE.FUEL_SLOT:
			//dialog event for useless engine hatch on starting ship
			if (oCont_Game.have_fuel){
				if (_id.stage == 0){
					_id.stage++;
					_id.tex = oCont_World.world_tex_1;
					_id.emit = audio_emitter_create();
					//audio_emitter_position(emit, _id.grid_x, _id.grid_y);
					//audio_emitter_falloff(emit, 100, 16, 1);
					audio_play_sound_at(poweractive, _id.x, _id.y, 0, 100, 16, 1, true, 0);
					with (oDoor){
						if (name == "LOCKED_ELEVATOR"){
							stateMachine_push(state_door_closed, stateMap_door);
						}
					}
					oCont_Game.dialog_index = __DIALOG.POWERSTATION_FUELINHAND;
				}
				else if (_id.stage == 1){
					oCont_Game.dialog_index = __DIALOG.POWERSTATION_HASFUEL;
				}
			}
			else{
				oCont_Game.dialog_index = __DIALOG.POWERSTATION_NOFUEL;
			}
			break;
		case __CLICKZONE_TYPE.FUEL:
			if (_id.stage == 0){
				_id.stage++;
				_id.tex = oCont_World.world_tex_0;
				oCont_Game.have_fuel = true;
				oCont_Game.dialog_index = __DIALOG.FUEL_PICKUP;
			}
			break;
		case __CLICKZONE_TYPE.MAD_CAPTAIN:
			if (_id.stage == 0){
				_id.stage++;
				oCont_Game.dialog_index = __DIALOG.MAD_CAPTAIN;
			}
			else if (_id.stage == 1){
				oCont_Game.dialog_index = __DIALOG.MAD_CAPTAIN_2;
			}
			break;
		case __CLICKZONE_TYPE.BRIDGE_CONSOLE:
			if (_id.wall == __CELL_WALLS.NORTH){
				if (_id.stage == 0){
					_id.stage++;
					oCont_Game.dialog_index = __DIALOG.BRIDGE_CONSOLE_END;
				}
				else if (_id.stage == 1){
					_id.stage++;
					oCont_Game.dialog_index = __DIALOG.BRIDGE_CONSOLE_END_2;
				}
				else if (_id.stage == 2){
					oCont_Game.dialog_index = __DIALOG.BRIDGE_CONSOLE_END_3;
				}
			}
			break;
		case __CLICKZONE_TYPE.ELEVATOR_UP:
			oPlayer.x = 38;
			oPlayer.y = 126;
			oPlayer.grid_x = 38 div CELL_SIZE;
			oPlayer.grid_y = 126 div CELL_SIZE;
			audio_play_sound(switchsound, 0, 0);
			break;
		case __CLICKZONE_TYPE.ELEVATOR_DOWN:
			oPlayer.x = 250;
			oPlayer.y = 14;
			oPlayer.grid_x = 250 div CELL_SIZE;
			oPlayer.grid_y = 14 div CELL_SIZE;
			audio_play_sound(switchsound, 0, 0);
			break;
	}
}