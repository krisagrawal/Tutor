<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.Connection, java.sql.DriverManager, java.sql.PreparedStatement, java.sql.ResultSet, java.sql.SQLException" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Page</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to your CSS file -->
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f4;
}

header {
    background-color: blue;
    color: #fff;
    padding: 1rem;
    text-align: center;
}

main {
    padding: 2rem;
}

.form-section {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 5px;
    margin-bottom: 1.5rem;
    padding: 1.5rem;
}

h2 {
    margin-top: 0;
}

label {
    display: block;
    margin-bottom: 0.5rem;
}

input[type="text"],
input[type="email"],
input[type="date"] {
    width: 100%;
    padding: 0.5rem;
    margin-bottom: 1rem;
    border: 1px solid #ddd;
    border-radius: 5px;
}

button {
    background-color: #333;
    color: #fff;
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #555;
}

.view-section table {
    width: 100%;
    border-collapse: collapse;
}

.view-section table,
.view-section th,
.view-section td {
    border: 1px solid #ddd;
}

.view-section th,
.view-section td {
    padding: 0.75rem;
    text-align: left;
}

footer {
    background-color: blue;
    color: #fff;
    padding: 1rem;
    text-align: center;
}
    
    </style>
</head>
<body>
    <header>
        <h1>Admin Dashboard</h1>
        <% 
            // Retrieve the username from session
            String name = (String) session.getAttribute("name");
        %>
        <% if (name != null && !name.isEmpty()) { %>
            <h1>Hello <%= name %></h1>
        <% } else { %>
            <h1>No username found in session.</h1>
        <% } %>
    </header>

    <main>
        <!-- Add Student Form -->
         <!-- <section class="form-section">
            <h2>Add Student</h2>
            <form action="AddStudentServlet" method="post">
                <label for="studentName">Name:</label>
                <input type="text" id="studentName" name="studentName" required>
                
                <label for="studentEmail">Email:</label>
                <input type="email" id="studentEmail" name="studentEmail" required>
                
                <button type="submit">Add Student</button>
            </form>
        </section> --!> 

        <!-- View Students -->
        <section class="view-section">
            <h2>View Students</h2>
            <table>
                <thead>
                    <tr>
                        <th>Username</th>
                        <th>Name</th>
                        <th>Email</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                   	 	String userName = (String) session.getAttribute("username");
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
                            String sql = "SELECT * FROM users";
                            pst = conn.prepareStatement(sql);
                            // Use the username from session
                            rs = pst.executeQuery();

                            // Iterate over the result set and display the data
                            while (rs.next()) {
                            	int role = rs.getInt("role");
                            	if(role == 2) {
	                                String StudUsername = rs.getString("username");
	                                String StudName = rs.getString("name");
	                                String email = rs.getString("email");
                    %>
	                                <tr>
	                                    <td><%= StudUsername %></td>
	                                    <td><%= StudName %></td>
	                                    <td><%= email %></td>
	                                </tr>
                    <% 			}
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

        <!-- Modify Student Data -->
        <section class="form-section">
            <h2>Modify Student Data</h2>
            <form action="ModifyStudentServlet" method="post">
            	<input type="hidden" name="username" value="<%=userName %>">
                <label for="studentId">Student Username:</label>
                <input type="text" id="studentId" name="studUsername" required>
                
                <label for="newStudentName">New Name:</label>
                <input type="text" id="newStudentName" name="newStudentName">
                
                <label for="newStudentEmail">New Email:</label>
                <input type="email" id="newStudentEmail" name="newStudentEmail">
                
                <button type="submit">Update Student</button>
            </form>
        </section> 

        <!-- Create Exam Form -->
        <section class="form-section">
            <h2>Create Exam</h2>
            <form action="CreateExamServlet" method="post">
                <label for="examName">Exam Name:</label>
                <input type="text" id="examName" name="examName" required>
                
                <label for="examDate">Exam Date:</label>
                <input type="date" id="examDate" name="examDate" required>
                
                <button type="submit">Create Exam</button>
            </form>
        </section>

        <!-- Assign Exam Date -->
        <section class="form-section">
            <h2>Assign Exam Date</h2>
            <form action="AssignExamDateServlet" method="post">
                <label for="examId">Exam ID:</label>
                <input type="text" id="examId" name="examId" required>
                
                <label for="newExamDate">New Exam Date:</label>
                <input type="date" id="newExamDate" name="newExamDate" required>
                
                <button type="submit">Update Exam Date</button>
            </form>
        </section>

        <!-- Assign Exam to Students -->
        <section class="form-section">
            <h2>Assign Exam to Students</h2>
            <form action="AssignExamServlet" method="post">
                <label for="examId">Exam ID:</label>
                <input type="text" id="examId" name="examId" required>
                
                <label for="studentIds">Student IDs (comma-separated):</label>
                <input type="text" id="studentIds" name="studentIds" required>
                
                <button type="submit">Assign Exam</button>
            </form>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Tutoring Services</p>
    </footer>
</body>
</html>
