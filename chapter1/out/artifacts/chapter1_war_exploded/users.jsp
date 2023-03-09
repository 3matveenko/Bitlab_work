<%@ page import="java.util.ArrayList" %>
<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN"
            crossorigin="anonymous"></script>
    <nav style="background-color: #005850" class="navbar navbar-expand-lg navbar-dark">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                <div class="navbar-nav">
                    <a class="nav-link " aria-current="page" href="/registration">Registration</a>
                    <a class="nav-link" href="/login">Login</a>
                    <a class="nav-link active" href="/users">Users</a>
                </div>
            </div>
        </div>
    </nav>
</head>
<body>
<div class="mx-auto w-50 mt-5">
    <h3>Список зарегистрированных пользователей</h3>
        <table class="table">
            <thead>
            <tr>
                <th>№</th>
                <th>Ф.И.О.</th>
                <th>Электронная почта</th>
                <th>Возраст</th>
                <th>Пол</th>
                <th>Удалить</th>
                <th>Детали</th>
            </tr>
            </thead>
            <tbody>
            <%
                ArrayList<User> users = (ArrayList<User>) request.getAttribute("users");
                if(users!=null){
                for(User u: users){
            %>
            <tr>
                <td><%=u.getId()%></td>
                <td><%=u.getFullname()%></td>
                <td><%=u.getEmail()%></td>
                <td><%=u.getAge()%></td>
                <td><%=u.getGender()%></td>
                <td><button style="font-size: 15px; padding: 3px 8px;" type="button" class="btn btn-danger"
                            data-bs-toggle="modal" data-bs-target="#exampleModal<%=u.getId()%>">Удалить</button></td>
                <form action="/DetailsServlet" method="get">
                    <input name="id" type="hidden" value="<%=u.getId()%>">
                    <td><button style="font-size: 15px; padding: 3px 12px; background-color: #005850; color: white"
                                class="btn">Детали</button></td>
                </form>

            </tr>
            <div class="modal fade" id="exampleModal<%=u.getId()%>" tabindex="-1"
                 aria-labelledby="exampleModalLabel<%=u.getId()%>" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h1 class="modal-title fs-5" id="exampleModalLabel<%=u.getId()%>">Вы уверены?</h1>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                            <form action="/delete" method="post">
                                <input type="hidden" name="id" value="<%=u.getId()%>">
                                <button class="btn btn-danger">Удалить</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
  <%}
  }%>
            </tbody>
        </table>
</div>
</body>
</html>