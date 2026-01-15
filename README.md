# Flutter Auth Clean BLoC

Flutter Auth Clean BLoC es una aplicación de autenticación desarrollada en Flutter, construida desde el inicio utilizando Arquitectura Limpia (Clean Architecture) y el patrón BLoC como gestor de estado.  
El proyecto está enfocado en buenas prácticas de arquitectura, manejo de estado y diseño consistente orientado a producción.

---

## Funcionalidades principales

- Login de usuario consumiendo una API real.
- Gestión de estado utilizando BLoC.
- Persistencia de sesión mediante almacenamiento local.
- Splash Screen que verifica automáticamente la sesión al iniciar la aplicación.
- Protección de rutas (no se puede acceder al Home sin autenticación).
- Logout que limpia la sesión y redirige al Login.
- Interfaz de usuario consistente mediante un Theme global compartido entre Login y Home.

---

## Flujo de la aplicación

1. La aplicación inicia en un Splash Screen.
2. Se valida si existe un token almacenado localmente.
3. Si hay una sesión activa, el usuario es redirigido al Home.
4. Si no hay sesión, el usuario es redirigido al Login.
5. El usuario puede cerrar sesión en cualquier momento.

---

## Notas técnicas

- API utilizada: https://fakestoreapi.com  
- Arquitectura: Clean Architecture + BLoC  
- Gestión de estado: flutter_bloc  
- Persistencia local: Shared Preferences  
- Diseño: Theme global para una interfaz consistente  
- Versión de Flutter: 3.86.6  

---

## Credenciales de prueba

FakeStore API utiliza username en lugar de correo electrónico.

```txt
Username: mor_2314
Password: 83r5^_
