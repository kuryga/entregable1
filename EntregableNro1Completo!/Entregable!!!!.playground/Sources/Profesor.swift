import Foundation

public class Profesor {
    private var nombreProfesor: String
    private var apellidoProfesor: String
    private var antiguedad: Int
    private var codProfesor: Int
    
    public init(nombreProf: String, apellidoProf: String, antiguedadProf: Int,  codigoProf: Int) {
        self.nombreProfesor = nombreProf
        self.apellidoProfesor = apellidoProf
        self.antiguedad = antiguedadProf
        self.codProfesor = codigoProf
    }
    
    public func getCodigoProfesor() -> Int {
      return codProfesor
    }
    
}


