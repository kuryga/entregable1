import Foundation

public class Inscripcion {
  private var alumnoAInscribir: Alumno 
  private var inscribirAlCurso: Curso
  private var fechaDeInscripcion: Date 
  private var modoPago: String?

  public init(alumno: Alumno, curso: Curso, modoDePago: String?) {
    self.alumnoAInscribir = alumno 
    self.inscribirAlCurso = curso
    self.modoPago = modoDePago
    self.fechaDeInscripcion = Date()
  }
  
}