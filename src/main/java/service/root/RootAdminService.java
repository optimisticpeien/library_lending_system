package service.root;

import bean.Admin;

import java.util.List;

public interface RootAdminService {
    boolean addAdmin(Admin admin);

    boolean deleteAdmin(String ID);

    boolean updateAdmin(Admin admin);

    Admin selectAdminByID(String ID);

    List<Admin> selectAdmin(String ID, String name, int offset, int limit);

    int NumberOfAdmin(String ID, String name);
}
