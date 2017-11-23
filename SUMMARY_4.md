# Summary Sprint 3

## Convenciones (personas que trabajaron en la tarea)
D -> Daniel Caita
C -> Jesús Chavarro
J -> Juan Pablo Ovalle
Y -> Yeliana Torres

## Avances
  * Vista del modelo "miembro" para ver grupos y proyectos a los que pertenece un usuario (D y Y)
  * Dashboard paginado en el home, separado por pestañas: Todos, Proyectos, artículos, Grupos y Miembros de la plataforma (C y Y)
  * Validación de la subida imágenes de perfil y configuración de la imagen de perfil por defecto (Y)
  * Implementación de la funcionalidad "crear proyecto" dentro de la vista del grupo en el que se desea crear (J y D)

## Funcionalidades desarrolladas:
* Crear y editar grupos de investigación con el usuario que lo creó como admin (sólo él puede editar el grupo).
* Crear y editar proyecto. Agregar una lista de participantes y descargar su información en un archivo pdf hacen parte de esta funcionalidad (Esta funcionalidad ahora se encuentra en la vista de grupo en el que se desea crear)
* Crear, editar y eliminar artículos. Subir un pdf que corresponde al artículo hace parte de esta funcionalidad.
* Ver proyectos, artículos, grupos y miembros de la plataforma, organizado en un sólo lugar: El Dashboad

## Propuesta para el Sprint 5:
* Implementar barra de búsqueda funcional en el dashboard
* Implementar permisos para los roles que hay en la plataforma:
  * Visitante (no se ha registrado)
  * Admin de grupo
  * Líder de proyecto
  * Participante de proyecto
  * Autor de artículo
* Implementar el api de Trello para que el líder gestione las tareas y asignaciones de cada proyecto
* Implementar la funcionalidad de subscripción a un grupo, que dé actualizaciones por correo sobre todos los nuevos eventos de este (otra opción, es hacer un sistema de notificaciones directamente en la plataforma)

## Aplicación desplegada en heroku ---> http://colswe.herokuapp.com/
