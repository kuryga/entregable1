import Foundation

public class GuiaTeorica: Guia {
    private var listaDeTemas: [String] = []
    
    public override init(codigoGuia: Int, paginas: Int, costo: Double, titulo: String) {
        super.init(codigoGuia: codigoGuia, paginas: paginas, costo: costo, titulo: titulo)
    }
    
}
