package game;

import java.util.LinkedHashMap;
import java.util.Map;

public class 전투 {

    private static final Map<String, 길드> 길드목록 = new LinkedHashMap<>();
    static {
        길드목록.put("불멸길드", new 길드("불멸길드"));
        길드목록.put("어둠길드", new 길드("어둠길드"));
    }

    public static Map<String, 길드> 길드목록조회() {
        return 길드목록;
    }

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

        double 데미지 = 캐릭터객체.스킬발동();

        String 사용스킬 = "";
        if (캐릭터객체 instanceof 전사) {
            사용스킬 = "검휘두르기!";
        } else if (캐릭터객체 instanceof 마법사) {
            사용스킬 = "파이어볼!";
        }

        if (데미지 >= 200) {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [S급 전투 결과]";
        } else if (데미지 >= 100) {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [A급 전투 결과]";
        } else {
            return "🔥 [" + 사용스킬 + "] 명중! 데미지: " + 데미지 + " ➔ [B급 전투 결과]";
        }
    }

    // [신규] 아이템획득 - 순차도 명세 반영
    public String 아이템획득(String 플레이어id, 캐릭터 캐릭터객체,
                          String 아이템명, String 아이템타입, int 아이템가치) {
        플레이어 p = new 플레이어();

        if (!p.플레이어체크(플레이어id)) {
            return "[인증 실패] 올바른 플레이어가 아닙니다.";
        }

        if (캐릭터객체 == null) {
            return "[오류] 아이템을 획득할 캐릭터가 없습니다.";
        }

        // 1. 전투가 등급 판정 (순차도 alt 프레임)
        String 등급;
        if (아이템가치 >= 1000) {
            등급 = "전설";
        } else if (아이템가치 >= 500) {
            등급 = "희귀";
        } else {
            등급 = "일반";
        }

        // 2. 전투가 아이템 객체 동적 생성 (전투 ..> 아이템 : 의존(생성))
        아이템 아이템객체 = new 아이템(아이템명, 아이템타입, 아이템가치, 등급);

        // 3. 캡슐화: 용량 검사는 인벤토리 내부 책임. 전투는 추가만 지시
        boolean 추가결과 = 캐릭터객체.인벤토리객체.아이템추가(아이템객체);

        if (추가결과) {
            return "🎁 [" + 아이템명 + "] (" + 등급 + ") 획득 완료! (인벤토리: "
                    + 캐릭터객체.인벤토리객체.아이템리스트.size() + "/"
                    + 캐릭터객체.인벤토리객체.최대용량 + ")";
        } else {
            return "[획득 실패] 인벤토리가 가득 찼습니다. (" 
                    + 캐릭터객체.인벤토리객체.최대용량 + "칸)";
        }
    }

    public String 길드가입(String 플레이어id, 캐릭터 캐릭터객체, String 길드명) {
        플레이어 p = new 플레이어();

        if (!p.플레이어체크(플레이어id)) {
            return "[인증 실패] 올바른 플레이어가 아닙니다.";
        }

        if (캐릭터객체 == null) {
            return "[오류] 가입할 캐릭터가 없습니다.";
        }

        길드 길드객체 = 길드목록.get(길드명);
        if (길드객체 == null) {
            return "[오류] 존재하지 않는 길드입니다.";
        }

        boolean 가입결과 = 길드객체.캐릭터가입(캐릭터객체);

        if (가입결과) {
            return "🛡️ [" + 길드객체.길드명 + "] 가입 완료! (현재 인원: "
                    + 길드객체.캐릭터리스트.size() + "/" + 길드객체.최대인원 + ")";
        } else {
            return "[가입 실패] 길드 정원이 가득 찼습니다. (" + 길드객체.최대인원 + "명)";
        }
    }
}