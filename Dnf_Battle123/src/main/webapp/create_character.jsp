<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.캐릭터" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 전투 객체는 로직 처리용이므로 page 스코프로 생성 --%>
<jsp:useBean id="control" class="game.전투" scope="page" />

<%
    String action = request.getParameter("action");
    String message = "캐릭터 정보를 입력해주세요.";
    boolean isCreated = false;
    
    if ("create".equals(action)) {
        String id = request.getParameter("playerId");
        String name = request.getParameter("charName");
        String job = request.getParameter("job");
        int level = Integer.parseInt(request.getParameter("level"));
        
        // 캐릭터 객체 반환받기 (내부에 빈 인벤토리가 포함되어 생성됨)
        캐릭터 newChar = control.캐릭터생성(id, name, job, level);
        if (newChar != null) {
            // 세션에 인벤토리가 포함된 캐릭터 객체 저장
            session.setAttribute("myCharacter", newChar);
            message = newChar.캐릭터명 + " (" + job + ") 생성 완료! [HP: " + newChar.HP + ", 공격력: " + newChar.공격력 + "] (빈 인벤토리 10칸 생성됨)";
            isCreated = true;
        } else {
            message = "[생성 실패] 올바른 플레이어가 아닙니다.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>1단계: 캐릭터 생성</title>
</head>
<body>
    <h2>1단계: 캐릭터 생성</h2>
    <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 15px;">
        <strong>시스템 메시지:</strong> <%= message %>
    </div>

    <% if (!isCreated) { %>
        <form method="post" action="create_character.jsp">
            <input type="hidden" name="action" value="create">
            플레이어 ID: <input type="text" name="playerId" value="hero"><br><br>
            캐릭터명: <input type="text" name="charName" required><br><br>
            직업: 
            <select name="job">
                <option value="전사">전사</option>
                <option value="마법사">마법사</option>
            </select><br><br>
            레벨: <input type="number" name="level" value="10"><br><br>
        
            <input type="submit" value="캐릭터 생성">
        </form>
    <% } else { %>
        <div style="display: flex; gap: 10px;">
            <form method="get" action="add_item.jsp">
                <input type="hidden" name="playerId" value="<%= request.getParameter("playerId") %>">
                <input type="submit" value="🎁 아이템 획득하러 가기 ➔" style="background-color: #e1f5fe; padding: 10px;">
            </form>
            
            <form method="get" action="attack_monster.jsp">
                <input type="hidden" name="playerId" value="<%= request.getParameter("playerId") %>">
                <input type="submit" value="⚔️ 몬스터 공격하러 가기 ➔" style="padding: 10px;">
            </form>
        </div>
    <% } %>
</body>
</html>