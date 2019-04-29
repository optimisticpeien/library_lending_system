package controller;

import entity.Announcement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.AnnouncementService;

import javax.servlet.http.HttpSession;

@Controller
public class AnnouncementController {

    private AnnouncementService announcementService;

    @Autowired
    public void setAnnouncementService(AnnouncementService announcementService) {
        this.announcementService = announcementService;
    }

    @RequestMapping("**/begin")
    public String begin(HttpSession session) {
        String identity = (String) session.getAttribute("identity");
        switch (identity) {
            case "student":
                return "user/user";
            case "teacher":
                return "user/user";
            case "admin":
                return "admin/admin";
            case "root":
                return "root/root";
            default:
                return "index";
        }
    }

    @RequestMapping("**/announcement")
    public String announcement(@RequestParam("title") String title, Model model, HttpSession session) {
        model.addAttribute("announcement", announcementService.screen(title));
        model.addAttribute("announcementNumber", announcementService.numberOfAnnouncement((String) session.getAttribute("identity")));
        return "announcement";
    }

    @ResponseBody
    @RequestMapping("announcementPage")
    public Announcement pageChange(@RequestParam("page") int page, HttpSession session) {
        String identity = (String) session.getAttribute("identity");
        return announcementService.announcement(identity, page);
    }
}
