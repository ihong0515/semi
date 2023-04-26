
function check(hotel_no) {
	let res = confirm("찜 취소하시겠습니까?");
	if(res) {
		location.href="user_jjim_cancel.do?hotel_no="+hotel_no;
	}
}