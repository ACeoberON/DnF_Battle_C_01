@startuml
class 플레이어 {
  + 플레이어체크(플레이어id: String): boolean
}

abstract class 캐릭터 {
  # 캐릭터명: String
  # 레벨: int
  # HP: int
  # 공격력: int
  + {abstract} 스킬발동(): double
  + get캐릭터명(): String
}

class 전사 {
  + 전사(캐릭터명: String, 레벨: int)
  + 스킬발동(): double
}

class 마법사 {
  + 마법사(캐릭터명: String, 레벨: int)
  + 스킬발동(): double
}

class 전투 {
  + 캐릭터생성(플레이어id: String, 캐릭터명: String, 직업: String, 레벨: int): 캐릭터
  + 몬스터공격(플레이어id: String, 공격캐릭터: 캐릭터): String
}

class Create_Character_UI <<boundary>> {
}

class Attack_Monster_UI <<boundary>> {
}

캐릭터 <|-- 전사
캐릭터 <|-- 마법사
전투 --> 플레이어
전투 --> 캐릭터
Create_Character_UI --> 전투
Attack_Monster_UI --> 전투
@enduml