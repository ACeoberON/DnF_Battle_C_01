```mermaid
graph LR
    사용자((플레이어))
    
    %% 시스템 경계(System Boundary) 설정
    subgraph 전투 시스템
        direction TB
        U1([캐릭터생성])
        U2([몬스터공격])
        U3([플레이어체크])
    end
    
    %% 액터와 시스템 내부 유스케이스 간의 관계
    사용자 --- U1
    사용자 --- U2
    
    %% 유스케이스 간의 포함(include) 관계
    U1 -. "«include»" .-> U3
    U2 -. "«include»" .-> U3