<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <style>
        /* Your CSS styles here */
    </style>
</head>
<body>
    <header>
        <h1>Student Dashboard</h1>
        <% 
            // Retrieve the username from session
            String username = (String) session.getAttribute("username");
        %>
        <% if (username != null && !username.isEmpty()) { %>
            <h1>Hello, <%= username %></h1>
        <% } else { %>
            <h1>No username found in session.</h1>
        <% } %>
    </header>

    <main>
        <!-- View Upcoming Exams -->
        <section class="view-section">
            <h2>Upcoming Exams</h2>
            <table>
                <thead>
                    <tr>
                        <th>Exam ID</th>
                        <th>Exam Name</th>
                        <th>Exam Date</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Database connection details
                        String url = "jdbc:mysql://localhost:3306/tutor";
                        String dbUser = "root";
                        String dbPassword = "";
                        Connection conn = null;
                        PreparedStatement pst = null;
                        ResultSet rs = null;

                        try {
                            // Load and register the JDBC driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Establish the connection
                            conn = DriverManager.getConnection(url, dbUser, dbPassword);

                            // Prepare a statement to fetch exams for the logged-in student
                            String sql = "SELECT exam_id, exam_name, exam_date FROM exams WHERE username = ?";
                            pst = conn.prepareStatement(sql);
                            pst.setString(1, username); // Use the username from session
                            rs = pst.executeQuery();

                            // Iterate over the result set and display the data
                            while (rs.next()) {
                                int examId = rs.getInt("exam_id");
                                String examName = rs.getString("exam_name");
                                java.sql.Date examDate = rs.getDate("exam_date");
                    %>
                                <tr>
                                    <td><%= examId %></td>
                                    <td><%= examName %></td>
                                    <td><%= examDate %></td>
                                </tr>
                    <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                    %>
                                <tr>
                                    <td colspan="3">Error fetching data</td>
                                </tr>
                    <% 
                        } finally {
                            // Close resources
                            try { if (rs != null) rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (pst != null) pst.close(); } catch (SQLException e) { e.printStackTrace(); }
                            try { if (conn != null) conn.close(); } catch (SQLException e) { e.printStackTrace(); }
                        }
                    %>
                </tbody>
            </table>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Tutorial Services</p>
    </footer>
</body>
</html>
