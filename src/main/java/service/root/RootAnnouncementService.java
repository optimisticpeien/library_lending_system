package service.root;

import bean.Announcement;

import java.util.List;

public interface RootAnnouncementService {
    boolean addAnnouncement(Announcement announcement);

    boolean deleteAnnouncement(String ID);

    boolean updateAnnouncement(Announcement announcement);

    Announcement selectAnnouncementByTitle(String ID);

    List<Announcement> selectAnnouncement(Announcement announcement, boolean visibilityCheck, boolean relation, int offset, int limit);

    int NumberOfAnnouncement(Announcement announcement, boolean visibilityCheck, boolean relation);

    Announcement screen();
}
