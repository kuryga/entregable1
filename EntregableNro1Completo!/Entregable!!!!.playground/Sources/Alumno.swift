import Foundation

public class Alumno {
    private var nombre: String
    private var apellido: String
    private var codAlumno: Int
    private var emailAlumno: String? 
    
    public init(nombreAlumno: String, apellido: String, codigoAlumno: Int, emailAlumno: String?) {
        self.nombre = nombreAlumno
        self.apellido = apellido
        self.codAlumno = codigoAlumno
        self.emailAlumno = emailAlumno
    }
    
    public func getNombreCompleto() -> String{
      return  nombre + " " + apellido
    }
    
    public func getCodigoAlumno() -> Int{
     return codAlumno
    }
    
}

