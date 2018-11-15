import Foundation

public class ProfesorAdjunto: Profesor {
    private var hrsDeConsulta: Int
    
    public init(nombreProf: String, apellidoProf: String, antiguedadProf: Int,  codigoProf: Int, hrsDeConsulta: Int) {
        self.hrsDeConsulta = hrsDeConsulta
        super.init(nombreProf: nombreProf, apellidoProf: apellidoProf, antiguedadProf: antiguedadProf,  codigoProf: codigoProf)
    }
}
