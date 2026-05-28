<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.캐릭터" %>
<%@ page import="game.길드" %>
<%@ page import="game.전투" %>
<%@ page import="java.util.Map" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="control" class="game.전투" scope="page" />

<%
    String action = request.getParameter("action");
    String playerId = request.getParameter("playerId");
    if (playerId == null) playerId = "hero";

    String message = "가입할 길드를 선택해주세요.";

    if ("join".equals(action)) {
        // 1. 세션에 저장된 캐릭터 객체를 꺼내옴 (기존 패턴 동일)
        캐릭터 myChar = (캐릭터) session.getAttribute("myCharacter");

        // 2. 순차도 명세대로 '길드명'을 그대로 전투에 전달 (객체 조회는 전투의 책임)
        String guildName = request.getParameter("guildName");
        message = control.길드가입(playerId, myChar, guildName);
    }

    // 화면 표시용: 전투가 보유한 길드 저장소 조회
    Map<String, 길드> 길드목록 = 전투.길드목록조회();
%>

<!DOCTYPE html>
<html>
<body>
    <h2>3단계: 길드 가입</h2>
    <div style="border: 1px solid #9999ff; padding: 10px; margin-bottom: 15px;">
        <strong>길드 시스템 메시지:</strong> <%= message %>
    </div>

    <h4>현재 길드 현황 (정원 5명)</h4>
    <ul>
    <% for (길드 g : 길드목록.values()) { %>
        <li><%= g.길드명 %> : <%= g.캐릭터리스트.size() %> / <%= g.최대인원 %> 명</li>
    <% } %>
    </ul>

    <form method="post" action="join_guild.jsp">
        <input type="hidden" name="action" value="join">
        플레이어 ID (검증용): <input type="text" name="playerId" value="<%= playerId %>"><br><br>
        가입할 길드:
        <select name="guildName">
        <% for (길드 g : 길드목록.values()) { %>
            <option value="<%= g.길드명 %>"><%= g.길드명 %></option>
        <% } %>
        </select><br><br>
        <input type="submit" value="🛡️ 길드 가입하기!">
    </form>

    <br>
    <a href="attack_monster.jsp?playerId=<%= playerId %>">⬅ 몬스터 공격으로</a> |
    <a href="create_character.jsp">새 캐릭터 만들기 (처음으로)</a>
</body>
</html>