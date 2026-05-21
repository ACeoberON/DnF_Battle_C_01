<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.전투" %>
<%
    // HTTP 요청 파라미터 한글 깨짐 방지
    request.setCharacterEncoding("UTF-8");

    // 세션에서 전투(Control) 객체 가져오기 (없으면 새로 생성하여 세션에 저장)
    전투 control = (전투) session.getAttribute("전투컨트롤러");
    if (control == null) {
        control = new 전투();
        session.setAttribute("전투컨트롤러", control);
    }

    // 수행할 액션과 결과 메시지 변수
    String action = request.getParameter("action");
    String message = "대기 중...";

    if ("create".equals(action)) {
        // Create_Character_UI 역할
        String id = request.getParameter("playerId");
        String name = request.getParameter("charName");
        String job = request.getParameter("job");
        int level = Integer.parseInt(request.getParameter("level"));
        
        message = control.캐릭터생성(id, name, job, level);
        
    } else if ("attack".equals(action)) {
        // Attack_Monster_UI 역할
        String id = request.getParameter("playerId");
        
        message = control.몬스터공격(id);
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>RPG 텍스트 게임 테스트</title>
</head>
<body>
    <h1>RPG 게임 시스템</h1>
    
    <div style="border: 1px solid #ccc; padding: 15px; margin-bottom: 20px; background-color: #f9f9f9;">
        <h3>시스템 결과창</h3>
        <strong><%= message %></strong>
    </div>

    <!-- 캐릭터 생성 폼 (Create_Character_UI) -->
    <fieldset>
        <legend>캐릭터 생성</legend>
        <form method="post" action="index.jsp">
            <input type="hidden" name="action" value="create">
            플레이어 ID: <input type="text" name="playerId" value="hero"><br>
            캐릭터명: <input type="text" name="charName"><br>
            직업: 
            <select name="job">
                <option value="전사">전사</option>
                <option value="마법사">마법사</option>
            </select><br>
            레벨: <input type="number" name="level" value="10"><br><br>
            <input type="submit" value="캐릭터 생성하기">
        </form>
    </fieldset>

    <br>

    <!-- 몬스터 공격 폼 (Attack_Monster_UI) -->
    <fieldset>
        <legend>몬스터 공격</legend>
        <form method="post" action="index.jsp">
            <input type="hidden" name="action" value="attack">
            플레이어 ID: <input type="text" name="playerId" value="hero">
            <input type="submit" value="몬스터 공격하기">
        </form>
    </fieldset>
</body>
</html>