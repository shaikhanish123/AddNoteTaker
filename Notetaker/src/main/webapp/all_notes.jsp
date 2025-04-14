<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.hibernate.Session" %>
<%@ page import="org.hibernate.SessionFactory" %>
<%@ page import="java.util.List" %>
<%@ page import="com.entites.Note" %> <!-- Your package -->
<%@ page import="com.connection.ConnectionProvider" %> <!-- Your package -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notes</title>
    <style>
        /* Global Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 50px auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #333;
            color: #fff;
        }

        tr:hover {
            background-color: #f1f1f1;
        }

        .btn {
            padding: 8px 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            text-decoration: none;
            font-size: 14px;
        }

        .btn-warning {
            background-color: #f0ad4e;
            color: #fff;
        }

        .btn-danger {
            background-color: #d9534f;
            color: #fff;
        }

        .btn-warning:hover {
            background-color: #ec971f;
        }

        .btn-danger:hover {
            background-color: #c9302c;
        }

        /* Responsive design */
        @media (max-width: 768px) {
            .container {
                width: 95%;
            }

            table, th, td {
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>All Notes</h1>
        
        <form action="DeleteServlet" method="post">
            <table>
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        Session s = null;
                        List<Note> notes = null;

                        try {
                            s = ConnectionProvider.getFactory().openSession();
                            notes = s.createQuery("from Note", Note.class).list();
                        } catch (Exception e) {
                            e.printStackTrace();  
                        }        
                      
                        for (Note note : notes) {
                    %>
                        <tr>
                           
                            <td><%= note.getTitle() %></td>
                            <td><%= note.getContent() %></td>
                            <td>
                                <!-- Update Button -->
                             <a href="Edit.jsp?note_id=<%= note.getId() %>" class="btn btn-warning">Update</a>

                                <!-- Delete Button -->
                          <button type="submit" name="note_id" value="<%= note.getId() %>" class="btn btn-danger">Delete</button>


                            </td>
                        </tr>
                    <% 
                        }
                    %>
                </tbody>
            </table>
        </form>
    </div>
</body>
</html>
