package com.jk.service;


import com.jk.model.User;

import java.util.List;


public interface TestService {

    public List<User> queryUser(User user);

    public void addDobbo(List userlist);


}
