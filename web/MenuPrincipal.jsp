<%@page import="java.util.Iterator"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Persona"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>systemRU - Dashboard</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    </head>
    <body>
        <nav class="navbar navbar-dark bg-dark">
            <a style="color: orangered" class = "navbar-toggler"><span class = "navbar-toggler-icon"></span> Inicio </a>
            <div class = "dropdown">
                <a style="color: orangered" href = "#" class = "nav-link dropdown-toggle" data-toggle = "dropdown">Cerrar sesión</a>
                <div class = "dropdown-menu text-center">
                    <a><img src="img/usuario.png" heigh="15" width="20"/></a>
                    <a>${nom}</a>
                    <a>${email}</a>
                    <div class = "dropdown-divider"></div>
                    <a href="Controlador?accion=salir" class = "dropdown-item">Salir</a>
                </div>
            </div>
        </nav>
        <div class = "container mt-4">
            <h2>Bienvenido a SystemRU - <Strong>Usuario: ${nom}</strong> </h2>
        </div>
        
                <div class="container">
            <h1>Aprendices</h1>
            <a class="btn btn-success" href="Controlador?accion=add">Agregar Nuevo Aprendiz</a>
            <br>
            <br>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th class="text-center">Id</th>
                        <th class="text-center">Nombre</th>
                        <th class="text-center">email</th>
                        <th class="text-center">Gestionar</th>
                    </tr>
                </thead>
                <%
                    PersonaDAO dao=new PersonaDAO();
                    List<Persona>list=dao.listar();
                    Iterator<Persona>iter=list.iterator();
                    Persona per=null;
                    while(iter.hasNext()){
                        per=iter.next();
                    
                %>
                <tbody>
                    <tr>
                        <td class="text-center"><%= per.getId()%></td>
                        <td class="text-center"><%= per.getNombre()%></td>
                        <td><%= per.getEmail()%></td>
                        <td class="text-center">
                            <a class="btn btn-warning" href="Controlador?accion=editar&id=<%= per.getId()%>">Editar</a>
                            <a class="btn btn-danger" href="Controlador?accion=eliminar&id=<%= per.getId()%>">Eliminar</a>
                        </td>
                    </tr>
                    <%}%>
                </tbody>
            </table>

        </div>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    </body>
</html>
