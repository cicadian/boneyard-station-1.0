/// @func walkzone_execute
/// @desc {void} runs walkzone behavior
/// @arg {id} id
function walkzone_execute(_id){
	if (_id.available){
		switch (_id.type){
			case __WALKZONE_TYPE.ARMORY:
				oCont_Game.dialog_index = __DIALOG.MUSE_ARMORY;
				break;
			case __WALKZONE_TYPE.STATION:
				oCont_Game.dialog_index = __DIALOG.MUSE_STATION;
				break;
			case __WALKZONE_TYPE.CARGO:
				oCont_Game.dialog_index = __DIALOG.MUSE_CARGO;
				break;
			case __WALKZONE_TYPE.CHECKPOINT_CARGO:
				oCont_Game.dialog_index = __DIALOG.MUSE_ENEMIES;
				oPlayer.checkpoint_x = _id.x;
				oPlayer.checkpoint_y = _id.y;
				oPlayer.checkpoint_dir = _id.dir;
				break;
			case __WALKZONE_TYPE.CHECKPOINT_FINALE:
				oPlayer.checkpoint_x = _id.x;
				oPlayer.checkpoint_y = _id.y;
				oPlayer.checkpoint_dir = _id.dir;
				break;
			case __WALKZONE_TYPE.FEAR:
				oCont_Game.dialog_index = __DIALOG.MUSE_FEAR;
				break;
			case __WALKZONE_TYPE.ENDING:
				if (_id.available){
					oPlayer.life = 0;
					global.ending_eaten = true;
					animatic_frame_max = 3;
					stateMachine_push(state_game_outro, stateMap_game);
				}
				break;
		}
	}
}