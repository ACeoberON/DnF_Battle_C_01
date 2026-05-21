```mermaid
classDiagram
    class Create_Character_UI {
        <<boundary>>
        +정보입력(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int) void
    }
    
    class Attack_Monster_UI {
        <<boundary>>
        +공격명령입력(플레이어id: String) void
        +결과출력(데미지: double, 등급: String) void
    }

    class 전투 {
        +캐릭터생성(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int) void
        +몬스터공격(플레이어id: String) void
        -데미지등급부여(데미지: double) String
    }

    class 플레이어 {
        -플레이어id: String
        +플레이어체크(입력id: String) boolean
    }

    class 캐릭터 {
        <<abstract>>
        #캐릭터명: String
        #레벨: int
        #HP: int
        #공격력: int
        +스킬발동() double
    }

    class 전사 {
        +스킬발동() double
    }

    class 마법사 {
        +스킬발동() double
    }

    Create_Character_UI --> 전투
    Attack_Monster_UI --> 전투
    전투 --> 플레이어 : 검증 요청
    전투 --> 캐릭터 : 생성 및 조작
    캐릭터 <|-- 전사 : 상속
    캐릭터 <|-- 마법사 : 상속