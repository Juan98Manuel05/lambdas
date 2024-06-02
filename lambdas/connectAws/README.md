# Lambda con AWS Lambda

Primero se debe descargar el folder **connectAws** el cual sera nuestra lambda para desplegar en AWS lambda
o descargar el proyecto completo, posteriormente debemos empaquetar nuestra lambda en un archivo **.zip** una vez
tengamos nuestra lambda empaquetada debemos preparar nuestro entorno aws

### 1. Crear la base de datos RDS:

- Primero, crea una base de datos RDS de tipo MySQL utilizando la información ubicada en la carpeta **MySQL** de este proyecto.
- Durante el proceso de creación, asegúrate de guardar el nombre de usuario y la contraseña, ya que los necesitarás en pasos posteriores.

### 2. Crear una llave secreta en AWS Secrets Manager:

- Una vez creada la base de datos con la información, crea una llave secreta de conexión a la base de datos utilizando AWS Secrets Manager.
- La llave secreta debe ser de tipo Otros, y debes crear pares de clave-valor con los siguientes valores. Asegúrate de que las propiedades tengan los nombres exactamente como en el ejemplo:

```
{
    "host": "arn_de_la_base_de_datos",
    "username": "usuario",
    "password": "contraseña",
    "database": "nombre_base_de_datos",
}
```

### 3. Configurar AWS Lambda:

- Una vez que tengas la llave secreta, crea una función Lambda en AWS Lambda.
- Configura una variable de entorno en la Lambda que extraerá los datos del secreto y los usará para la conexión.
- Esta variable de entorno debe llamarse SECRETS_MANAGER_SECRET_NAME y su valor será el ARN del secreto creado, que normalmente es el nombre con el que se creó en AWS Secrets Manager.
- Además, asegúrate de otorgar los permisos necesarios para que la Lambda tenga acceso a la base de datos.

### 4. Asignar roles y permisos a la Lambda:

- Configura un rol para la Lambda con permisos de acceso total a RDS y Lambda.
- Una vez creado el rol, asígnalo a la Lambda en las opciones de configuración. Para ello, busca la opción de permisos y selecciona Edit o Editar.
- En la opción de "Rol existente", selecciona el rol que creaste. Estos roles pueden ser creados en IAM.

Siguiendo estos pasos, podrás configurar correctamente la conexión a la base de datos y la función Lambda en AWS