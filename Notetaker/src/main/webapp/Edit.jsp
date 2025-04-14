<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.Transaction" %>
<%@ page import="com.entites.Note" %> <!-- Import your Note class -->
<%@ page import="com.connection.ConnectionProvider" %> <!-- Import your connection provider class -->
<%@ page import="javax.servlet.http.HttpServletResponse" %> <!-- For response redirect -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Note</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Container */
        .note-container {
            background: #fff;
            padding: 20px 30px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        /* Form Styles */
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }

        input[type="text"],
        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        textarea {
            resize: none;
        }

        button {
            width: 100%;
            padding: 10px;
            background: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease;
        }

        button:hover {
            background: #0056b3;
        }
    </style>
</head>
<body>
    <div class="note-container">
        <h1>Edit Note</h1>
        <%
            
            int id = Integer.parseInt(request.getParameter("note_id").trim());
              System.out.println(id);
            // Step 2: Open Hibernate session
            Session s = ConnectionProvider.getFactory().openSession();
            Transaction tx = s.beginTransaction();
            Note note = s.get(Note.class, id);
            if (note != null) {
                
        %>
               <form action="UpdateServlet" method="post">
    <input type="hidden" name="note_id" value="<%= note.getId() %>" />
    
    <div class="form-group">
        <label for="note-title">Edit your note title:</label>
        <input type="text" id="note-title" name="title" value="<%= note.getTitle() %>" required />
    </div>
    
    <div class="form-group">
        <label for="note-content">Note Content:</label>
        <textarea id="note-content" name="content" rows="5" required><%= note.getContent() %></textarea>
    </div>
    
    <button type="submit">Update Note</button>
    
    <%
    }
            
      else{ 
    	  
      %>
    <p>Note not found</p>
    <% 
    }
     %>
   
</form>
