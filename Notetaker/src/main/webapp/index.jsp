<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Note Taker</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Navbar Styles */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #333;
            padding: 10px 20px;
        }

        .navbar a {
            text-decoration: none;
            color: white;
            padding: 8px 15px;
            margin: 0 5px;
        }

        .navbar a:hover {
            background-color: #575757;
            border-radius: 5px;
        }

        .navbar .brand {
            font-size: 24px;
            font-weight: bold;
            color: #f4c10f;
        }

        /* Responsive Menu for Mobile */
        @media (max-width: 600px) {
            .navbar {
                flex-wrap: wrap;
            }

            .navbar a {
                flex: 1 1 100%;
                text-align: center;
                padding: 10px 0;
            }
        }

        /* Welcome Section */
        .welcome-section {
            text-align: center;
            padding: 30px 20px;
            background-color: #f4f4f4;
        }

        .welcome-section h1 {
            font-size: 32px;
            color: #333;
        }

        .welcome-section p {
            font-size: 18px;
            color: #555;
            max-width: 800px;
            margin: 10px auto;
        }

        .buttons {
            margin-top: 20px;
        }

        .buttons a {
            display: inline-block;
            text-decoration: none;
            color: white;
            background-color: #333;
            padding: 10px 20px;
            border-radius: 5px;
            margin: 0 10px;
            font-size: 16px;
        }

        .buttons a:hover {
            background-color: #f4c10f;
            color: black;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <div class="navbar">
        <div class="brand">Note Taker</div>
        <div>
            <a href="index.html">Home</a>
            <a href="add_notes.jsp">Add Note</a>
            <a href="all_notes.jsp">Show Note</a>
        </div>
    </div>

    <!-- Welcome Section -->
    <div class="welcome-section">
        <h1>Welcome to the Note Taker Application!</h1>
        <p>
            This application allows you to efficiently manage your notes. Whether you want to quickly jot down ideas or keep a detailed record, the Note Taker application has got you covered.
            Navigate through the options to add new notes or view all your saved notes.
        </p>
    </div>
</body>
</html>
