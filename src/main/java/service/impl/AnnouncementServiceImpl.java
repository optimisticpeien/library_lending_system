package service.impl;

import bean.Announcement;
import mapper.AnnouncementMapper;
import service.AnnouncementService;

public class AnnouncementServiceImpl implements AnnouncementService {

    private AnnouncementMapper announcementMapper;

    public void setAnnouncementMapper(AnnouncementMapper announcementMapper) {
        this.announcementMapper = announcementMapper;
    }

    @Override
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
    public Announcement screen(String title) {
        return announcementMapper.selectAnnouncementByTitle(title);
    }
}
