package game;

public class 아이템 {
    public String 아이템명;
    public String 타입; // 무기, 방어구, 물약
    public int 가치;
    public String 등급; // 전설, 희귀, 일반

    // 전투(컨트롤러) 클래스에서 등급 판정 후 객체를 생성할 때 사용 (Composition)
    public 아이템(String 아이템명, String 타입, int 가치, String 등급) {
        this.아이템명 = 아이템명;
        this.타입 = 타입;
        this.가치 = 가치;
        this.등급 = 등급;
    }
}