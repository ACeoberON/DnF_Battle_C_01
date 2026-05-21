@startuml
left to right direction
actor "플레이어" as Player

usecase "캐릭터생성" as UC1
usecase "몬스터공격" as UC2
usecase "플레이어체크" as UC3

Player --> UC1
Player --> UC2

UC1 .> UC3 : <<include>>
UC2 .> UC3 : <<include>>
@enduml