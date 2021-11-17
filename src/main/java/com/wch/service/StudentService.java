package com.wch.service;

import com.github.pagehelper.PageInfo;
import com.wch.bean.Student;

import java.util.List;

/**
 * @author wch
 * @version 1.0
 * @date 2021/11/16 14:40
 */
public interface StudentService {



    /**
     *  获取指定页及指定数量的员工信息
     * @param  pageNumber pageNumber
     * @param pageSize pageSize
     *
     * @return
     */
    PageInfo<Student> getPageStudents(Integer pageNumber, Integer pageSize);


    /**
     * 保存学生的信息
     * @param student student
     * @return  student
     */
    public int saveStudent(Student student);

    /**
     *根据id删除学生信息
     * @param id id
     * @return 影响行
     */
    public int deleteStudent(Integer id);

    /**
     * 查询所有学生的信息
     * @return list
     */
    public List<Student> getAllStudent();

    /**
     * 根据学生id查询学生的信息
     * @param id id
     * @return student
     */
    public Student getStudent(Integer id);

    /**
     * 更新学生的信息
     * @param student student
     * @return 影响行
     */
    public int updateStudent(Student student);

    /**
     * 批量删除
     *
     * @param idList idList
     */
    void deleteBatchStudent(List<Integer> idList);
}
