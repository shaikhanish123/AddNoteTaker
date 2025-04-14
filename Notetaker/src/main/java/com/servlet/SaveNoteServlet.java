package com.servlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.connection.ConnectionProvider;
import com.entites.Note;

public class SaveNoteServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public SaveNoteServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String title = request.getParameter("note-title");
            String content = request.getParameter("note-content");

            // Create Note object
            Note note = new Note(title, content, new Date());
            // Debug output
            System.out.println(note.getId() + " " + note.getTitle());
            Session session= ConnectionProvider.getFactory().openSession();
            // for permanently store the data
            Transaction tx=session.beginTransaction();
            session.save(note);
            tx.commit();
            session.close();
            response.setContentType("text/html");
            PrintWriter out=response.getWriter();
            out.println("<h1 style='text-align:center'> note added</h1>");
            out.println("<h1 style='text-align:center'><a href='all_notes.jsp'>ViewsAll</a></h1>");
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
