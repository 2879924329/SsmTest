package com.wch.bean;

/**
 * @author WCH
 */
public class Student {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column students.id
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column students.student_name
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    private String studentName;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column students.student_age
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    private Integer studentAge;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column students.student_sex
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    private String studentSex;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column students.student_address
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    private String studentAddress;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column students.id
     *
     * @return the value of students.id
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column students.id
     *
     * @param id the value for students.id
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column students.student_name
     *
     * @return the value of students.student_name
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public String getStudentName() {
        return studentName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column students.student_name
     *
     * @param studentName the value for students.student_name
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public void setStudentName(String studentName) {
        this.studentName = studentName == null ? null : studentName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column students.student_age
     *
     * @return the value of students.student_age
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public Integer getStudentAge() {
        return studentAge;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column students.student_age
     *
     * @param studentAge the value for students.student_age
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public void setStudentAge(Integer studentAge) {
        this.studentAge = studentAge;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column students.student_sex
     *
     * @return the value of students.student_sex
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public String getStudentSex() {
        return studentSex;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column students.student_sex
     *
     * @param studentSex the value for students.student_sex
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public void setStudentSex(String studentSex) {
        this.studentSex = studentSex == null ? null : studentSex.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column students.student_address
     *
     * @return the value of students.student_address
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public String getStudentAddress() {
        return studentAddress;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column students.student_address
     *
     * @param studentAddress the value for students.student_address
     *
     * @mbg.generated Tue Nov 16 15:04:13 CST 2021
     */
    public void setStudentAddress(String studentAddress) {
        this.studentAddress = studentAddress == null ? null : studentAddress.trim();
    }
}