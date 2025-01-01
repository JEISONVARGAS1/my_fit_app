import 'dart:async';
import 'package:health/health.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:my_fit_app/features/smart_watch/provider/model/smart_watch_state.dart';

part 'smart_watch_controller.g.dart';

@riverpod
class SmartWatchController extends _$SmartWatchController {

  final health = Health();

  @override
  FutureOr<SmartWatchState> build() {
    ref.onDispose(() {});
    return SmartWatchState.init();
  }

  Future<void> initPage() async {
    await requestPermissions();
    await _requestPermissions();
    await _fetchData();
  }



  Future<void> requestPermissions() async {
    PermissionStatus status = await Permission.activityRecognition.request();
    if (status.isGranted) {
      print("Permiso concedido");
    } else if (status.isDenied) {
      print("Permiso denegado");
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

    Future<void> _requestPermissions() async {
      final types = [
        HealthDataType.STEPS,
        HealthDataType.HEIGHT,
        HealthDataType.WEIGHT,
      ];

      final permissions = types.map((type) => HealthDataAccess.READ).toList();

      bool granted = await health.requestAuthorization(types, permissions: permissions);

      if (!granted) {
        print("Permisos no concedidos.");
        return;
      }

      final now = DateTime.now();
      final yesterday = now.subtract(Duration(days: 1));

      try {
        final data = await health.getHealthDataFromTypes(
          types: types,
          startTime: yesterday,
          endTime: now,
          recordingMethodsToFilter: [],
        );

        for (var entry in data) {
          print("${entry.typeString}: ${entry.value} ${entry.unit}");
        }
      } catch (e) {
        print("Error al obtener datos de salud: $e");
      }
    }

  /*/*
    try {
      bool authorized =
      await Health().requestAuthorization(state.value!.types, permissions: [
        HealthDataAccess.READ,
        HealthDataAccess.READ,
      ]);
      if (!authorized) {
        print("Permisos denegados");
        return;
      }
    } catch (e) {
      print("Permisos denegados: $e");
    }
*/
*/

  // Método para obtener los datos de salud (pasos y distancia)
  Future<void> _fetchData() async {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(Duration(days: 1));

    // Obtiene los datos de salud para el último día
    List<HealthDataPoint> healthData = await Health().getHealthDataFromTypes(
      startTime: yesterday,
      endTime: now,
      types: [
        HealthDataType.STEPS,
        HealthDataType.DISTANCE_WALKING_RUNNING,
      ],
    );

    // Muestra los datos obtenidos
    for (var data in healthData) {
      print("Data: ${data.type} - Value: ${data.value}");
    }
  }

  _setState(SmartWatchState newState) => state = AsyncValue.data(newState);
}
