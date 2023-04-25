/**
 * 
 */

$(document).ready(function(){
	let sel = $('#loc');
	
	for(let i = 0; i < $(sel).length;i++){
		if($(sel).eq(i).val()==loc){
			$(sel).eq(i).attr('selected', true);
		}
	}
});