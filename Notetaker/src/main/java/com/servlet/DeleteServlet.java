package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.connection.ConnectionProvider;
import com.entites.Note;

public class DeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public DeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	try {
		
		int noteid= Integer.parseInt( request.getParameter("note_id").trim());
		// debug....
		System.err.println(noteid);
		Session session=ConnectionProvider.getFactory().openSession();
		Transaction tx=session.beginTransaction();
	      Note note=session.get(Note.class ,noteid);
	      session.delete(note);
	      System.out.println("delete successfull");
	      tx.commit();
		session.close();
		response.sendRedirect("all_notes.jsp");
		
	}
	catch (Exception e) {
		
	}
		
	}

}
