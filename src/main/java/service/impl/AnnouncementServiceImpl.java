package service.impl;

import bean.Announcement;
import mapper.AnnouncementMapper;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import service.AnnouncementService;

public class AnnouncementServiceImpl implements AnnouncementService {

    private AnnouncementMapper announcementMapper;

    public void setAnnouncementMapper(AnnouncementMapper announcementMapper) {
        this.announcementMapper = announcementMapper;
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public int numberOfAnnouncement(String identity) {
        byte visibility;
        if ("student".equals(identity)) {
            visibility = (byte) 1;
        } else if ("teacher".equals(identity)) {
            visibility = (byte) 2;
        } else if ("admin".equals(identity)) {
            visibility = (byte) 4;
        } else {
            visibility = (byte) 8;
        }
        return announcementMapper.numberOfAnnouncementByVisibility(visibility);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Announcement announcement(String identity, int offset) {
        byte visibility;
        if ("student".equals(identity)) {
            visibility = (byte) 1;
        } else if ("teacher".equals(identity)) {
            visibility = (byte) 2;
        } else if ("admin".equals(identity)) {
            visibility = (byte) 4;
        } else {
            visibility = (byte) 8;
        }
        return announcementMapper.selectAnnouncementByDate(visibility, offset, 1).get(0);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED, isolation = Isolation.READ_COMMITTED)
    public Announcement screen(String title) {
        return announcementMapper.selectAnnouncementByTitle(title);
    }
}
