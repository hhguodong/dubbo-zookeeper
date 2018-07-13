package com.jk.service;


import java.util.List;
import com.jk.model.User;
public interface TestService {

    public List<User> queryUser(User user);

    public void addDobbo(List userlist);

}
