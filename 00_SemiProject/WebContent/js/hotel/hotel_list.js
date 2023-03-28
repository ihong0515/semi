/**
hotel_list.jsp js 파일
 */


$(function() { //onload
	
//-----JS for Price Range slider-----
	  var parent = document.querySelector(".range_slider");
	  if(!parent) return;

	  var
	    rangeS = parent.querySelectorAll(".range_range"),
	    numberS = parent.querySelectorAll(".range_number");

	  rangeS.forEach(function(el) {
	    el.oninput = function() {
	      var slide1 = parseFloat(rangeS[0].value),
	        	slide2 = parseFloat(rangeS[1].value);

	      if (slide1 > slide2) {
					[slide1, slide2] = [slide2, slide1];
	        // var tmp = slide2;
	        // slide2 = slide1;
	        // slide1 = tmp;
	      }
	      numberS[0].value = slide1;
	      numberS[1].value = slide2;
	    }
	  });

	  numberS.forEach(function(el) {
	    el.oninput = function() {
				var number1 = parseFloat(numberS[0].value),
						number2 = parseFloat(numberS[1].value);
				
	      if (number1 > number2) {
	        var tmp = number1;
	        numberS[0].value = number2;
	        numberS[1].value = tmp;
	      }
	      rangeS[0].value = number1;
	      rangeS[1].value = number2;
	    }
	  });
//-----JS for Price Range slider----- end


}); //onload end