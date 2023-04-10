
function check(user_no, hotel_no) {
	let res = confirm("찜 취소하시겠습니까?");
	if(res) {
		location.href="user_jjim_cancel.do?user_no="+user_no+"&&hotel_no="+hotel_no;
	}
}