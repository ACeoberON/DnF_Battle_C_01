package game;

import java.util.ArrayList;
import java.util.List;

public class 길드 {
    public String 길드명;
    public List<캐릭터> 캐릭터리스트;
    public int 최대인원;

    public 길드(String 길드명) {
        this.길드명 = 길드명;
        this.캐릭터리스트 = new ArrayList<>();
        this.최대인원 = 5;
    }

    public boolean 캐릭터가입(캐릭터 캐릭터객체) {
        if (this.캐릭터리스트.size() >= this.최대인원) {
            return false;
        }
        this.캐릭터리스트.add(캐릭터객체);
        return true;
    }
}