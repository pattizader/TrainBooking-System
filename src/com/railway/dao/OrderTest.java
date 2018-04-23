package com.railway.dao;

import java.util.List;

import com.railway.model.Orderlist;


public class OrderTest {
	public static void main(String[] args)throws Exception {
		OrderDao o=new OrderDao();
		Orderlist order = new Orderlist();
		order.setTid("4412");
		order.setTicket_num("1");
		order.setTicket_price("423");
		order.setStartS("北京");
		order.setArriveS("秦皇岛");
		order.setDate("2017-12-04");
		order.setOrdername("李四");
		order.setTourname("张亿");
		order.setOrderPhone("12535788965");
		order.setArriveT("12:30");
		order.setStartT("11:43");
		boolean flat=o.addOrder(order);
		System.out.print(flat);
		List<Orderlist> orderlist=o.queryAllOrder(order);
		for(Orderlist tr:orderlist){
			//System.out.print("111");
			System.out.println(tr.getArriveS());
		}
		
	}
}
