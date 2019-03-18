package service.root.impl;

import bean.Admin;
import mapper.AdminMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.root.RootAdminService;

import java.util.List;

public class RootAdminServiceImpl implements RootAdminService {

    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean addAdmin(Admin admin) {
        Admin adm = adminMapper.selectAdminByID(admin.getID());
        if (adm == null) {
            adminMapper.addAdmin(admin);
            return true;
        } else
            return false;

    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean deleteAdmin(String ID) {
        Admin adm = adminMapper.selectAdminByID(ID);
        if (adm != null) {
            adminMapper.deleteAdmin(ID);
            return true;
        } else
            return false;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean updateAdmin(Admin admin) {
        Admin adm = adminMapper.selectAdminByID(admin.getID());
        if (adm != null) {
            adminMapper.updateAdmin(admin);
            return true;
        } else
            return false;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Admin selectAdminByID(String ID) {
        return adminMapper.selectAdminByID(ID);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<Admin> selectAdmin(String ID, String name, int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset, limit);
        return adminMapper.selectAdmin(ID, name, rowBounds);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfAdmin(String ID, String name) {
        return adminMapper.numberOfAdmin(ID, name);
    }
}
