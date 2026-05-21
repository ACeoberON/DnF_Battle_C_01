package game;

public class 마법사 extends 캐릭터 {
    public 마법사(String 캐릭터명, int 레벨) {
        this.캐릭터명 = 캐릭터명;
        this.레벨 = 레벨;
        this.HP = 레벨 * 60;
        this.공격력 = 레벨 * 25;
        this.스킬명 = "파이어볼!"; // 💡 생성 시 스킬명 세팅
    }

    @Override
    public double 스킬발동() {
        // System.out.println("파이어볼!"); <-- 💡 콘솔 출력 제거
        return this.공격력 * 2.0;
    }
}