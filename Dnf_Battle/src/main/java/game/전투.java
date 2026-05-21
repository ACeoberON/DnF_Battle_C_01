package game;

public class 전투 {
    
    // 다이어그램 명세: +캐릭터생성(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int) 캐릭터
    public 캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        플레이어 p = new 플레이어();
        
        // 검증결과 == false
        if (!p.플레이어체크(플레이어id)) {
            return null; // 다이어그램 명세: null 반환
        }

        // 검증결과 == true, 직업에 따른 생성
        if ("전사".equals(직업)) {
            return new 전사(캐릭터명, 레벨);
        } else if ("마법사".equals(직업)) {
            return new 마법사(캐릭터명, 레벨);
        }
        
        return null;
    }

    // 다이어그램 명세: +몬스터공격(플레이어id: String, 캐릭터객체: 캐릭터) String
    public String 몬스터공격(String 플레이어id, 캐릭터 캐릭터객체) {
        플레이어 p = new 플레이어();
        
        // 검증결과 == false
        if (!p.플레이어체크(플레이어id)) {
            return "[인증 실패] 올바른 플레이어가 아닙니다."; // 에러 메시지 반환
        }
        
        if (캐릭터객체 == null) {
            return "[오류] 생성된 캐릭터가 없습니다.";
        }

        // 검증결과 == true
        double 데미지 = 캐릭터객체.스킬발동();
        String 사용스킬 = 캐릭터객체.스킬명;

        // 순차도의 alt 프레임(등급 판정) 완벽 반영
        if (데미지 >= 200) {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [S급 전투 결과]";
        } else if (데미지 >= 100) {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [A급 전투 결과]";
        } else {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [B급 전투 결과]";
        }
    }
}