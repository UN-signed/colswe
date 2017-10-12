# Summary Sprint 3
## Avances
  * Implementación del modelo "miembro" que relaciona grupos, proyectos y usuarios
  * Login con tres redes sociales: GitHub, Facebook y Google
  * Dashboard paginado en el home, con los proyectos y artículos creados en la plataforma (usa partials para organizar la información en tarjetas)
  * Implementación de carrierwave para:
    * subir el PDF al crear un artículo
    * subir una imagen de perfil
  * Implementación de WickedPdf para generar PDFs con la información de los proyectos

## Funcionalidades desarrolladas:
* Crear, ver, editar y eliminar proyecto. Agregar una lista de participantes, un líder, un grupo al que pertenece el proyecto y descargar su información en un archivo pdf hacen parte de esta funcionalidad.
* Crear, ver, editar y eliminar atículos. Subir un pdf que corresponde al artículo y definir el autor hacen parte de esta funcionalidad.

## Propuesta para el Sprint 4:
* Implementar el api de Trello para que el líder gestione las tareas y asignaciones de cada proyecto
* Implementar la funcionalidad de subscripción a un proyecto, que dé actualizaciones por correo sobre todos los nuevos eventos de este (otra opción, es hacer un sistema de notificaciones directamente en la plataforma)

## Aplicación desplegada en heroku ---> http://colswe.herokuapp.com/
