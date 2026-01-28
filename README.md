# Workout App 🏋️‍♂️

Aplicación móvil desarrollada en **Flutter** para el control personalizado de entrenamientos diarios. Permite gestionar rutinas de 3 días, visualizar la técnica mediante imágenes y persistir las marcas personales (pesos y repeticiones) de forma local.

## ✨ Características

- **Gestión de 3 Días de Entrenamiento:** Rutinas predefinidas cargadas dinámicamente.
- **Persistencia de Datos:** Uso de `Shared Preferences` para guardar tus marcas automáticamente.
- **Interfaz Visual:** Tarjetas detalladas con imágenes de alta calidad para cada ejercicio.
- **Edición en Tiempo Real:** Modifica tus repeticiones y pesos mientras entrenas.
- **Arquitectura Limpia (Clean Architecture):** Separación clara entre datos, lógica de negocio y presentación.
- **Gestión de Estado:** Implementado con `Provider`.

## 🏗️ Arquitectura y Estructura

El proyecto sigue una estructura organizada para facilitar su mantenimiento:

```text
lib/
├── domain/       # Modelos de datos (Entidades)
├── providers/    # Lógica de negocio y gestión de estado
├── presentation/ # Capa de UI (Screens)
├── widgets/      # Widgets
└── assets/       # Imágenes y configuración JSON

```

## 🛠️ Tecnologías Utilizadas

- **Flutter & Dart
- **Provider: Para la gestión de estado reactiva.
- **Shared Preferences: Para el almacenamiento local de datos.
- **JSON: Como fuente de datos estática para la estructura de la rutina.

## 📝 Notas de Versión

- **v1.0.0:**
- **Implementación de 3 días de entrenamiento.**
- **Carga de datos mediante archivo JSON.**
- **Almacenamiento persistente de pesos y repeticiones.**
- **UI optimizada con imágenes grandes.**
