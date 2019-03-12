package service.admin.impl;

import mapper.AdminMapper;
import service.admin.AdminService;

public class AdminServiceImpl implements AdminService {
    private AdminMapper adminMapper;

    public void setAdminMapper(AdminMapper adminMapper) {
        this.adminMapper = adminMapper;
    }

    @Override
    public void changePassword(String ID, String password) {
        adminMapper.changePassword(ID, password);
    }
}
