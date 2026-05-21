package game;

public abstract class 캐릭터 {
    protected String 캐릭터명;
    protected int 레벨;
    protected int HP;
    protected int 공격력;
    protected String 스킬명; // 💡 웹 출력을 위해 스킬명 속성 추가

    public abstract double 스킬발동();
    
    public int getHP() { return HP; }
    public int get공격력() { return 공격력; }
    public String get스킬명() { return 스킬명; } // 💡 스킬명 Getter
}