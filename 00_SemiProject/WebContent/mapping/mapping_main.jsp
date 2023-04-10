<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<img alt="" src="<%=request.getContextPath() %>/image/map/koreaMap.jpg" usemap="#mapping_area" id="mapping_img" style="width: 500px;">
				<map name="mapping_area">
					<area shape="poly" alt="서울" title="" coords="105,133,114,118,122,116,131,82,148,76,157,93,162,91,166,76,177,58,191,50,198,60,214,56,223,63,224,92,231,107,223,142,225,154,242,139,257,132,260,162,237,179,250,189,202,232,190,234,183,220,181,206,168,215,139,226,130,226,118,229,106,189,94,204,90,214,81,198,86,155,74,163,61,146,64,138,78,113,100,132" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/seoul.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="경기" title="" coords="402,75,417,88,426,82,437,84,458,100,476,126,466,155,469,167,489,172,506,180,494,186,494,236,478,242,467,257,434,274,411,262,382,280,365,249,370,237,361,239,357,223,368,200,345,184,336,191,326,164,306,139,306,131,357,142,366,111" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungki.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="강원" title="" coords="562,16,646,160,683,223,676,239,669,256,652,243,641,250,624,251,617,238,612,256,596,252,570,246,565,235,550,242,556,226,540,222,521,238,520,221,511,226,509,241,486,237,485,226,492,217,492,201,496,179,504,179,467,163,459,149,462,134,476,122,468,114,450,112,447,95,436,98,430,90,434,84,419,84,415,95,399,74,428,60,456,62,466,64,479,59,496,60,500,65,512,60,524,65,543,53,556,37,555,21" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kangwon.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="충북" title="" coords="436,277,445,261,442,258,458,252,459,250,471,250,484,232,495,227,511,234,514,223,523,218,526,235,534,226,544,224,559,230,551,238,570,238,583,242,605,253,579,258,569,281,574,282,562,290,546,278,545,288,523,289,522,299,531,305,518,302,502,321,498,322,508,333,506,358,502,370,513,363,524,374,520,384,514,402,506,410,480,406,471,391,470,372,459,373,456,385,446,375,440,386,430,371,429,348,442,352,445,333,434,313,437,301,446,296,451,300,448,289,437,277" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/chungbuk.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="충남" title="" coords="383,277,420,258,450,296,438,308,446,333,443,351,435,355,434,370,434,382,439,386,438,395,420,400,410,394,410,391,386,390,381,402,366,410,354,415,342,389,336,388,342,382,339,361,338,342,334,317,330,303,319,322,330,350,315,345,314,320,311,309,292,306,291,290,303,269,314,277,313,258,324,282,318,257,337,253,348,246,378,266" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/chungnam.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="경북" title="" coords="572,279,587,250,596,248,614,258,614,238,630,248,656,245,669,255,680,235,690,254,692,278,698,300,692,311,692,330,696,342,690,377,693,401,690,408,694,414,709,398,714,407,701,465,677,456,671,460,668,451,651,454,647,462,639,468,629,462,613,476,591,470,582,457,580,464,562,470,555,460,536,461,543,454,531,436,513,434,506,425,504,407,516,400,517,375,524,378,524,369,503,367,504,354,505,334,496,322,514,308,520,304,525,306,526,293,547,285,552,279,561,291,574,287" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungbuk.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="경남" title="" coords="509,427,528,436,547,450,538,462,568,465,571,469,580,463,583,458,589,466,602,471,618,476,632,463,649,466,655,451,676,453,675,462,688,454,700,462,694,490,681,516,666,545,656,553,637,552,620,548,624,560,608,575,613,597,596,608,582,595,564,597,551,572,540,575,554,597,528,578,529,607,514,609,493,600,493,573,496,570,486,566,480,544,468,516,480,495,472,478,480,451,490,434" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/kyungnam.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="전북" title="" coords="359,412,380,398,382,385,407,385,413,396,430,397,438,390,452,409,467,415,485,402,494,408,503,405,510,413,506,423,498,435,479,443,471,476,480,495,473,514,456,503,443,511,410,513,402,504,404,492,392,499,382,483,366,490,366,504,343,512,334,501,323,501,335,481,332,465,349,449,350,414" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/junbuk.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="전남" title="" coords="323,504,335,498,343,510,354,510,366,502,370,490,379,486,390,498,402,490,410,514,429,512,443,514,454,506,470,516,471,536,490,554,494,567,472,577,494,583,496,632,494,643,462,615,462,654,430,646,400,670,386,690,331,695,270,667,261,590,282,545" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/junnam.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
					<area shape="poly" alt="제주" title="" coords="91,552,127,516,203,514,219,526,224,544,203,569,154,577,114,571,110,582,97,566" 
					onmouseover="changeimg('<%=request.getContextPath() %>/image/map/jeju.jpg')" onmouseout="changeimg('<%=request.getContextPath() %>/image/map/koreaMap.jpg')" onclick="mapping_searchHotel(this)" target="" />
				</map>
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