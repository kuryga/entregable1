import Foundation

public class Curso {
    private var nombreCurso: String
    private var codigoCurso: Int
    private var profTitular: ProfesorTitular? = nil
    private var profAdjunto: ProfesorAdjunto? = nil
    private var alumnosInscritos: [Alumno] = []
    private var cupoMax: Int
    private var guiasAUtilizar: [Guia] = []

    public init(nombreCurso: String, codigoCurso: Int, cupoMaximo: Int) {
        self.nombreCurso = nombreCurso
        self.codigoCurso = codigoCurso
        self.cupoMax = cupoMaximo
    }
    
    public func getNombreCurso() -> String {
        return nombreCurso
    }
    
    public func getCodigoCurso() -> Int {
        return codigoCurso
    }
    public func agregarAlumno(unAlumno: Alumno) -> Bool {
      if alumnosInscritos.count < cupoMax {
        alumnosInscritos.append(unAlumno)
        return true
      } else{
        return false
      }
    }
    public func eliminarAlumno(unAlumno: Alumno) -> Void {
        var alumnoBuscado: Int? = nil
        for x in 0..<alumnosInscritos.count {
            let elAlumno = alumnosInscritos[x]
            if elAlumno.getCodigoAlumno() == unAlumno.getCodigoAlumno(){
                alumnoBuscado = x
                break 
                }
        }
        if let elValor = alumnoBuscado {
            alumnosInscritos.remove(at: elValor)
        }
    }
    public func asignarProfesores(unTitular: ProfesorTitular, unAdjunto: ProfesorAdjunto) -> Void {
  profTitular = unTitular
  profAdjunto = unAdjunto
    }

    public func agregarGuia(codigoGuia: Int, paginas: Int, costo: Double, titulo: String) -> Void {
    let laGuia = Guia(codigoGuia: codigoGuia, paginas: paginas, costo: costo, titulo: titulo)
    guiasAUtilizar.append(laGuia)
  }

  public func quitarGuia(codigoGuia: Int) {
    var guiaBuscada: Int? = nil
        for x in 0..<guiasAUtilizar.count {
            let laGuia = guiasAUtilizar[x]
            if codigoGuia == laGuia.getCodigoGuia(){
                guiaBuscada = x
                break 
                }
        }
        if let elValor = guiaBuscada {
            guiasAUtilizar.remove(at: elValor)
        } else {
          print("la guia buscada no existe")
        }
    }

}



