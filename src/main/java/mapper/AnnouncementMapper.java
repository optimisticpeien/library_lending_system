package mapper;

import bean.Announcement;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.List;

public interface AnnouncementMapper {

    Announcement selectAnnouncementByTitle(String title);

    List<Announcement> selectAnnouncement(@Param("announcement") Announcement announcement,
                                          @Param("visibilityCheck") boolean visibilityCheck,
                                          @Param("relation") boolean relation,
                                          RowBounds rowBounds);

    List<Announcement> selectAnnouncementByDate(@Param("visibility") byte visibility,
                                                @Param("offset") int offset,
                                                @Param("limit") int limit);

    int numberOfAnnouncementByVisibility(@Param("visibility") byte visibility);

    void addAnnouncement(Announcement announcement);

    void deleteAnnouncement(String ID);

    void updateAnnouncement(Announcement announcement);

    int numberOfAnnouncement(@Param("announcement") Announcement announcement,
                             @Param("visibilityCheck") boolean visibilityCheck,
                             @Param("relation") boolean relation);
}
