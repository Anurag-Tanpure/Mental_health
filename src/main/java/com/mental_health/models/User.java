package com.mental_health.models;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "users")
public class User {
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(nullable = false)
    private String name;
    
    @Column(nullable = false)
    private int age;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    @Column(name = "working_style")
    private String workingStyle;

    @Column(name = "current_job")
    private String currentJob;

    @Column(name = "user_mood")
    private int userMood;  // 1 for Happy, 2 for Sad, etc.

    @ElementCollection
    @CollectionTable(name = "weekly_moods", joinColumns = @JoinColumn(name = "user_id"))
    @Column(name = "mood_value")
    private List<Integer> weeklyMood;  // Stores mood values for the week

    @Temporal(TemporalType.DATE)
    @Column(name = "join_date")
    private Date joinDate;

    public User() {}

    public User(String name, int age, String email, String password, String workingStyle, String currentJob, int userMood, List<Integer> weeklyMood, Date joinDate) {
        this.name = name;
        this.age = age;
        this.email = email;
        this.password = password;
        this.workingStyle = workingStyle;
        this.currentJob = currentJob;
        this.userMood = userMood;
        this.weeklyMood = weeklyMood;
        this.joinDate = joinDate;
    }

    // Getters and Setters

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public int getAge() { return age; }
    public void setAge(int age) { this.age = age; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public String getWorkingStyle() { return workingStyle; }
    public void setWorkingStyle(String workingStyle) { this.workingStyle = workingStyle; }

    public String getCurrentJob() { return currentJob; }
    public void setCurrentJob(String currentJob) { this.currentJob = currentJob; }

    public int getUserMood() { return userMood; }
    public void setUserMood(int userMood) { this.userMood = userMood; }

    public List<Integer> getWeeklyMood() { return weeklyMood; }
    public void setWeeklyMood(List<Integer> weeklyMood) { this.weeklyMood = weeklyMood; }

    public Date getJoinDate() { return joinDate; }
    public void setJoinDate(Date joinDate) { this.joinDate = joinDate; }
}
