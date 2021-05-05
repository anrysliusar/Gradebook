package com.company.gradebook.models;

import lombok.*;

import javax.persistence.*;
import java.util.Date;

@Entity
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@EqualsAndHashCode
@ToString
public class Grade {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Date getAt;
    private byte grade;
    private byte semesterNum;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Student student;

    @ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private TeacherSubject teacherSubject;

}
