<%@ page import="model.User" %>
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
                    <a class="nav-link" aria-current="page" href="/registration">Registration</a>
                    <a class="nav-link" href="/login">Login</a>
                    <a class="nav-link" href="/users">Users</a>
                </div>
            </div>
        </div>
    </nav>
</head>
<body>
                    <% User user = (User) request.getAttribute("user");%>
<form action="/DetailsServlet" method="post">
    <div style="width:30%;" class="mt-5 container content-center col-md-n ">
        <span>Электронная почта:</span>
        <input required name="email" type="text" class="form-control mt-1 mb-3" placeholder="email"
               aria-describedby="basic-addon1" value="<%=user.getEmail()%>">
        <span>ФИО:</span>
        <input required name="fullname" type="text" class="form-control mt-1 mb-3" placeholder="fullname"
               aria-describedby="basic-addon1" value="<%=user.getFullname()%>">
        <span>Пол:</span>
        <input required name="gender" type="text" class="form-control mt-1 mb-3" placeholder="gender"
               aria-describedby="basic-addon1" value="<%=user.getGender()%>">
        <span>Возраст:</span>
        <input required name="age" type="number" class="form-control mt-1 mb-3" placeholder="age"
               aria-describedby="basic-addon1" value="<%=user.getAge()%>">
        <span>Пароль:</span>
        <input required name="password" type="text" class="form-control mt-1 mb-3" placeholder="password"
               aria-describedby="basic-addon1" value="<%=user.getPassword()%>">
        <button style="width: 100%; background-color: #005850" class="btn btn-secondary mt-4">Внести изменения</button>
    </div>
</form>
</body>
</html>
