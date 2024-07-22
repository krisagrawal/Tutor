<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
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
        margin-top:50px;
            padding: 2rem;
        }

        .view-section {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            padding: 1.5rem;
        }

        h2 {
            margin-top: 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table,
        th,
        td {
            border: 1px solid #ddd;
        }

        th,
        td {
            padding: 0.75rem;
            text-align: left;
        }

        footer {
        margin-top: 250px;
            background-color: blue;
            color: #fff;
            padding: 1rem;
            text-align: center;
        }
    </style>
</head>
<body>
    <header>
        <h1>Student Dashboard</h1>
    </header>

    <main>
        <!-- View Upcoming Exams -->
        <section class="view-section">
            <h2>Upcoming Exams</h2>
            <h3><%=request.getAttribute("test") %></h3>
            <table>
                <thead>
                    <tr>
                        <th>Exam ID</th>
                        <th>Exam Name</th>
                        <th>Exam Date</th>
                    </tr>
                </thead>
                <tbody>
                
                    
                                <tr>
                                    <td>Examid</td>
                                    <td>Examname</td>
                                    <td>Examdate</td>
                                </tr>
                    
                </tbody>
            </table>
        </section>
    </main>

    <footer>
        <p>&copy; 2024 Tutorial Services</p>
    </footer>
</body>
</html>
