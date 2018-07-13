package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.model.User;
import com.jk.service.TestService;
import com.jk.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;


@Controller
@RequestMapping("user")
public class userController {

    @Resource
    private TestService testService;

    @Resource
    private UserService userService;

    @RequestMapping("queryUser")
    @ResponseBody
    public String queryUser(User user) {

        List<User> list = testService.queryUser(user);

        String string = JSON.toJSONString(list);

        return string;
    }

    @RequestMapping("addDobbo")
    @ResponseBody
    public void addDobbo(User user){
        testService.addDobbo(user.getUserlist());
    }

    @RequestMapping("deleteUser")
    @ResponseBody
    public String deleteUser(Integer id){


        userService.deleteUser(id);

        return "aaa";

    }

    @RequestMapping("queryUserbyid")
    public String queryUserbyid(Integer id,Model model){


        User user = userService.queryUserbyid(id);

        model.addAttribute(user);

        return "aaaa";

    }


    @RequestMapping("updateDobbo")
    @ResponseBody
    public void updateDobbo(User user){


        userService.updateDobbo(user);

    }


}
