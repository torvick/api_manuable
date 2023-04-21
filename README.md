<p align="center">
  <a href="https://rubyonrails.org/"><img width="300" src="https://zakaria.dev/assets/images/rails_base_app/Ruby_On_Rails_Logo.png" alt="Ruby On Rails"></a>
</p>

# API de tarifas de envío

[![](https://badgen.net/rubygems/p/rails)]()

[![](https://badgen.net/rubygems/n/rails)]()


## Proyecto

Esta es una API de tarifas de envío que proporciona tarifas estimadas para envíos desde un origen a un destino determinado.


## Iniciando

> Para obtener una copia local en funcionamiento, siga estos sencillos pasos.


## Prerequisitos

  - <a href="https://www.ruby-lang.org/en/news/2022/11/24/ruby-3-1-2-released/">Ruby 3.0.0</a>
  - <a href="https://rubyonrails.org/">Ruby on Rails 7</a>



### 1. Clonar repositorio

``` bash
git clone https://github.com/torvick/api_manuable.git
cd api_manuable
```

### 2. Instalar dependencias

``` bash
bundle install
```

### 3. Correr la app

- Run the server

``` bash
 rails s
```


## Cómo usar la API

La API proporciona un único endpoint que acepta una solicitud HTTP POST en http://localhost:3000/api/v1/shipping_rates con los parámetros de origen, destino y paquete.

### Configurarcion del cliente

El archivo fedex_client.rb se encuentra en la ruta config/initializers/ de la aplicación Rails. 

Este archivo inicializa una instancia de Fedex::Client utilizando las credenciales almacenadas en config/credentials.yml.enc.

Para utilizar el objeto @fedex_client en cualquier parte de la aplicación, simplemente llama a la variable @fedex_client y utiliza cualquiera de los métodos disponibles en la gema fedex.

> Ejemplo del archivo config/credentials.yml.enc

```ruby
    fedex:
        key: 'valor'
        password: 'contraseña'
        account_number: 'numero de cuenta'
        meter_number: 'numero de medidor'
```

> Ejemplo de solicitud

``` json
POST /api/v1/shipping_rates HTTP/1.1
Content-Type: application/json

{
  "address_from": {
    "zip": "64000",
    "country": "MX"
  },
  "address_to": {
    "zip": "64000",
    "country": "MX"
  },
  "parcel": {
    "length": 25.0,
    "width": 28.0,
    "height": 46.0,
    "distance_unit": "cm",
    "weight": 6.5,
    "mass_unit": "kg"
  }
}
```

> Ejemplo de respuesta exitosa

``` json
HTTP/1.1 200 OK
Content-Type: application/json

{
    "code": 200,
    "request_id": "e3d5a39f-7640-4fa3-b27d-4d7c253ce909",
    "request_ip": "::1",
    "url": "http://localhost",
    "status": true,
    "method": "GET",
    "service": "api/v1/shipping_rates",
    "data": [
        {
            "price": "150.74",
            "currency": "MXN",
            "service_level": {
                "name": "",
                "token": ""
            }
        },
        {
            "price": "524.71",
            "currency": "MXN",
            "service_level": {
                "name": "Priority Overnight",
                "token": "PRIORITY_OVERNIGHT"
            }
        },
        {
            "price": "418.49",
            "currency": "MXN",
            "service_level": {
                "name": "Standard Overnight",
                "token": "STANDARD_OVERNIGHT"
            }
        },
        {
            "price": "266.16",
            "currency": "MXN",
            "service_level": {
                "name": "Fedex Express Saver",
                "token": "FEDEX_EXPRESS_SAVER"
            }
        }
    ]
}

```

> Ejemplo de respuesta de error

``` json
HTTP/1.1 422 Unprocessable Entity
Content-Type: application/json

{
    "code": 400,
    "request_id": "dbd9b99b-a0e8-44ab-a2f9-c961df93fa62",
    "request_ip": "::1",
    "url": "http://localhost",
    "status": false,
    "method": "GET",
    "service": "api/v1/shipping_rates",
    "errors": [
        [
            "The property '#/parcel' did not contain a required property of 'weight' in schema 20bfa2d0-d4c8-59fb-b3e9-de8837b653cc",
            "The property '#/parcel' did not contain a required property of 'mass_unit' in schema 20bfa2d0-d4c8-59fb-b3e9-de8837b653cc"
        ]
    ],
    "message": [
        "The property '#/parcel' did not contain a required property of 'weight' in schema 20bfa2d0-d4c8-59fb-b3e9-de8837b653cc",
        "The property '#/parcel' did not contain a required property of 'mass_unit' in schema 20bfa2d0-d4c8-59fb-b3e9-de8837b653cc"
    ]
}

```

## Cómo contribuir

Si desea contribuir a esta aplicación, haga lo siguiente:

Fork este repositorio.
Cree una rama nueva para su función: git checkout -b mi-nueva-funcion.
Haga sus cambios y pruebe todo.
Envíe una solicitud de extracción (pull request) a la rama principal de este repositorio.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT - consulte el archivo LICENSE para obtener detalles.
