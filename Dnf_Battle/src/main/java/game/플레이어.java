package game;

public class 플레이어 {
    private String 플레이어id = "hero";

    public boolean 플레이어체크(String 입력id) {
        // 입력된 아이디가 "hero"인지 검증
        return this.플레이어id.equals(입력id);
    }
}