package com.wch.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wch.bean.Student;
import com.wch.bean.StudentExample;
import com.wch.dao.StudentMapper;
import com.wch.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author wch
 * @version 1.0
 * @date 2021/11/16 14:40
 */
@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
   private StudentMapper studentMapper;

    @Override
    public PageInfo<Student> getPageStudents (Integer pageNumber, Integer pageSize) {
         PageHelper.startPage(pageNumber, pageSize);
        List<Student> students = studentMapper.selectByExample(null);
        return new PageInfo<>(students, 5);

    }

    @Override
    public int saveStudent(Student student) {
        return studentMapper.insertSelective(student);
    }

    @Override
    public int deleteStudent(Integer id) {
        return studentMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Student> getAllStudent() {
        return studentMapper.selectByExample(null);
    }

    @Override
    public Student getStudent(Integer id) {
        return studentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int updateStudent(Student student) {
        return studentMapper.updateByPrimaryKeySelective(student);
    }

    @Override
    public void deleteBatchStudent(List<Integer> idList) {
        StudentExample studentExample = new StudentExample();
        StudentExample.Criteria criteria = studentExample.createCriteria();
        //sql语句in()
        criteria.andIdIn(idList);
        studentMapper.deleteByExample(studentExample);
    }
}
