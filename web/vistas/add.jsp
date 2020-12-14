<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <title>Actividad - Pagina JSP | Java Web</title>
    </head>
    <body>
        <div class="container">
            <div class="col-lg-6">
                <h1>Agregar Aprendiz</h1>
                <form action="Controlador">
                    Nombres: <br>
                    <input class="form-control" type="text" name="txtNom"><br>
                    Email:<br>
                    <input class="form-control" type="text" name="txtEmail"><br>
                    <input class="btn btn-primary" type="submit" name="accion" value="Agregar">
                    <a href="Controlador?accion=listar">Volver</a>
                </form>
            </div>

        </div>
    </body>
</html>
