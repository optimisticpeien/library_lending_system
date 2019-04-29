package mapper;

import entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface AdminMapper {

    Admin selectAdminByID(String ID);

    List<Admin> selectAdmin(@Param("ID") String ID, @Param("name") String name, RowBounds rowBounds);

    void addAdmin(Admin admin);

    void deleteAdmin(String ID);

    void updateAdmin(Admin admin);

    int numberOfAdmin(@Param("ID") String ID, @Param("name") String name);

    void changePassword(@Param("ID") String ID, @Param("password") String password);
}
