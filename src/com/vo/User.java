package com.vo;

import com.util.DateUtil;

import java.io.Serializable;

/**
 * View Object实体: 用户
 */
public class User implements Serializable {
    /** 用户编号 */
    private String id;
    /** 用户账号 */
    private String userName;
    /** 用户密码 */
    private String password;
    /** 用户姓名 */
    private String realName;
    /** 用户性别 */
    private String gender;
    /** 用户生日 */
    private String birthday;
    /** 用户电话 */
    private String phone;
    /** 用户地址 */
    private String address;
    /** 用户角色 */
    private String roleId;

    public com.bean.User parse(){

        com.bean.User user = new com.bean.User();

        try {
            user.setId(Integer.valueOf(this.id));
            user.setGender(Integer.valueOf(this.gender));
            user.setBirthday(DateUtil.parse(this.birthday));
            user.setRoleId(Integer.valueOf(this.roleId));
        } catch (Exception e) {
            e.printStackTrace();
        }
        user.setUserName(this.userName);
        user.setPassword(this.password);
        user.setRealName(this.realName);
        user.setPhone(this.phone);
        user.setAddress(this.address);

        /*try {
            user = new com.bean.User(
                    Integer.valueOf(this.id),
                    this.userName,
                    this.password,
                    this.realName,
                    Integer.valueOf(this.gender),
                    DateUtil.parse(this.birthday),
                    this.phone,
                    this.address,
                    Integer.valueOf(this.roleId)
            );
        } catch (Exception e) {
            e.printStackTrace();
        }*/

        return user;
    }

    @Override
    public String toString() {
        return "User{" +
                "id='" + id + '\'' +
                ", userName='" + userName + '\'' +
                ", password='" + password + '\'' +
                ", realName='" + realName + '\'' +
                ", gender='" + gender + '\'' +
                ", birthday='" + birthday + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", roleId='" + roleId + '\'' +
                '}';
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }
}
