package service;

import entity.Announcement;

public interface AnnouncementService {
    Announcement announcement(String identity, int offset);

    int numberOfAnnouncement(String identity);

    Announcement screen(String title);
}
