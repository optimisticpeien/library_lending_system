package service.root;

import java.util.Map;

public interface RootService {
    Map<String, Object> jmpRoot();

    void changePassword(String ID, String password);
}
