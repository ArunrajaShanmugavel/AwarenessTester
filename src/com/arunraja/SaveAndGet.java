package com.arunraja;

import java.io.IOException;
import java.io.PrintWriter;

import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mortbay.log.Log;

import com.google.appengine.repackaged.org.json.JSONException;
import com.google.appengine.repackaged.org.json.JSONObject;

/**
 * Servlet implementation class SaveAndGet
 */
public class SaveAndGet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SaveAndGet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    final static PersistenceManager pm = PMF.get().getPersistenceManager();

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String val = request.getParameter("value");

		DataObjSimple e = pm.getObjectById(DataObjSimple.class, val);
		
		System.out.println("Data obtained is "+e);
		
		JSONObject json = new JSONObject();
		
		try {
			json.put(e.key, e.val);
		} catch (JSONException e1) {
			Log.warn("Error"+e1.getMessage(),e1);
		}
		
		PrintWriter pw = response.getWriter();
		response.setContentType("application/json");
		pw.print(json);
		pw.flush();
	}
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String val = request.getParameter("value");
		DataObjSimple dos = new DataObjSimple();
		dos.key = "k1";
		dos.val = val;
		
		System.out.println(pm.makePersistent(dos));
		PrintWriter pw = response.getWriter();
		
		JSONObject json = new JSONObject();
		try 
		{
			json.put("status","true");
		} catch (JSONException e1) 
		{
			Log.warn("Error"+e1.getMessage(),e1);
		}
		pw.print( json);
		pw.flush();
	}

}
