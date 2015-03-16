package listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;


import databaseInteractor.DatabaseInteractor;

/**
 * Application Lifecycle Listener implementation class LifetimeListener
 *
 */
@WebListener
public class LifetimeListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public LifetimeListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0) {
    	DatabaseInteractor dbInteractor = new DatabaseInteractor();
    	ServletContext context = arg0.getServletContext();
        context.setAttribute("dbInteractor", dbInteractor);
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0) {
        // TODO Auto-generated method stub
    }
	
}
