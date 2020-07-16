package com.service;

import com.bean.User;

import java.util.List;
import java.util.Map;

/**
 * 用户业务逻辑接口
 */
public interface UserService {

    /** 添加 */
    int save(User user);
    /** 删除 */
    int remove(User user);
    /** 修改 */
    int modify(User user);
    /** 查询 */
    List<User> find(User user);

    /** 查询总记录数 */
    int count(Map<String, Object> map);
    /** 分页与条件查询 */
    List<User> query(Map<String, Object> map);
}
