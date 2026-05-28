<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.캐릭터" %>
<%@ page import="game.아이템" %>
<% request.setCharacterEncoding("UTF-8"); %>

<%-- 로직 처리용 비즈니스 객체 page 스코프로 생성 --%>
<jsp:useBean id="control" class="game.전투" scope="page" />

<%
    String action = request.getParameter("action");
    String playerId = request.getParameter("playerId");
    if (playerId == null) playerId = "hero"; // 기본값 세팅
    
    String message = "획득할 아이템 정보를 입력하고 버튼을 눌러주세요.";
    
    // 세션에서 기존에 생성된 캐릭터 객체를 꺼내옴
    캐릭터 myChar = (캐릭터) session.getAttribute("myCharacter");

    if ("add".equals(action)) {
        String itemName = request.getParameter("itemName");
        String itemType = request.getParameter("itemType");
        int itemValue = 0;
        
        try {
            itemValue = Integer.parseInt(request.getParameter("itemValue"));
            // 한글화된 컨트롤러 메서드 호출
            message = control.아이템획득(playerId, myChar, itemName, itemType, itemValue);
        } catch (NumberFormatException e) {
            message = "[입력 오류] 가치는 숫자로만 입력해야 합니다.";
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>3단계: 아이템 획득</title>
</head>
<body>
    <h2>3단계: 아이템 획득 (인벤토리 추가)</h2>
    
    <div style="border: 1px solid #99ccff; padding: 10px; margin-bottom: 15px;">
        <strong>시스템 메시지:</strong> <%= message %>
    </div>

    <% if (myChar == null) { %>
        <div style="color: red; font-weight: bold;">
            세션에 생성된 캐릭터가 없습니다! 캐릭터를 먼저 생성하고 오세요.
        </div>
        <br>
        <a href="create_character.jsp">➔ 캐릭터 생성하러 가기</a>
    <% } else { %>
        <form method="post" action="add_item.jsp">
            <input type="hidden" name="action" value="add">
            
            플레이어 ID (검증용): <input type="text" name="playerId" value="<%= playerId %>"><br><br>
            아이템명: <input type="text" name="itemName" required><br><br>
            
            아이템 타입: 
            <select name="itemType">
                <option value="무기">무기</option>
                <option value="방어구">방어구</option>
                <option value="물약">물약</option>
            </select><br><br>
            
            아이템 가치: <input type="number" name="itemValue" value="100" required> (전설: 1000 이상 / 희귀: 500 이상)<br><br>
            
            <input type="submit" value="🎁 아이템 획득하기">
        </form>
        
        <hr>
        <h3>현재 <%= myChar.캐릭터명 %>의 인벤토리 현황 (<%= myChar.인벤토리.get현재용량() %> / <%= myChar.인벤토리.최대용량 %>)</h3>
        <ul>
            <% if (myChar.인벤토리.아이템리스트.isEmpty()) { %>
                <li>인벤토리가 텅 비어 있습니다.</li>
            <% } else { 
                for (아이템 보유아이템 : myChar.인벤토리.아이템리스트) { %>
                    <li>[<%= 보유아이템.등급 %>] <%= 보유아이템.아이템명 %> - <%= 보유아이템.타입 %> (가치: <%= 보유아이템.가치 %>)</li>
            <%   } 
               } %>
        </ul>
        
        <br>
        <a href="attack_monster.jsp">⚔️ 몬스터 공격하러 가기</a> | 
        <a href="create_character.jsp">새 캐릭터 만들기 (처음으로)</a>
    <% } %>
</body>
</html>