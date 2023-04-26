/**
hotel_list.jsp js 파일
 */

$(function() {
	let parent = document.querySelector(".range_slider");
	if(!parent) return;

	let rangeS = parent.querySelectorAll(".range_range");
	let numberS = parent.querySelectorAll(".range_number");

	rangeS.forEach(function(el) {
		el.oninput = function() {
			let slide1 = parseFloat(rangeS[0].value);
			let slide2 = parseFloat(rangeS[1].value);

			if (slide1 > slide2) {
				[slide1, slide2] = [slide2, slide1];
			}
			numberS[0].value = slide1;
			numberS[1].value = slide2;
		}
	});

	numberS.forEach(function(el) {
		el.oninput = function() {
			let number1 = parseFloat(numberS[0].value);
			let number2 = parseFloat(numberS[1].value);
	
			if (number1 > number2) {
				let tmp = number1;
				numberS[0].value = number2;
				numberS[1].value = tmp;
			}
			rangeS[0].value = number1;
			rangeS[1].value = number2;
		}
	});
}); //onload end