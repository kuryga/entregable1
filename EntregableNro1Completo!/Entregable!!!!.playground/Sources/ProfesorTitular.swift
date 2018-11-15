import Foundation

public class ProfesorTitular: Profesor {
    private var especialidad: String
    
    public init(nombreProf: String, apellidoProf: String, antiguedadProf: Int,  codigoProf: Int, especialidadDelProf: String) {
    self.especialidad = especialidadDelProf
    super.init(nombreProf: nombreProf, apellidoProf: apellidoProf, antiguedadProf: antiguedadProf,  codigoProf: codigoProf)
    }
}

