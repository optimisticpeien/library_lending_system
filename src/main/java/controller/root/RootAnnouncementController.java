package controller.root;

import bean.Announcement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.root.RootAnnouncementService;

import java.util.*;

@Controller
@RequestMapping("root/announcement")
public class RootAnnouncementController {

    private RootAnnouncementService rootAnnouncementService;

    @Autowired
    public void setRootAnnouncementService(RootAnnouncementService rootAnnouncementService) {
        this.rootAnnouncementService = rootAnnouncementService;
    }

    @RequestMapping("add")
    public String announcementAdd() {
        return "add";
    }

    @RequestMapping("change")
    public String announcementChange(@RequestParam(value = "title", required = false) String title, Model model) {
        if (title != null) {
            model.addAttribute("announcement", rootAnnouncementService.selectAnnouncementByTitle(title));
        }
        return "change";
    }

    @RequestMapping("select")
    public String announcementSelect() {
        return "select";
    }

    @ResponseBody
    @RequestMapping("addAnnouncement")
    public Map<String, String> addAnnouncement(Announcement announcement) {
        Map<String, String> map = new HashMap<>();
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        announcement.setDate(date);
        if (rootAnnouncementService.addAnnouncement(announcement)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "添加公告成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "已经存在此标题的公告！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "changeAnnouncement/select", method = RequestMethod.POST)
    public Map<String, Object> changeSelect(@RequestParam("title") String title) {
        Map<String, Object> map = new HashMap<>();
        Announcement announcement = rootAnnouncementService.selectAnnouncementByTitle(title);
        if (announcement == null) {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有找到相关公告信息！");
        } else {
            map.put("modalTitle", "成功");
            map.put("content", announcement.getContent());
            map.put("visibility", announcement.getVisibility());
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "changeAnnouncement", method = RequestMethod.POST)
    public Map<String, String> changeAnnouncement(Announcement announcement) {
        Map<String, String> map = new HashMap<>();
        Calendar calendar = Calendar.getInstance();
        Date date = calendar.getTime();
        announcement.setDate(date);
        if (rootAnnouncementService.updateAnnouncement(announcement)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "修改公告成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有找到相关公告信息！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "deleteAnnouncement", method = RequestMethod.POST)
    public Map<String, String> deleteAnnouncement(@RequestParam("title") String title) {
        Map<String, String> map = new HashMap<>();
        if (rootAnnouncementService.deleteAnnouncement(title)) {
            map.put("modalTitle", "成功");
            map.put("modalPoint", "删除公告成功！");
        } else {
            map.put("modalTitle", "错误");
            map.put("modalPoint", "没有找到此公告！");
        }
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "selectAnnouncement")
    public Map<String, Object> selectAnnouncement(Announcement announcement,
                                                  @RequestParam("visibilityCheck") boolean visibilityCheck,
                                                  @RequestParam("relation") boolean relation,
                                                  @RequestParam("page") int page,
                                                  @RequestParam("limit") int limit) {
        int offset = (page - 1) * limit;
        List<Announcement> announcements = rootAnnouncementService.selectAnnouncement(announcement, visibilityCheck, relation, offset, limit);
        int announcementNumber = rootAnnouncementService.NumberOfAnnouncement(announcement, visibilityCheck, relation);
        int pageNumber = announcementNumber % limit == 0 ? announcementNumber / limit : announcementNumber / limit + 1;
        Map<String, Object> map = new HashMap<>();
        map.put("announcements", announcements);
        map.put("announcementNumber", announcementNumber);
        map.put("pageNumber", pageNumber);
        return map;
    }

    @ResponseBody
    @RequestMapping(value = "screen")
    public Announcement screen() {
        return rootAnnouncementService.screen();
    }
}
