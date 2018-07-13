package com.jk.dao;

import com.jk.model.User;

import java.util.List;

public interface TestDao {

    List<User> queryUser(User user);

    void addDobbo(List userlist);

}
