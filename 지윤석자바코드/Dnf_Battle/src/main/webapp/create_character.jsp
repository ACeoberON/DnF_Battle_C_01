<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.캐릭터" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 전투 객체는 로직 처리용이므로 page 스코프로 생성 (상태 유지 불필요) --%>
<jsp:useBean id="control" class="game.전투" scope="page" />

<%
    String action = request.getParameter("action");
    String message = "캐릭터 정보를 입력해주세요.";
    boolean isCreated = false;
    String playerId = "hero";

    if ("create".equals(action)) {
        String id = request.getParameter("playerId");
        String name = request.getParameter("charName");
        String job = request.getParameter("job");
        int level = Integer.parseInt(request.getParameter("level"));
        playerId = id;

        // 캐릭터 객체 반환받기
        캐릭터 newChar = control.캐릭터생성(id, name, job, level);

        if (newChar != null) {
            // 다이어그램 요구사항: 객체가 정상 반환되면 세션에 '캐릭터'를 저장
            session.setAttribute("myCharacter", newChar);
            message = newChar.캐릭터명 + " (" + job + ") 생성 완료! [HP: " + newChar.HP
                    + ", 공격력: " + newChar.공격력 + ", 인벤토리: "
                    + newChar.인벤토리객체.아이템리스트.size() + "/"
                    + newChar.인벤토리객체.최대용량 + "]";
            isCreated = true;
        } else {
            message = "[생성 실패] 올바른 플레이어가 아닙니다.";
        }
    }
%>

<!DOCTYPE html>
<html>
<body>
    <h2>1단계: 캐릭터 생성</h2>
    <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 15px;">
        <strong>시스템 메시지:</strong> <%= message %>
    </div>

    <% if (!isCreated) { %>
        <form method="post" action="create_character.jsp">
            <input type="hidden" name="action" value="create">
            플레이어 ID: <input type="text" name="playerId" value="hero"><br>
            캐릭터명: <input type="text" name="charName"><br>
            직업: 
            <select name="job">
                <option value="전사">전사</option>
                <option value="마법사">마법사</option>
            </select><br>
            레벨: <input type="number" name="level" value="10"><br><br>
            <input type="submit" value="캐릭터 생성">
        </form>
    <% } else { %>
        <p>다음 단계를 선택하세요:</p>
        <form method="get" action="attack_monster.jsp" style="display:inline;">
            <input type="hidden" name="playerId" value="<%= playerId %>">
            <input type="submit" value="⚔️ 몬스터 공격하러 가기 ➔">
        </form>
        <form method="get" action="add_item.jsp" style="display:inline;">
            <input type="hidden" name="playerId" value="<%= playerId %>">
            <input type="submit" value="🎁 아이템 획득하러 가기 ➔">
        </form>
        <form method="get" action="join_guild.jsp" style="display:inline;">
            <input type="hidden" name="playerId" value="<%= playerId %>">
            <input type="submit" value="🛡️ 길드 가입하러 가기 ➔">
        </form>
    <% } %>
</body>
</html>