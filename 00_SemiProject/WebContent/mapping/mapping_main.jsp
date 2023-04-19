<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지역별 명소</title>
<link href="<%=request.getContextPath() %>/image/icon/title.png" rel="shortcut icon" type="image/x-icon">
<script type="text/javascript" src="<%=request.getContextPath() %>/js/mapping/mapping_landmark.js"></script>
<link rel="stylesheet" href="<%=request.getContextPath()%>/css/mapping/mapping_main.css">
</head>
<body>
	<div id="container">
		<jsp:include page="../include/header.jsp" />
		<div id="content">
			<h2>지도를 클릭해보세요!</h2>
			<div id="mapping" align="center">
				<img alt="" src="<%=request.getContextPath() %>/image/map/koreaMap.png" usemap="#mapping_area" id="mapping_img">
				<map name="mapping_area">
					<area shape="poly" alt="seoul" title="" coords="61,125,72,121,79,121,82,101,95,97,101,102,102,106,106,106,108,97,116,83,125,82,149,85,151,97,157,109,156,123,153,134,174,127,178,131,179,139,166,144,164,152,172,156,154,171,136,182,126,178,123,171,115,173,89,179,76,181,66,159,54,169,47,166,48,143,39,143,31,135,42,118" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/seoul.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="gyeonggi" title="" coords="230,102,246,103,253,109,253,93,260,90,264,69,280,61,288,74,293,72,295,78,301,78,305,85,313,92,315,97,308,102,309,118,316,119,318,123,328,129,324,133,326,138,320,161,314,163,308,170,299,170,288,181,277,176,260,181,252,169,250,168,253,159,247,160,239,152,242,145,250,147,247,134,242,126,239,115,230,117" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungi.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="gangwon" title="" coords="279,60,288,57,305,58,315,59,338,61,354,62,365,53,369,39,374,38,381,59,395,88,413,119,425,148,436,163,435,172,426,174,424,180,417,172,404,174,397,176,395,173,388,175,380,173,363,165,356,166,362,160,356,159,353,157,344,159,341,162,341,157,335,155,332,158,332,163,320,162,321,144,325,137,324,133,330,129,322,124,317,123,314,119,309,119,309,114,305,109,309,102,314,98,314,93,308,87,306,87,303,80,300,79,295,80,292,77,293,71,289,74,287,74" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kangwon.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="chungbuk" title="" coords="319,160,321,163,332,162,333,156,339,154,340,160,347,158,352,156,360,160,357,164,364,164,368,168,386,173,378,177,366,187,367,191,362,194,360,195,355,189,349,193,345,193,338,195,340,202,333,201,329,203,329,209,324,208,321,210,325,217,324,222,324,233,320,239,329,242,330,245,335,240,335,246,330,246,329,258,322,261,307,258,303,242,299,240,299,230,300,225,296,220,293,222,291,217,283,222,274,198,284,201,290,196,293,197,293,188,288,187,285,181,295,176,295,173,300,170,308,170,312,165,313,162" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/chungbuk.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="chungnam" title="" coords="216,174,217,183,225,177,219,173,221,169,228,170,231,173,232,166,248,174,251,178,255,184,260,181,272,179,274,176,279,178,286,182,288,188,293,191,292,199,290,195,285,200,275,199,276,205,278,215,281,223,288,222,288,218,293,223,296,222,297,225,301,227,298,233,297,242,303,245,303,254,308,258,305,259,305,262,299,260,297,265,293,264,292,262,287,261,284,251,272,253,267,253,263,251,263,249,252,247,248,253,243,259,240,259,236,258,231,249,225,246,229,238,227,227,230,226,226,221,225,204,225,199,223,205,219,200,212,206,213,195,205,197,208,192,201,189,210,178" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/chungnam.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="gyeongbuk" title="" coords="352,189,356,188,361,195,368,192,366,187,376,176,381,174,389,175,396,171,399,175,406,172,409,174,416,173,422,178,425,176,427,172,435,169,439,179,440,195,442,210,438,217,440,230,433,244,433,252,435,264,432,269,438,273,445,267,443,276,441,287,436,300,425,298,422,300,420,295,412,293,407,296,408,299,404,300,403,302,393,299,385,305,377,301,371,304,368,296,360,299,355,299,352,294,343,296,343,290,345,289,342,284,334,277,329,277,323,270,324,268,323,262,329,257,332,245,336,248,336,240,330,242,328,238,323,239,323,235,325,229,326,219,328,215,321,210,327,207,329,210,330,204,328,203,336,199,338,202,341,203,341,200,340,195,344,192,347,194,349,190,352,193" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungbuk.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="gyeongnam" title="" coords="322,271,331,278,335,279,345,290,341,295,343,297,352,296,359,300,369,297,371,303,379,302,387,306,397,301,404,301,411,296,420,294,423,301,426,298,435,300,435,308,433,316,431,314,428,322,426,328,421,332,420,338,415,344,411,345,408,351,404,349,404,352,397,353,396,348,386,350,376,347,371,340,372,352,362,346,361,356,358,358,356,365,346,364,350,361,343,360,338,363,330,361,329,349,326,354,320,353,315,358,312,358,309,362,304,355,308,352,311,349,303,337,303,333,298,333,297,322,301,317,304,316,303,300,298,299,307,283,312,278,320,276" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungnam.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="jeonbuk" title="" coords="241,258,250,253,252,247,265,247,268,254,280,252,283,250,287,261,291,261,295,263,298,259,304,260,304,255,311,259,321,261,325,268,322,272,320,276,310,276,307,285,300,301,304,304,304,309,306,312,300,316,298,325,290,318,284,322,276,320,267,318,261,322,258,314,256,304,251,314,245,308,243,303,235,307,234,314,223,317,218,311,216,307,228,297,233,295,220,294,220,289,236,276,242,278,239,271,246,267,233,268,228,261,226,259,240,260" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/junbuk.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="jeonnam" title="" coords="215,307,216,306,219,308,218,313,223,320,236,312,237,306,244,304,250,314,253,310,259,306,261,314,261,318,262,321,269,318,277,321,282,323,288,321,289,317,297,323,299,333,303,336,305,342,309,347,309,352,306,356,306,359,298,360,300,365,308,369,307,371,309,378,303,375,299,377,299,384,296,385,290,377,293,372,291,364,284,367,281,376,288,387,287,389,282,388,275,397,274,401,269,394,260,389,262,384,265,382,267,385,270,377,276,379,276,372,269,372,259,378,253,381,250,389,250,394,237,396,235,385,231,395,225,397,223,401,223,403,217,406,212,406,212,400,210,384,204,384,208,392,200,396,189,398,187,395,195,385,199,385,198,377,199,367,202,368,209,380,208,369,216,373,207,366,207,348,204,348,210,339,214,339,213,334,205,324,212,316" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/junnam.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
					<area shape="poly" alt="jeju" title="" coords="199,451,216,449,223,447,234,447,239,449,240,449,242,458,237,466,233,469,216,474,199,472,194,476,185,466,186,461,193,457" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/jeju.png')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.png')" onclick="mapping_searchLandmark(this)" target="" />
				</map>
				<button type="button" onclick="goTop()">맨 위로 ↑</button>
			</div>
		</div>
		<div id="mapping_landmark_list">1</div>
		<jsp:include page="../include/footer.jsp" />
	</div>
</body>
</html>