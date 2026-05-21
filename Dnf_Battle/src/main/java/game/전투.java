package game;

public class 전투 {
    private 플레이어 player = new 플레이어();
    private 캐릭터 activeCharacter;

    public String 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        if (!player.플레이어체크(플레이어id)) {
            return "[생성 실패] 권한이 없는 플레이어입니다.";
        }

        if (직업.equals("전사")) {
            activeCharacter = new 전사(캐릭터명, 레벨);
        } else if (직업.equals("마법사")) {
            activeCharacter = new 마법사(캐릭터명, 레벨);
        }

        return 캐릭터명 + " (" + 직업 + ") 생성 완료! [HP: " + activeCharacter.getHP() + " / 기본공격력: " + activeCharacter.get공격력() + "]";
    }

    public String 몬스터공격(String 플레이어id) {
        if (!player.플레이어체크(플레이어id)) {
            return "[접근 불가] 권한이 없는 플레이어입니다.";
        }
        
        if (activeCharacter == null) {
            return "[오류] 먼저 캐릭터를 생성해주세요.";
        }

        // 1. 데미지 계산 및 스킬명 가져오기
        double 데미지 = activeCharacter.스킬발동();
        String 사용스킬 = activeCharacter.get스킬명();
        
        // 2. 등급 판정
        String 등급 = 데미지등급부여(데미지);

        // 3. 💡 UI에 띄워줄 최종 메시지에 스킬명 포함
        return "🔥 [" + 사용스킬 + "] 명중! ➔ 데미지: " + 데미지 + " | 등급: " + 등급;
    }

    private String 데미지등급부여(double 데미지) {
        if (데미지 >= 200) {
            return "S급 공격";
        } else if (데미지 >= 100) {
            return "A급 공격";
        } else {
            return "B급 공격";
        }
    }
}