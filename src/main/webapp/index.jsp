<html>
<head>
    <title>Java App – CI/CD Demo</title>
    <style>
        body {
            margin: 0;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            background: linear-gradient(135deg, #0f2027, #203a43, #2c5364);
            font-family: Arial, Helvetica, sans-serif;
        }
        .card {
            background: #ffffff;
            padding: 30px 40px;
            border-radius: 12px;
            width: 600px;
            text-align: center;
            box-shadow: 0 20px 40px rgba(0,0,0,0.3);
        }
        h2 {
            color: #203a43;
            margin-bottom: 15px;
        }
        p {
            color: #444;
            line-height: 1.6;
            font-size: 15px;
        }
        .badge {
            display: inline-block;
            margin-top: 20px;
            padding: 8px 14px;
            background: #2c5364;
            color: white;
            border-radius: 20px;
            font-size: 13px;
            font-weight: bold;
        }
        .footer {
            margin-top: 18px;
            font-size: 13px;
            color: #777;
        }
    </style>
</head>

<body>
    <div class="card">
        <h2>🚀 Java Application Deployment</h2>

        <p>
            Hello World! This application is pulled from <b>GitHub</b> and deployed
            through an automated <b>CI/CD pipeline</b>.
        </p>

        <p>
            The build, containerization, and deployment were successfully handled
            by <b>Jenkins</b>, and webhook triggers have been verified.
        </p>

        <div class="badge">
            Deployed by Jenkins – Docker Image v2
        </div>

        <div class="footer">
            Environment: Dev | CI/CD Demo
        </div>
    </div>
</body>
</html>
