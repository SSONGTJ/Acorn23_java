<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</head>
<body>
	<%-- /include/navbar.jsp 포함시키기 --%>
	<jsp:include page="/include/navbar.jsp">
		<jsp:param value="lunch" name="current"/>
	</jsp:include>
	
	<h1>Lunch Menu Selector</h1>
    
    <button onclick="getRandomMenu()">Get Lunch Menu</button>
    
    <p id="result">Click the button to see today's lunch menu!</p>
	
	<script>
        function getRandomMenu() {
            // 점심 메뉴 배열
            var lunchMenu = ["삼원명가", "청목", "우육면", "짜장면", "분식", "은희네해장국", "돈까쓰", "콩나물국밥", "피자", "커피", "뚜레쥬르"];

            // 배열에서 랜덤으로 하나의 요소 선택
            var randomIndex = Math.floor(Math.random() * lunchMenu.length);
            var selectedMenu = lunchMenu[randomIndex];

            // 선택된 메뉴를 화면에 표시
            document.getElementById("result").innerHTML = "Today's Lunch Menu: " + selectedMenu;
        }
    </script>

	<jsp:include page="/include/footer.jsp"></jsp:include>
</body>
</html>