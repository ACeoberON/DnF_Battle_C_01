package game;

public abstract class 캐릭터 {
    // 다이어그램 명세 반영: 모든 속성 '+' (public)
    public String 캐릭터명;
    public int 레벨;
    public int HP;
    public int 공격력;
    public String 스킬명; // 화면 출력을 위한 추가 속성

    // 다이어그램 명세 반영: +«abstract» 스킬발동() double
    public abstract double 스킬발동();
}