package game;

public class 아이템 {
    // CD 명세: 속성만 보유 (행위 없음)
    public String 아이템명;
    public String 타입;   // 무기, 방어구, 물약
    public int 가치;
    public String 등급;   // 전설, 희귀, 일반

    public 아이템(String 아이템명, String 타입, int 가치, String 등급) {
        this.아이템명 = 아이템명;
        this.타입 = 타입;
        this.가치 = 가치;
        this.등급 = 등급;
    }
}