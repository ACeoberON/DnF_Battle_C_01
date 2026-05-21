package game;

public class 전투 {
    
    // 다이어그램 명세: +캐릭터생성(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int) 캐릭터
	public String 몬스터공격(String 플레이어id, 캐릭터 캐릭터객체) {
        플레이어 p = new 플레이어();
        
        if (!p.플레이어체크(플레이어id)) {
            return "[인증 실패] 올바른 플레이어가 아닙니다.";
        }
        
        if (캐릭터객체 == null) {
            return "[오류] 생성된 캐릭터가 없습니다.";
        }

        double 데미지 = 캐릭터객체.스킬발동();
        // String 사용스킬 = 캐릭터객체.스킬명; <- 삭제

        // 순차도의 alt 프레임 완벽 반영 (스킬명 대신 순수 데미지와 등급만 반환)
        if (데미지 >= 200) {
            return "명중! 데미지: " + 데미지 + " ➔ [S급 전투 결과 반환]";
        } else if (데미지 >= 100) {
            return "명중! 데미지: " + 데미지 + " ➔ [A급 전투 결과 반환]";
        } else {
            return "명중! 데미지: " + 데미지 + " ➔ [B급 전투 결과 반환]";
        }
    }
}