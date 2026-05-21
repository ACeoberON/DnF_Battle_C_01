```mermaid
classDiagram
    class Create_Character_UI {
        <<boundary>>
    }
    class Attack_Monster_UI {
        <<boundary>>
    }

    class 플레이어 {
        +boolean 플레이어체크(String 플레이어id)
    }

    class 캐릭터 {
        <<abstract>>
        +String 캐릭터명
        +int 레벨
        +int HP
        +int 공격력
        +double 스킬발동()*
    }

    class 전사 {
        +double 스킬발동()
    }

    class 마법사 {
        +double 스킬발동()
    }

    class 전투 {
        +캐릭터 캐릭터생성(String 플레이어id, String 캐릭터명, String 직업, int 레벨)
        +String 몬스터공격(String 플레이어id, 캐릭터 캐릭터객체)
    }

    캐릭터 <|-- 전사 : 상속
    캐릭터 <|-- 마법사 : 상속
    전투 ..> 플레이어 : 의존 (생성/사용)
    전투 ..> 캐릭터 : 의존 (생성/사용)
    
    Create_Character_UI ..> 전투 : 호출
    Attack_Monster_UI ..> 전투 : 호출