import Foundation


public class Manager {

public var alumnosACargo: [Alumno] = []
private var profesoresACargo: [Profesor] = []
private var cursosACargo: [Curso] = []
private var listaDeInscripciones: [Inscripcion] = []

public init(){
  
}
  public func altaCurso(nombreCurso: String, codigoCurso: Int, cupoMaximoDealumnos: Int) -> Void {
    let elCurso = Curso(nombreCurso: nombreCurso, codigoCurso: codigoCurso, cupoMaximo: cupoMaximoDealumnos)
    cursosACargo.append(elCurso)
  }

  public func bajaCurso(codigoCurso: Int) -> Void {
        var indexCurso: Int? = nil
        for i in 0..<cursosACargo.count {
            let elCurso = cursosACargo[i]
            if elCurso.getCodigoCurso() == codigoCurso {
                indexCurso = i
                break 
            }
        }
        
        if let elCursoQueBuscaba = indexCurso {
            cursosACargo.remove(at: elCursoQueBuscaba)
        }
  }

 public func altaProfesorAdjunto(nombre: String, apellido: String, codigoProfesor: Int, cantidadDeHoras: Int) -> Void {
    let elProfAdjunto = ProfesorAdjunto(nombreProf: nombre, apellidoProf: apellido, antiguedadProf: 0,  codigoProf: codigoProfesor, hrsDeConsulta: cantidadDeHoras)

    profesoresACargo.append(elProfAdjunto)
  }

 public func altaProfesorTitular(nombre: String, apellido: String, codigoProfesor: Int, especialidad: String) -> Void {
    let elProfTitular = ProfesorTitular(nombreProf: nombre, apellidoProf: apellido, antiguedadProf: 0,  codigoProf: codigoProfesor, especialidadDelProf: especialidad)

    profesoresACargo.append(elProfTitular)
  }

  public func bajaProfesor(codigoProfesor: Int) -> Void {
        var indexProf: Int? = nil
        for i in 0..<profesoresACargo.count {
            let elProfe = profesoresACargo[i]
            if elProfe.getCodigoProfesor() == codigoProfesor {
                indexProf = i
                break 
            }
        }
        
        if let elProfeQueBuscaba = indexProf {
            profesoresACargo.remove(at: elProfeQueBuscaba)
        }
  }

  public func altaAlumno(nombre: String, apellido: String, codigoAlumno: Int) -> Void {
    let elAlumno = Alumno(nombreAlumno: nombre, apellido: apellido, codigoAlumno: codigoAlumno, emailAlumno: nil)
    alumnosACargo.append(elAlumno)
  }

  public func  inscribirAlumno(codigoAlumno: Int, codigoCurso: Int) -> Void {
          var elAlumno: Alumno? = nil
          for i in alumnosACargo {
             if i.getCodigoAlumno() == codigoAlumno {
                elAlumno = i
                break
              }
          }

          var elCurso: Curso? = nil
          for i in cursosACargo {
             if i.getCodigoCurso() == codigoCurso {
                 elCurso = i
                 break
             }
         }
    guard let alumnoQueInscribo = elAlumno else {
      print("no se encontro registro del alumno")
      return
    }
    guard let cursoQueSeInscribe = elCurso else {
      print("no se encontro el curso solicitado")
      return
    }
     guard cursoQueSeInscribe.agregarAlumno(unAlumno: alumnoQueInscribo) == true else {
       print("el curso \(cursoQueSeInscribe.getNombreCurso()) no tiene cupos disponibles para inscribir al alumno \(alumnoQueInscribo.getNombreCompleto())")
        return
     }
     let inscripcionRealizada = Inscripcion(alumno: alumnoQueInscribo, curso: cursoQueSeInscribe, modoDePago: nil)
      listaDeInscripciones.append(inscripcionRealizada)
      print("La inscripcion del alumno \(alumnoQueInscribo.getNombreCompleto()) al curso \(cursoQueSeInscribe.getNombreCurso()) fue realizada con exito!")
  }


  public func asignarProfesoresAlCurso(codigoCurso: Int, codigoProfesorTitular: Int, codigoProfesorAdjunto: Int) -> Void {
          var elProfTitular: Profesor? = nil
          for i in profesoresACargo {
             if i.getCodigoProfesor() == codigoProfesorTitular {
                elProfTitular = i
                break
              }
          }
           var elProfAdjunto: Profesor? = nil
          for i in profesoresACargo {
             if i.getCodigoProfesor() == codigoProfesorAdjunto {
                elProfAdjunto = i
                break
              }
          }

          var elCurso: Curso? = nil
          for i in cursosACargo {
             if i.getCodigoCurso() == codigoCurso {
                 elCurso = i
                 break
             }
         }
         guard let elProfTitularQueBusco = elProfTitular as? ProfesorTitular else{
           print("no se encontraron datos del profesor TITULAR")
           return
         }
         guard let elProfAdjuntoQueBusco = elProfAdjunto as? ProfesorAdjunto else {
           print("no se encontraron datos del profesor ADJUNTO")
           return
         }
         guard let elCursoQueBusco = elCurso else {
           print("no se encontro el curso solicitado")
           return
         }
      elCursoQueBusco.asignarProfesores(unTitular: elProfTitularQueBusco, unAdjunto: elProfAdjuntoQueBusco)
 }
 
public func altaGuia(codigoCurso: Int, codigoGuia: Int, paginas: Int, costo: Double, titulo: String, aLaImpresora: Impresora) {
  var elCurso: Curso? = nil
          for i in cursosACargo {
             if i.getCodigoCurso() == codigoCurso {
                 elCurso = i
                 break
             }
          }
           guard let elCursoQueBusco = elCurso else {
           print("No se pudo agregar la guia porque el Curso solicitado NO existe")
           return
         }
         let laGuiaQueAgregue = Guia(codigoGuia: codigoGuia, paginas: paginas, costo: costo, titulo: titulo)
         elCursoQueBusco.agregarGuia(codigoGuia: codigoGuia, paginas: paginas, costo: costo, titulo: titulo)
        aLaImpresora.agregarAlDicionario(codigoGuia: codigoGuia, guia: laGuiaQueAgregue)
}

public func bajaGuia(codigoCurso: Int, codigoGuia: Int, enLaImpresora: Impresora) {
  var elCurso: Curso? = nil
          for i in cursosACargo {
             if i.getCodigoCurso() == codigoCurso {
                 elCurso = i
                 break
             }
          }
          guard let elCursoQueBusco = elCurso else {
           print("No se puede dar de baja la guia porque el Curso que busca NO existe")
           return
         } 
         elCursoQueBusco.quitarGuia(codigoGuia: codigoGuia)
         
         enLaImpresora.quitarDelDiccionario(codigoGuia: codigoGuia)

}


}
