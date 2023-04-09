/**
 * 
 */

function nextSlideImg(self){
	$(self).hide();
	if($(self).next().length==0){
		$(self).parent().find("img:first-child").show();
	}else{
		$(self).next().show();
	}
}