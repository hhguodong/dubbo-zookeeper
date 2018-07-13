package com.jk.service;


import com.jk.dao.TestMapper;
import com.jk.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private TestMapper testMapper;

	@Override
	public void deleteUser(Integer id) {

		testMapper.deleteUser(id);
	}

	@Override
	public User queryUserbyid(Integer id) {
		
		return testMapper.queryUserbyid(id);
	}

	@Override
	public void updateDobbo(User user) {
		
		testMapper.updateDobbo(user);
		
	}
	
	
}
