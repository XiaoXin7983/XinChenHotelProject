package com.bean;

import java.io.Serializable;
import java.util.Date;

/**
 * 用户实体
 * @author DELL
 *
 */
public class User implements Serializable {

	/** 用户编号 */
	private Integer id;
	/** 用户账号 */
	private String userName;
	/** 用户密码 */
	private String password;
	/** 用户姓名 */
	private String realName;
	/** 用户性别 */
	private Integer gender;
	/** 用户生日 */
	private Date birthday;
	/** 用户电话 */
	private String phone;
	/** 用户地址 */
	private String address;
	/** 用户角色 */
	private Integer roleId;

	public User() {
	}

	public User(Integer id) {
		this.id = id;
	}

	public User(String userName, String password) {
		this.userName = userName;
		this.password = password;
	}

	public User(Integer id, String password, Integer gender) {
		this.id = id;
		this.password = password;
		this.gender = gender;
	}

	public User(String userName, String password, String realName, Integer gender, Date birthday, String phone,
				String address, Integer roleId) {
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.roleId = roleId;
	}

	public User(Integer id, String userName, String password, String realName, Integer gender, Date birthday,
				String phone, String address, Integer roleId) {
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.realName = realName;
		this.gender = gender;
		this.birthday = birthday;
		this.phone = phone;
		this.address = address;
		this.roleId = roleId;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", realName=" + realName
				+ ", gender=" + gender + ", birthday=" + birthday + ", phone=" + phone + ", address=" + address
				+ ", roleId=" + roleId + "]";
	}

	/**
	 * 获取年龄
	 * @return
	 */
	public int getAge() {
		//获取生日的总毫秒数
		long birth = this.birthday.getTime();
		//获取系统当前时间的总毫秒数
		long now = System.currentTimeMillis();
		//计算年龄
		int age = (int) ((now - birth) / 1000 / 60 / 60 / 24 / 365);

		return age;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
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

	public Integer getGender() {
		return gender;
	}

	public void setGender(Integer gender) {
		this.gender = gender;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
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

	public Integer getRoleId() {
		return roleId;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
}
