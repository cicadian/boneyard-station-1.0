/// @func walkzone_execute
/// @desc {void} runs walkzone behavior
/// @arg {id} id
function walkzone_execute(_id){
	switch (_id.type){
		case __WALKZONE_TYPE.ARMORY:
			//dialog event for pressing console at start
			oCont_Game.dialog_index = __DIALOG.MUSE_ARMORY;
			break;
		case __WALKZONE_TYPE.STATION:
			//dialog event for pressing console at start
			oCont_Game.dialog_index = __DIALOG.MUSE_STATION;
			break;
		case __WALKZONE_TYPE.CARGO:
			//dialog event for pressing console at start
			oCont_Game.dialog_index = __DIALOG.MUSE_CARGO;
			break;
		case __WALKZONE_TYPE.ENEMIES:
			//dialog event for pressing console at start
			oCont_Game.dialog_index = __DIALOG.MUSE_ENEMIES;
			break;
	}
}