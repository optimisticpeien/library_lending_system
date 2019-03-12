package bean;

public class Student extends Teacher {
    private String grade;

    public Student() {
    }

    public Student(String ID, String name, String password, boolean sex, String department, int booknumber, String grade) {
        super(ID, name, password, sex, department, booknumber);
        this.grade = grade;
    }

    public String getGrade() {
        return grade;
    }

    public void setGrade(String grade) {
        this.grade = grade;
    }
}
