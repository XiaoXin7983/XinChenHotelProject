package com.dao;

import java.util.List;
import java.util.Map;

/**
 * 基础数据接口
 */
public interface BaseMapper<T> {

    /** 添加 */
    int insert(T t);
    /** 删除 */
    int delete(T t);
    /** 修改 */
    int update(T t);
    /** 查询 */
    List<T> select(T t);

    /** 查询总记录数 */
    int selectCount(Map<String, Object> map);
    /** 分页与条件查询 */
    List<T> selectByPage(Map<String, Object> map);
}
