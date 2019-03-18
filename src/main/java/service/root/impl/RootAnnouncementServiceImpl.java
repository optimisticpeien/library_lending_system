package service.root.impl;

import bean.Announcement;
import mapper.AnnouncementMapper;
import org.apache.ibatis.session.RowBounds;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.root.RootAnnouncementService;

import java.util.List;

public class RootAnnouncementServiceImpl implements RootAnnouncementService {

    private AnnouncementMapper announcementMapper;

    public void setAnnouncementMapper(AnnouncementMapper announcementMapper) {
        this.announcementMapper = announcementMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean addAnnouncement(Announcement announcement) {
        Announcement ann = announcementMapper.selectAnnouncementByTitle(announcement.getTitle());
        if (ann == null) {
            announcementMapper.addAnnouncement(announcement);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean deleteAnnouncement(String title) {
        Announcement ann = announcementMapper.selectAnnouncementByTitle(title);
        if (ann != null) {
            announcementMapper.deleteAnnouncement(title);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public boolean updateAnnouncement(Announcement announcement) {
        Announcement ann = announcementMapper.selectAnnouncementByTitle(announcement.getTitle());
        if (ann != null) {
            announcementMapper.updateAnnouncement(announcement);
            return true;
        } else {
            return false;
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Announcement selectAnnouncementByTitle(String title) {
        return announcementMapper.selectAnnouncementByTitle(title);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public List<Announcement> selectAnnouncement(Announcement announcement, boolean visibilityCheck, boolean relation, int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset, limit);
        return announcementMapper.selectAnnouncement(announcement, visibilityCheck, relation, rowBounds);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int NumberOfAnnouncement(Announcement announcement, boolean visibilityCheck, boolean relation) {
        return announcementMapper.numberOfAnnouncement(announcement, visibilityCheck, relation);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Announcement screen() {
        return announcementMapper.selectAnnouncementByDate((byte) 15, 0, 1).get(0);
    }
}
