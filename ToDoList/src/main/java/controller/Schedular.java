package controller;

import java.sql.SQLException;

import dao.Dao;

public class Schedular implements Runnable{

	@Override
	public void run() {
		
		while(!Thread.currentThread().isInterrupted()) {
			Dao dao = new Dao();
			
			try {
				dao.updatePriorityBasedOnDuration();
				Thread.sleep(1000*60);
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				Thread.currentThread().interrupt();
			}		  
		}		
	}

}
