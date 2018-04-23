package com.user.dao;

import java.util.List;
import com.user.model.User;

public class Utest {
	public static void main(String[] args)throws Exception {
		UserDao u=new UserDao();
		User user=new User();
/*		boolean flat=false;
		user.setUserId("55555");
		user.setPassword("666666");
		user.setIdKind("777777");
		user.setIdCode("123456");
		user.setUserName("222222");
		user.setEmail("11111");
		user.setPhone("888888");
		user.setTourist("118811");
		flat=u.addUser(user);
		System.out.println(flat);*/
		user.setUserId("1153230");
		String result=u.queryName(user);
		System.out.println(result);
		//user.setPassword("123456");
		//List<User> userlist=u.queryLoginList(user);
		/*for(User tr:userlist){
			System.out.println(tr.getUserId()+" "+tr.getPassword());
		}*/
		
	}
}
