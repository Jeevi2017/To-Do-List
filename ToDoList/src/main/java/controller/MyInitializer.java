package controller;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyInitializer implements ServletContextListener{

	private Thread backgroundThread;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		backgroundThread = new Thread(new Schedular());
		backgroundThread.start();
		
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		// TODO Auto-generated method stub
		
	}

}
