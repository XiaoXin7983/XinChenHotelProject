package com.service.impl;

import com.bean.User;
import com.dao.UserMapper;
import com.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * 用户业务逻辑实现
 */
@Service("userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public int save(User user) {
        return userMapper.insert(user);
    }

    @Override
    public int remove(User user) {
        return userMapper.delete(user);
    }

    @Override
    public int modify(User user) {
        return userMapper.update(user);
    }

    @Override
    public List<User> find(User user) {
        return userMapper.select(user);
    }

    @Override
    public int count(Map<String, Object> map) {
        return userMapper.selectCount(map);
    }

    @Override
    public List<User> query(Map<String, Object> map) {
        return userMapper.selectByPage(map);
    }
}
