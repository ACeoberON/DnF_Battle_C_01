package game;

public abstract class 캐릭터 {
    // 다이어그램에 명시된 속성
    public String 캐릭터명;
    public int 레벨;
    public int HP;
    public int 공격력;

    // [추가] CD 명세: +인벤토리객체: 인벤토리 (Composition, 강한 결합)
    public 인벤토리 인벤토리객체;

    // [추가] Composition 표현: 캐릭터 생성 시 빈 인벤토리가 자동으로 함께 생성됨
    // 자식(전사/마법사) 객체 생성 시 부모 생성자가 먼저 호출되므로 모든 캐릭터가 인벤토리를 가짐
    public 캐릭터() {
        this.인벤토리객체 = new 인벤토리();
    }

    public abstract double 스킬발동();
}