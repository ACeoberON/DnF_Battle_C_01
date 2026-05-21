```mermaid
classDiagram
    class Create_Character_UI {
        <<boundary>>
    }
    class Attack_Monster_UI {
        <<boundary>>
    }

    class 플레이어 {
        +플레이어체크(플레이어id: String): boolean
    }

    class 캐릭터 {
        <<abstract>>
        +캐릭터명: String
        +레벨: int
        +HP: int
        +공격력: int
        +스킬발동(): double*
    }

    class 전사 {
        +스킬발동(): double
    }
    note for 전사 "행위: 검 휘두르기!\n(데미지 = 공격력 * 1.5)"

    class 마법사 {
        +스킬발동(): double
    }
    note for 마법사 "행위: 파이어볼\n(데미지 = 공격력 * 2.0)"

    class 전투 {
        +캐릭터생성(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int): 캐릭터
        +몬스터공격(플레이어id: String, 캐릭터객체: 캐릭터): String
    }

    캐릭터 <|-- 전사 : 상속
    캐릭터 <|-- 마법사 : 상속
    전투 ..> 플레이어 : 의존 (생성/사용)
    전투 ..> 캐릭터 : 의존 (생성/사용)
    
    Create_Character_UI ..> 전투 : 호출
    Attack_Monster_UI ..> 전투 : 호출