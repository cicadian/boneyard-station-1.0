/// @func light_toggle
function light_toggle(){
	if (oCont_World.world_vbuff == oCont_World.world_light_vbuff){
		oCont_World.world_vbuff = oCont_World.world_dark_vbuff;
	}
	else{
		oCont_World.world_vbuff = oCont_World.world_light_vbuff;
	}
}