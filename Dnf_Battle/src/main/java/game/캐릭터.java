package game;

public abstract class 캐릭터 {
    // 다이어그램에 명시된 4가지 속성만 유지 (스킬명 제거)
    public String 캐릭터명;
    public int 레벨;
    public int HP;
    public int 공격력;

    public abstract double 스킬발동();
}