<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- useBean을 사용하여 세션에 '전투' 객체를 생성 및 유지합니다 --%>
<jsp:useBean id="control" class="game.전투" scope="session" />

<%
    String action = request.getParameter("action");
    String message = "캐릭터 정보를 입력해주세요.";
    boolean isCreated = false;

    // 폼이 제출되었을 때 처리
    if ("create".equals(action)) {
        String id = request.getParameter("playerId");
        String name = request.getParameter("charName");
        String job = request.getParameter("job");
        int level = Integer.parseInt(request.getParameter("level"));
        
        // 전투 컨트롤러를 통해 캐릭터 생성
        message = control.캐릭터생성(id, name, job, level);
        
        // 생성 성공 여부 확인 (간단히 메시지로 판별)
        if (message.contains("완료")) {
            isCreated = true;
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>캐릭터 생성</title>
</head>
<body>
    <h2>1단계: 캐릭터 생성</h2>
    
    <div style="border: 1px solid #ccc; padding: 10px; margin-bottom: 15px;">
        <strong>시스템 메시지:</strong> <%= message %>
    </div>

    <%-- 캐릭터 생성이 안 된 경우에만 입력 폼을 보여줌 --%>
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
        <%-- 생성 완료 시 몬스터 공격 페이지로 이동하는 폼 제공 --%>
        <form method="get" action="attack_monster.jsp">
            <input type="hidden" name="playerId" value="<%= request.getParameter("playerId") %>">
            <input type="submit" value="몬스터 공격하러 가기 ➔">
        </form>
    <% } %>
</body>
</html>