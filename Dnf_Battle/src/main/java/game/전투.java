package game;

public class 전투 {
    
    public 캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        플레이어 p = new 플레이어();
        
        if (!p.플레이어체크(플레이어id)) {
            return null; 
        }

        if ("전사".equals(직업)) {
            return new 전사(캐릭터명, 레벨);
        } else if ("마법사".equals(직업)) {
            return new 마법사(캐릭터명, 레벨);
        }
        
        return null;
    }

    public String 몬스터공격(String 플레이어id, 캐릭터 캐릭터객체) {
        플레이어 p = new 플레이어();
        
        if (!p.플레이어체크(플레이어id)) {
            return "[인증 실패] 올바른 플레이어가 아닙니다."; 
        }
        
        if (캐릭터객체 == null) {
            return "[오류] 생성된 캐릭터가 없습니다.";
        }

        // 1. 순차도 명세대로 스킬발동()을 호출하여 데미지만 반환받음
        double 데미지 = 캐릭터객체.스킬발동();
        
        // 2. [추가] 화면 출력을 위해 객체 타입을 검사하여 스킬명을 맵핑
        String 사용스킬 = "";
        if (캐릭터객체 instanceof 전사) {
            사용스킬 = "검휘두르기!";
        } else if (캐릭터객체 instanceof 마법사) {
            사용스킬 = "파이어볼!";
        }

        // 3. 순차도의 등급 판정(alt) 및 최종 메시지 반환
        if (데미지 >= 200) {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [S급 전투 결과]";
        } else if (데미지 >= 100) {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [A급 전투 결과]";
        } else {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [B급 전투 결과]";
        }
    }
}