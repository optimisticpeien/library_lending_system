package entity;

public class Teacher extends Admin {
    private boolean sex;
    private String department;
    private int bookNumber;

    public Teacher() {
    }

    public Teacher(String ID, String name, String password, boolean sex, String department, int bookNumber) {
        super(ID, name, password);
        this.sex = sex;
        this.department = department;
        this.bookNumber = bookNumber;
    }

    public boolean isSex() {
        return sex;
    }

    public void setSex(boolean sex) {
        this.sex = sex;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getBookNumber() {
        return bookNumber;
    }

    public void setBookNumber(int bookNumber) {
        this.bookNumber = bookNumber;
    }
}
