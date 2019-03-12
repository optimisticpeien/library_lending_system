package service;

import java.util.Map;

public interface LoginService {
    Map<String, Object> login(String ID, String identity, String password);
}
