package com.jk.service;

import com.jk.model.User;

public interface UserService {

    public void deleteUser(Integer id);

    public User queryUserbyid(Integer id);

    public void updateDobbo(User user);
}
