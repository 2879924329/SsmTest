package com.wch.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.wch.bean.Message;
import com.wch.bean.Student;
import com.wch.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

/**
 * @author wch
 * @version 1.0
 * @date 2021/11/16 11:46
 */
@Controller
public class StudentController {

    @Autowired
    private StudentService studentService;

    /**
     * 获取一页数据，保存在model，返回到jsp页面
     * @param pageNumber 1
     * @return Message
     */
    @RequestMapping("/getStudent")
    @ResponseBody
    public Message getStudentPageJson(@RequestParam(value = "pageNumber",defaultValue = "1")
                                               Integer pageNumber){
        PageHelper.startPage(pageNumber,5);
        List<Student> list= studentService.getAllStudent();
        //PageInfo封装结果集
        PageInfo<Student> pageInfo=new PageInfo(list,5);
        return Message.successMessage().add("pageInfo",pageInfo);

    }

    @RequestMapping(value = "/saveStudent",method = RequestMethod.POST)
    @ResponseBody
    public Message saveStudent(Student student){
        studentService.saveStudent(student);
        return Message.successMessage();
    }

    @ResponseBody
    @RequestMapping(value = "/getStudent/{id}", method = RequestMethod.GET)
    public Message getStudent(@PathVariable Integer id){
        Student student = studentService.getStudent(id);
        return Message.successMessage().add("student", student);
    }

    @ResponseBody
    @RequestMapping(value = "/updateStudent/{id}", method = RequestMethod.PUT)
    public Message updateStudent(Student student){
     studentService.updateStudent(student);
     return Message.successMessage();
    }


    private static final String S = "-";

    /**
     * 单个删除与多个删除方法
     * 多个删除的id传递格式：1-2-3-4
     * 单个：1
     * @param ids
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/deleteStudent/{ids}", method = RequestMethod.DELETE)
    public Message deleteStudent(@PathVariable("ids") String ids){
        List<Integer> idList = new ArrayList<>();
        if (ids.contains(S)){
            String[] str_ids = ids.split("-");
            //组装id
            for (String str : str_ids){
                idList.add(Integer.parseInt(str));
            }
            studentService.deleteBatchStudent(idList);
        }else {
            int id = Integer.parseInt(ids);
            studentService.deleteStudent(id);
        }
      return Message.successMessage();
    }
}
