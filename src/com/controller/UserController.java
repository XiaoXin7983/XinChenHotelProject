package com.controller;

import com.bean.User;
import com.service.UserService;
import com.util.PageAssistant;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("user")
public class UserController {

    @Autowired
    private UserService userService;

    @RequestMapping("login")
    public String login(HttpSession session, User user){
        System.out.println(">>> user login");
        System.out.println(user);
        System.out.println("------------------------------------------------");

        //查询
        List<User> userList = userService.find(user);

        //判断, 是否登录成功
        if (userList.size() == 1){
            session.setAttribute("loginInfo", userList.get(0));
            return "redirect:/page/main.jsp";
        }

        session.setAttribute("msg", "用户名或密码错误!");
        return "redirect:/login.jsp";
    }

    @RequestMapping("logoff")
    public String logoff(HttpSession session){
        System.out.println(">>> user logoff");
        System.out.println("------------------------------------------------");

        //销毁会话
        session.invalidate();

        return "redirect:/login.jsp";
    }

    @RequestMapping("query")
    public String query(HttpSession session, com.vo.User userQueryInfo,
                    PageAssistant<User> paUser){
        System.out.println(">>> user query");
        System.out.println(userQueryInfo);
        System.out.println("------------------------------------------------");

        //创建参数集合
        Map<String, Object> map = new HashMap<>();
        //添加查询参数
        map.put("roleId", userQueryInfo.getRoleId());
        map.put("key", userQueryInfo.getRealName());

        //查询总记录数
        paUser.setCount(userService.count(map));

        //设置分页参数
        map.put("start", paUser.getStart());
        map.put("size", paUser.getSize());

        //查询当前页内容
        paUser.setItems(userService.query(map));

        //保存
        session.setAttribute("paUser", paUser);
        session.setAttribute("userQueryInfo", userQueryInfo);

        return "/page/user/list.jsp";
    }
}
