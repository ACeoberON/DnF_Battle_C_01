sequenceDiagram
    actor Player as 플레이어 
    participant System as 시스템 
    participant Auth as 인증 시스템 
    participant Char as 캐릭터 객체 

    Player->>+System: 캐릭터 생성 요청 (id, 이름, 직업, 레벨)
    
    System->>+Auth: 플레이어 ID 체크 ("hero" 여부)
    Auth-->>-System: 체크 결과 반환 (성공 또는 실패)
    
    alt ID가 "hero"가 아닌 경우
        System-->>Player: 오류 메시지 출력 ("올바른 플레이어가 아닙니다.")
    else ID가 "hero"인 경우
        
        alt 직업 == 전사
            System->>+Char: 캐릭터 생성 (HP=레벨*100, 공격력=레벨*15)
            Char-->>-System: 생성 완료
        else 직업 == 마법사
            System->>+Char: 캐릭터 생성 (HP=레벨*60, 공격력=레벨*25)
            Char-->>-System: 생성 완료
        end
        
        System-->>-Player: 캐릭터 생성 성공 메시지 반환
    end