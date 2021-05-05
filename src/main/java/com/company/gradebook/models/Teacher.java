package com.company.gradebook.models;

import com.company.gradebook.models.utils.Role;
import lombok.*;

import javax.persistence.*;
import java.util.List;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Teacher {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String degree;

    @Enumerated(EnumType.STRING)
    private final Role role = Role.ROLE_TEACHER;

    @OneToOne
    @JoinColumn(name = "user_id")
    private User user;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "teacher")
    private List<TeacherSubject> teacherSubjects;

    @ManyToOne(cascade = CascadeType.ALL)
    private Faculty faculty;
}
