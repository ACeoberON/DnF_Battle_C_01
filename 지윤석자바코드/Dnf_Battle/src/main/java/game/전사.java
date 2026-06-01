package game;

public class 전사 extends 캐릭터 {
    public 전사(String 캐릭터명, int 레벨) {
        this.캐릭터명 = 캐릭터명;
        this.레벨 = 레벨;
        능력치초기화(); // Self-Message
    }

    private void 능력치초기화() {
        this.HP = this.레벨 * 100;
        this.공격력 = this.레벨 * 15;
    }

    @Override
    public double 스킬발동() {
        return this.공격력 * 1.5;
    }

    @Override
    public String toString() {
        return "검휘두르기!";
    }
}