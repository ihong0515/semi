<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 호텔 리스트</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.3/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/e6bfca85af.js" crossorigin="anonymous"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mapping/mapping_main.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/mapping/mapping_main.js"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/mapping/jquery.fullPage.css">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/mapping/jquery.fullPage.js"></script>
</head>
<body>
	<div id="fullpage">
		<div class="section">
			<div class="sec_nav">
				<a href="<%=request.getContextPath() %>/index.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
			</div>
			<div id="mapping" align="center">
				<img alt="" src="<%=request.getContextPath() %>/image/map/seoul.png" usemap="#mapping_area" id="mapping_img">
				<%-- <map name="mapping_area">
					<area shape="poly" alt="서울" title="" coords="110,34,116,38,125,33,131,39,128,51,135,53,132,64,136,66,131,85,131,90,151,82,153,92,145,97,140,106,145,113,130,127,117,136,110,125,99,126,88,134,79,128,74,135,66,111,54,121,52,110,54,94,52,91,46,93,37,88,43,80,48,69,61,81,75,74,79,52,90,49,94,59,100,58,98,47,103,40" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/seoul.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="경기" title="" coords="237,47,248,57,256,53,261,57,270,57,272,64,281,70,281,77,276,79,275,90,280,100,283,97,296,106,293,110,295,119,293,125,290,137,290,142,282,141,285,148,270,150,267,155,258,161,248,157,242,158,240,155,236,161,229,160,224,151,220,144,215,137,218,129,225,130,212,115,214,112,208,99,195,102,193,81,208,87,216,85,218,70,226,64,233,55" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungki.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="강원" title="" coords="334,11,353,51,371,81,384,96,397,120,405,134,404,143,398,151,368,142,364,145,362,151,333,139,332,135,323,133,314,137,309,131,306,132,303,141,293,141,291,134,297,115,294,109,299,107,282,97,276,82,282,73,276,65,271,65,269,56,263,55,260,50,246,53,241,43,255,35,293,35,316,36,330,23" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kangwon.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="충북" title="" coords="351,149,339,165,341,168,335,172,327,166,323,171,315,171,310,179,303,183,296,192,301,194,301,201,299,208,302,212,298,214,300,217,303,218,309,219,312,221,307,226,308,235,304,241,292,240,284,234,281,224,272,224,272,228,264,223,259,225,256,218,259,210,268,194,258,187,263,178,267,177,266,171,261,162,271,153,275,150,278,152,287,142,292,140,296,143,305,139,304,133,307,132,314,137,324,133,330,137,328,141,338,142,340,145,346,144" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/chungbuk.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="충남" title="" coords="248,156,267,174,257,183,257,190,262,195,263,207,256,210,256,221,260,230,265,227,270,229,275,221,279,223,281,233,284,241,277,246,271,246,262,236,245,238,243,231,230,231,228,238,216,243,202,230,202,205,199,192,201,179,194,187,175,174,180,165,189,164,211,154,225,158,225,169,231,163" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/chungnam.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="경북" title="" coords="404,141,411,147,411,161,416,175,413,184,410,188,414,198,411,215,412,233,410,239,415,243,419,237,424,239,419,252,418,272,402,273,396,267,386,269,388,273,381,278,376,275,366,283,351,280,347,271,337,276,333,273,323,273,323,265,315,256,310,257,304,251,301,241,306,237,311,226,315,224,313,219,305,221,303,216,299,217,299,214,304,210,303,198,297,189,308,180,313,181,314,173,329,166,335,173,344,166,340,161,352,153,351,150,361,150,364,152,367,143,373,145,373,148,387,147,390,145,395,149,400,151,401,145" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungbuk.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="경남" title="" coords="299,253,310,258,315,256,321,264,324,268,320,274,332,272,338,277,346,274,352,280,370,280,376,272,388,274,386,269,399,268,403,272,415,274,416,287,409,292,410,302,399,317,381,327,352,323,344,332,340,344,314,340,312,336,312,327,301,337,295,336,281,314,282,303,284,288,280,283,288,262,295,256" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungnam.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="전북" title="" coords="231,231,255,237,259,234,268,244,279,248,282,242,298,243,303,248,298,255,289,256,280,279,279,286,285,297,281,303,271,302,266,304,250,303,244,307,240,295,239,290,236,292,232,297,226,288,219,291,218,300,205,304,197,295,198,289,198,278,209,246,219,246,229,238" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/junbuk.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="전남" title="" coords="197,298,205,306,211,303,216,299,220,292,227,290,233,297,237,293,240,303,267,305,268,301,280,306,279,317,287,323,292,333,283,341,283,351,291,345,290,359,279,366,263,382,244,375,229,384,215,381,204,394,175,390,169,384,197,368,191,350,193,323,187,310,190,301" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/junnam.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="제주" title="" coords="89,306,115,304,131,313,130,327,114,338,95,342,61,341,56,329,69,313,83,308" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/jeju.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
				</map> --%>
			</div>
		</div>
		<div class="section" data-anchor="hotel_list_anchor">
			<div class="sec_nav">
				<a href="<%=request.getContextPath() %>/index.jsp"><i class="fa fa-home" aria-hidden="true"></i></a>
			</div>
			<div id="mapping_hotel_list"></div>
		</div>
	</div>
<script type="text/javascript">fullpageUse();</script>
</body>
</html>