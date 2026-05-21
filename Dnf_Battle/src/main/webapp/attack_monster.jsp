<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 앞 페이지와 동일한 id와 scope를 사용하여 세션에 저장된 객체를 그대로 가져옵니다 --%>
<jsp:useBean id="control" class="game.전투" scope="session" />

<%
    String action = request.getParameter("action");
    String playerId = request.getParameter("playerId");
    if (playerId == null) playerId = "hero"; // 기본값
    
    String message = "전투 준비 완료. 공격 명령을 내려주세요.";

    // 공격 버튼을 눌렀을 때 처리
    if ("attack".equals(action)) {
        message = control.몬스터공격(playerId);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>몬스터 공격</title>
</head>
<body>
    <h2>2단계: 몬스터 공격</h2>
    
    <div style="border: 1px solid #ff9999; padding: 10px; margin-bottom: 15px; background-color: #fff0f0;">
        <strong>전투 결과:</strong> <%= message %>
    </div>

    <form method="post" action="attack_monster.jsp">
        <input type="hidden" name="action" value="attack">
        플레이어 ID (검증용): <input type="text" name="playerId" value="<%= playerId %>"><br><br>
        <input type="submit" value="⚔️ 공격하기!">
    </form>
    
    <br>
    <a href="create_character.jsp">새 캐릭터 만들기 (처음으로)</a>
</body>
</html>