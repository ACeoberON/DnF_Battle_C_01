package game;

public class 플레이어 {
    // 다이어그램 명세 반영: +플레이어체크(플레이어id: String) boolean
    public boolean 플레이어체크(String 플레이어id) {
        return "hero".equals(플레이어id);
    }
}