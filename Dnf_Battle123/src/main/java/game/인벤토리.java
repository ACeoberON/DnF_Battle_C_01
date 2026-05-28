package game;

import java.util.ArrayList;
import java.util.List;

public class 인벤토리 {
    public List<아이템> 아이템리스트;
    public final int 최대용량 = 10;

    public 인벤토리() {
        // 캐릭터 생성 시 빈 인벤토리가 자동으로 함께 생성됨 (Composition)
        this.아이템리스트 = new ArrayList<>();
    }

    // 아이템 추가 행위
    public boolean 아이템추가(아이템 신규아이템) {
        if (아이템리스트.size() >= 최대용량) {
            return false; // 인벤토리가 가득 차면 추가 실패
        }
        아이템리스트.add(신규아이템);
        return true;
    }

    // 현재 저장된 아이템 개수 반환
    public int get현재용량() {
        return 아이템리스트.size();
    }
}