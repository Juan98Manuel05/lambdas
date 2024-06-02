# Lambda Function

Instalar dependencias:

```
npm install
```

En el directorio raiz del proyecto construir una imagen Docker ejecutando el siguiente comando, el archivo Dockerfile ya se encuentra creado y configurado
```
docker build -t sort-tuples .
```
Asegurate de tener docker instalado para que funcione correctamente.

Posteriormente debes ejecutar el siguiente comando, para inicializar de forma local tu contenedor de Docker
```
docker run -p 9000:8080 sort-tuples
```
El nombre **sort-tuples** es para fines del ejemplo, puedes agregarle el nombre que tu quieras a tu contenedor

Una vez este en ejecucion la funcion lambda, debemos verificar el funcionamiento de la misma, podemos usar postman para el ejemplo o por CMD
### Postman

Realizar una peticion de tipo post que debe llevar los siguientes parametros en el body de la request, el parametro que se debe respetar es **list_tuples** y 
debe ser un **Array** de tuplas
```
{
    "list_tuples": [
        ["Manuel", 26],
        ["Samuel", 1],
        ["Mariela", 47],
        ["Nicol", 21]
    ]
}
```
Posteriormente ejecutar la peticion dando clic en el boton de **SEND**
```
POST > http://localhost:9000/2015-03-31/functions/function/invocations
```


### CMD

Por cmd podemos ejecutar el siguiente comando:
```
curl -XPOST "http://localhost:9000/2015-03-31/functions/function/invocations" -d '{"price": 10.000}'
```

Response:
```
{"statusCode":200,"body":["PLAY STATION 3","XBOX ONE","PLAY STATION 5","NINTENTO SWIFT"]}
```
Debe obtener listado con el nombre de los productos, que contienen un precio mayor al indicado en el body de la request.

