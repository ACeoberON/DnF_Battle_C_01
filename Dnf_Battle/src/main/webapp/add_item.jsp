<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="game.캐릭터" %>
<%@ page import="game.아이템" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="control" class="game.전투" scope="page" />

<%
    String action = request.getParameter("action");
    String playerId = request.getParameter("playerId");
    if (playerId == null) playerId = "hero";

    String message = "획득할 아이템 정보를 입력해주세요.";

    if ("getitem".equals(action)) {
        // 1. 세션에 저장된 캐릭터 객체를 꺼내옴 (기존 패턴 동일)
        캐릭터 myChar = (캐릭터) session.getAttribute("myCharacter");

        // 2. 순차도 명세대로 입력값을 전투에 전달 (등급 판정/아이템 생성은 전투 책임)
        String itemName = request.getParameter("itemName");
        String itemType = request.getParameter("itemType");
        int itemValue = Integer.parseInt(request.getParameter("itemValue"));

        message = control.아이템획득(playerId, myChar, itemName, itemType, itemValue);
    }

    // 화면 표시용: 현재 캐릭터의 인벤토리 조회
    캐릭터 viewChar = (캐릭터) session.getAttribute("myCharacter");
%>

<!DOCTYPE html>
<html>
<body>
    <h2>4단계: 아이템 획득</h2>
    <div style="border: 1px solid #99cc99; padding: 10px; margin-bottom: 15px;">
        <strong>아이템 시스템 메시지:</strong> <%= message %>
    </div>

    <% if (viewChar != null) { %>
        <h4><%= viewChar.캐릭터명 %>의 인벤토리
            (<%= viewChar.인벤토리객체.아이템리스트.size() %>/<%= viewChar.인벤토리객체.최대용량 %>)</h4>
        <ul>
        <% for (아이템 it : viewChar.인벤토리객체.아이템리스트) { %>
            <li>[<%= it.등급 %>] <%= it.아이템명 %> (<%= it.타입 %>, 가치 <%= it.가치 %>)</li>
        <% } %>
        </ul>
    <% } else { %>
        <p style="color:red;">먼저 캐릭터를 생성해주세요.</p>
    <% } %>

    <form method="post" action="add_item.jsp">
        <input type="hidden" name="action" value="getitem">
        플레이어 ID (검증용): <input type="text" name="playerId" value="<%= playerId %>"><br><br>
        아이템명: <input type="text" name="itemName"><br>
        아이템 타입:
        <select name="itemType">
            <option value="무기">무기</option>
            <option value="방어구">방어구</option>
            <option value="물약">물약</option>
        </select><br>
        아이템 가치: <input type="number" name="itemValue" value="500"><br><br>
        <input type="submit" value="🎁 아이템 획득!">
    </form>

    <br>
    <a href="attack_monster.jsp?playerId=<%= playerId %>">⬅ 몬스터 공격으로</a> |
    <a href="join_guild.jsp?playerId=<%= playerId %>">길드 가입으로 ➔</a> |
    <a href="create_character.jsp">새 캐릭터 만들기 (처음으로)</a>
</body>
</html>