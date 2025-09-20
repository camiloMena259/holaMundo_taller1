# Taller 1 (StatefulWidget y setState)

## Descripcion
Aplicacion Flutter que demuestra el uso de StatefulWidget, setState() y manejo de estado para cambiar dinamicamente el título de la AppBar.

## Estudiante
- **Nombre:** Juan Camilo Mena Ceron
- **Codigo:** 230221050

## Funcionalidades
- StatefulWidget con setState()
- AppBar con título dinamico
- SnackBar al cambiar titulo
- Imagenes Network y Asset
- Container decorado
- ListView con elementos
- Diseño responsive con Column y Row

## Ejecucion
Todo se ejecuto como en las clases, primero se inicia el dispositivo desde la parte inferior derecha y posterior a esto se le da al boton de ejecion.

## Captura 1
![65147449-8e4c-4717-b5a8-9e2ac4a6345f](https://github.com/user-attachments/assets/81453979-9f52-46ff-ab0d-7c459f57eb89)

## Captura 2
![18868527-435b-4a2a-a36b-05123188bca7](https://github.com/user-attachments/assets/33d91260-de94-4318-9e70-909b4988615d)

## Captura 3
![1a749e61-acd9-411a-984e-95d00ccc4c94](https://github.com/user-attachments/assets/0c2bc394-05a4-49cc-9754-85deddc68ef9)

# Taller 2 : Navegación con go_router y ciclo de vida

## Descripción
Aplicación Flutter que demuestra:
- Navegación con `go_router` (`go`, `push`, `replace`)
- Paso de parámetros (path + query)
- Widgets: `GridView`, `TabBar` + `TabBarView`, y `ExpansionPanelList`
- Evidencia del ciclo de vida (`initState`, `didChangeDependencies`, `build`, `setState`, `dispose`) mediante `print()` en consola

## Rutas
- `/` (Home)  
- `/detail/:id` (DetailPage) — recibe `id` y query param `from`  
- `/widgets` (Widgets demo con Tabs)

## Ejecutar
1. `flutter pub get`  
2. `flutter run -d chrome` (o seleccionar un emulador/dispositivo)  
3. Ver la consola para prints del ciclo de vida

## Estructura
- `lib/main.dart` — go_router config  
- `lib/home_page.dart` — pantalla principal (GridView + botones go/push/replace)  
- `lib/detail_page.dart` — pantalla destino (muestra parámetros)  
- `lib/widgets_demo_screen.dart` — TabBar + TabBarView  
- `lib/expansion_panel_demo.dart` — tercer widget  



