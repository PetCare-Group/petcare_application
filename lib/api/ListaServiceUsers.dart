import 'UserService.dart';
class ListaServiceUsers{

  static List<UserService> listado(List<dynamic> listaJson){
    List<UserService> listadoUserService=[];

    if(listaJson!=null){
      for(var u in listaJson){
        final ususervice=UserService.objJson(u);
        listadoUserService.add(ususervice);
      }
    }
    return listadoUserService;

  }
}