<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.캐릭터" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="control" class="game.전투" scope="page" />

<%
    String action = request.getParameter("action");
    String playerId = request.getParameter("playerId");
    if (playerId == null) playerId = "hero";
    
    String message = "전투 준비 완료. 공격 명령을 내려주세요.";

    if ("attack".equals(action)) {
        // 1. 세션에 저장해둔 캐릭터 객체를 꺼내옴
        캐릭터 myChar = (캐릭터) session.getAttribute("myCharacter");
        
        // 2. 다이어그램 명세대로 파라미터 2개(ID, 캐릭터객체)를 전달하여 호출
        message = control.몬스터공격(playerId, myChar);
    }
%>

<!DOCTYPE html>
<html>
<body>
    <h2>2단계: 몬스터 공격</h2>
    <div style="border: 1px solid #ff9999; padding: 10px; margin-bottom: 15px;">
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