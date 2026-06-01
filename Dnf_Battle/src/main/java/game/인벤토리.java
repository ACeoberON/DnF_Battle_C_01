package game;

import java.util.ArrayList;
import java.util.List;

public class 인벤토리 {
    // CD 명세: 아이템리스트: List<아이템>, 최대용량: int
    public List<아이템> 아이템리스트;
    public int 최대용량;

    public 인벤토리() {
        this.아이템리스트 = new ArrayList<>();
        this.최대용량 = 10; // 인벤토리 최대 용량 10칸 (Composition "0..10")
    }

    // CD 명세: 아이템추가(아이템객체: 아이템) boolean
    // 캡슐화: 용량 초과 여부를 인벤토리 스스로 판단 (길드.캐릭터가입과 동일한 책임 패턴)
    public boolean 아이템추가(아이템 아이템객체) {
        if (this.아이템리스트.size() >= this.최대용량) {
            return false; // 인벤토리가 가득 차면 획득 불가
        }
        this.아이템리스트.add(아이템객체);
        return true;
    }
}