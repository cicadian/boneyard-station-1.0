/// @func dialog_lookup
/// @desc {void} lookup table for dialog and sets the current page max
/// @arg {real} event
/// @arg {real} page
function dialog_lookup(_event, _page){
	var _str = "LINE MISSING"
	dialog_page_count = 1;
	switch (_event){
		case __DIALOG.TUTORIAL:
			dialog_page_count = 3;
			if (_page == 0){
				_str = "Test dialog, this is a test. \"Wow, what an amazing test!\" \nThere will be more tests after this you assure yourself.";
			}
			if (_page == 1){
				_str = "PAGE 2";
			}
			if (_page == 2){
				_str = "GJQPIOBJWEOGITYHWEOGINGowieghweoighgnhu bibziuqwiuohwetewtpwetoh";
			}
			break;
	}
	return _str;
}