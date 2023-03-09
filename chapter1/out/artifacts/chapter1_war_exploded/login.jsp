<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <nav style="background-color: #005850" class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link " aria-current="page" href="/registration">Registration</a>
                    <a class="nav-link active" href="/login">Login</a>
                    <a class="nav-link" href="/users">Users</a>
                </div>
            </div>
        </div>
    </nav>
</head>
<body>
    <form action="/login" method="post">
        <div style="width:30%;" class="mt-5 container content-center col-md-n ">
            <%
                if (request.getAttribute("error") != null) {
                    if ((boolean) request.getAttribute("error")) {
            %>
            <div class="alert alert-danger" role="alert">
               Неверный логин!
            </div>
            <%
            } else {
            %>
            <div class="alert alert-danger" role="alert">
                Неверный пароль!
            </div>
            <%
                    }
                }
            %>
            <span>Электронная почта:</span>
            <input required name="email" type="text" class="form-control mt-1 mb-3" placeholder="электронная почта"
                   aria-label="Username" aria-describedby="basic-addon1">
            <span>Пароль:</span>
            <input required name="password" type="text" class="form-control mt-1" placeholder="пароль"
                   aria-label="Username" aria-describedby="basic-addon1">
            <button  style="width: 100%; background-color: #005850" class="btn btn-secondary mt-4">Авторизация</button>
        </div>
    </form>
</body>
</html>