package com.test;

import com.bean.User;
import com.service.UserService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 测试类, Mybatis与Spring的整合
 */
public class Test {

    public static void main(String[] args) {

        //获取Spring上下文对象
        ApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

        //获取userService
        UserService userService = (UserService) context.getBean("userService");

        Map<String, Object> map = new HashMap<>();
        List<User> userList = userService.query(map);
        for (User u : userList){
            System.out.println(u);
        }
    }
}
