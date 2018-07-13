package com.jk.dao;

import com.jk.model.User;
import org.apache.ibatis.annotations.*;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cache.annotation.EnableCaching;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.ImportResource;
import org.apache.ibatis.annotations.Mapper;



@Mapper
public interface TestMapper {

	@Delete("delete from t_user where id = #{id}")
	void deleteUser(@Param("id") Integer id);

	@ResultType(User.class)
	@Select(value="select  *   from  t_user where id = #{id}")
	User queryUserbyid(@Param("id") Integer id);

	@Update("update t_user set name=#{user.name},sex=#{user.sex},iname=#{user.iname} where id = #{user.id}")
	void updateDobbo(@Param("user") User user);
	
	
}
