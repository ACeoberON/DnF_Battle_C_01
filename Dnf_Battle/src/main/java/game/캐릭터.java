package game;

public abstract class 캐릭터 {
    protected String 캐릭터명;
    protected int 레벨;
    protected int HP;
    protected int 공격력;

    // 하위 클래스에서 강제 구현
    public abstract double 스킬발동();
    
    // JSP 출력을 위한 Getter 메서드
    public int getHP() { return HP; }
    public int get공격력() { return 공격력; }
}