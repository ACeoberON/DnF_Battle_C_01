package game;

public class 전투 {
    private 플레이어 player = new 플레이어();
    private 캐릭터 activeCharacter; // 생성된 캐릭터를 메모리에 유지

    public String 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨) {
        // 1. 플레이어 검증
        if (!player.플레이어체크(플레이어id)) {
            return "[생성 실패] 권한이 없는 플레이어입니다.";
        }

        // 2. 캐릭터 생성 및 초기화
        if (직업.equals("전사")) {
            activeCharacter = new 전사(캐릭터명, 레벨);
        } else if (직업.equals("마법사")) {
            activeCharacter = new 마법사(캐릭터명, 레벨);
        }

        return 캐릭터명 + " (" + 직업 + ") 생성 완료! [HP: " + activeCharacter.getHP() + " / 기본공격력: " + activeCharacter.get공격력() + "]";
    }

    public String 몬스터공격(String 플레이어id) {
        // 1. 플레이어 검증
        if (!player.플레이어체크(플레이어id)) {
            return "[접근 불가] 권한이 없는 플레이어입니다.";
        }
        
        // 캐릭터 생성 여부 확인
        if (activeCharacter == null) {
            return "[오류] 먼저 캐릭터를 생성해주세요.";
        }

        // 2. 다형성을 이용한 스킬 발동 (전사/마법사 알아서 계산됨)
        double 데미지 = activeCharacter.스킬발동();
        
        // 3. 데미지 등급 부여 (내부 private 메서드 호출)
        String 등급 = 데미지등급부여(데미지);

        return "몬스터 공격 결과 ➔ 데미지: " + 데미지 + " | 등급: " + 등급;
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