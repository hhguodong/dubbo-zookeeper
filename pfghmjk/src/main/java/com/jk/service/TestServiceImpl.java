package com.jk.service;

import com.jk.dao.TestDao;
import com.jk.model.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class TestServiceImpl implements TestService{

    @Resource
    private TestDao testdao;

    public List<User> queryUser(User user) {

        return testdao.queryUser(user);
    }


    public void addDobbo(List userlist) {

        testdao.addDobbo(userlist);
    }


}
