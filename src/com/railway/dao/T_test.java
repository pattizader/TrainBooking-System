package com.railway.dao;

import java.util.List;

import com.railway.model.OrderViewer;
import com.railway.model.TSrelation;
import com.railway.model.Train;

public class T_test {

	public static void main(String[] args)throws Exception {
		// TODO Auto-generated method stub
		/*T_Dao t=new T_Dao();
		List<Train> trainList=t.queryAllTrain();
		
		for(Train tr:trainList){
			System.out.print(tr.getTid()+","+tr.getTname());
		}*/
		TDao t=new TDao();
		//Train train=new Train();
		OrderViewer o=new OrderViewer();
		o.setStartS("±±¾©");
		o.setArriveS("ÌÆÉ½");
		List<OrderViewer> order=t.queryAlltrainList(o);
		//train.setTname("T225");
		//List<TSrelation> tour=t.queryAlltour(train);
		//System.out.println(order);
		for(OrderViewer tr:order){
			System.out.println(tr.getTid());
		}
		
	}

}
