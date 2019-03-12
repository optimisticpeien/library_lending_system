package bean;

import java.util.Date;

public class Announcement {
    private String title;
    private Date date;
    private byte visibility;
    private String content;

    public Announcement() {
    }

    public Announcement(String title, Date date, byte visibility, String content) {
        this.title = title;
        this.date = date;
        this.visibility = visibility;
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public byte getVisibility() {
        return visibility;
    }

    public void setVisibility(byte visibility) {
        this.visibility = visibility;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
