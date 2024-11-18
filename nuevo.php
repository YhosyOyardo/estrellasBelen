<?php       
$ruta = "../";
include_once "../plantilla/cabecera.php";
?> 
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Registro de Tutor</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Fondo del formulario con verde claro */
        body {
            background-color: #e0f2e9; /* Verde claro */
        }

        /* Estilo de los botones en verde oscuro */
        .btn-primary, .btn-success {
            background-color: #006400; /* Verde oscuro */
            border: none;
        }

        .btn-primary:hover, .btn-success:hover {
            background-color: #004b00; /* Verde aún más oscuro al pasar el cursor */
        }
    </style>
    <script>
        // Función para verificar si al menos uno de los apellidos está completo
        function validarFormulario() {
            var apellidoPaterno = document.getElementById("apellido_pt").value;
            var apellidoMaterno = document.getElementById("apellido_mt").value;

            // Si ninguno de los dos apellidos está lleno, mostramos un mensaje de error
            if (apellidoPaterno === "" && apellidoMaterno === "") {
                alert("Debe ingresar al menos un apellido (paterno o materno).");
                return false;
            }
            return true; // Permite el envío si la validación pasa
        }

        // Función para calcular la edad automáticamente
        function calcularEdad() {
            var fechaNacimiento = document.getElementById("fecha_nact").value;
            if (fechaNacimiento) {
                var fechaNacimientoDate = new Date(fechaNacimiento);
                var hoy = new Date();
                var edad = hoy.getFullYear() - fechaNacimientoDate.getFullYear();
                var mes = hoy.getMonth() - fechaNacimientoDate.getMonth();
                if (mes < 0 || (mes === 0 && hoy.getDate() < fechaNacimientoDate.getDate())) {
                    edad--;
                }
                document.getElementById("edad").value = edad;
            }
        }

        // Función para verificar que solo se ingresen letras y espacios en los campos de nombre y apellidos
function validarLetras(event) {
    var key = event.keyCode || event.which;
    var tecla = String.fromCharCode(key).toLowerCase();
    var caracteresPermitidos = "abcdefghijklmnopqrstuvwxyzáéíóúü "; // Agregar espacio
    if (caracteresPermitidos.indexOf(tecla) === -1) {
        event.preventDefault();
    }
}

    </script>
</head>

<body>

<div class="container form-container">
    <h3 class="text-center">REGISTRO DE TUTOR</h3>
    
    <form action="registro.php" method="post" enctype="multipart/form-data" onsubmit="return validarFormulario()">
        <!-- Campo de mensaje de error --> 
        <?php if (isset($_GET['error']) && $_GET['error'] == 'true'): ?>
            <div class="mb-3">
                <div class="error-message">Error: El carnet ya está registrado.</div>
            </div>
        <?php endif; ?>
        
        <div class="mb-3">
            <label for="ci_t" class="form-label">CI del Tutor:</label>
            <input type="number" id="ci_t" name="ci_t" class="form-control" placeholder="Ingrese el CI del tutor" required>
        </div>

        <div class="mb-3">
            <label for="nombre_t" class="form-label">Nombre:</label>
            <input type="text" id="nombre_t" name="nombre_t" class="form-control" placeholder="Ingrese el nombre del tutor" required onkeypress="validarLetras(event)">
        </div>

        <div class="mb-3">
            <label for="apellido_pt" class="form-label">Apellido Paterno:</label>
            <input type="text" id="apellido_pt" name="apellido_pt" class="form-control" placeholder="Ingrese el apellido paterno del tutor" onkeypress="validarLetras(event)">
        </div>

        <div class="mb-3">
            <label for="apellido_mt" class="form-label">Apellido Materno:</label>
            <input type="text" id="apellido_mt" name="apellido_mt" class="form-control" placeholder="Ingrese el apellido materno del tutor" onkeypress="validarLetras(event)">
        </div>

        <div class="mb-3">
            <label for="fecha_nact" class="form-label">Fecha de Nacimiento:</label>
            <input type="date" id="fecha_nact" name="fecha_nact" class="form-control" required onchange="calcularEdad()">
        </div>

        <div class="mb-3">
            <label for="edad" class="form-label">Edad:</label>
            <input type="number" id="edad" name="edad" class="form-control" placeholder="Ingrese la edad del tutor" required readonly>
        </div>

        <div class="mb-3">
            <label class="form-label">Género:</label><br>
            <div class="form-check form-check-inline">
                <input type="radio" id="masculino" name="genero_t" value="masculino" class="form-check-input" required>
                <label class="form-check-label" for="masculino">Masculino</label>
            </div>
            <div class="form-check form-check-inline">
                <input type="radio" id="femenino" name="genero_t" value="femenino" class="form-check-input" required>
                <label class="form-check-label" for="femenino">Femenino</label>
            </div>
        </div>

        <div class="mb-3">
            <label for="direccion" class="form-label">Dirección:</label>
            <input type="text" id="direccion" name="direccion" class="form-control" placeholder="Ingrese la dirección del tutor" required>
        </div>

        <div class="mb-3">
            <label for="celular1" class="form-label">Celular:</label>
            <input type="text" id="celular1" name="celular1" class="form-control" placeholder="Ingrese el número de celular del tutor" required>
        </div>

        <div class="mb-3">
            <label for="contrasena_t" class="form-label">Contraseña:</label>
            <input type="password" id="contrasena_t" name="contrasena_t" class="form-control" placeholder="Ingrese la contraseña del tutor" required>
        </div>

        <div class="mb-3">
            <label for="foto_t" class="form-label">Foto del Tutor:</label>
            <input type="file" id="foto_t" name="foto_t" class="form-control-file" accept="image/*" required>
        </div>

        <div class="mb-3">
            <label for="ci_n" class="form-label">CI del Niño:</label>
            <input type="number" id="ci_n" name="ci_n" class="form-control" placeholder="Ingrese el CI del niño asociado" required>
        </div>

        <div class="text-center">
            <button type="submit" class="btn btn-primary">Registrar Tutor</button>
        </div>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>
</html>
<?php
include_once "../plantilla/piepagina.php";
?>
