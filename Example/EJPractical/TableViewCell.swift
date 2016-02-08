
import UIKit
import EJPractical

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var textFieldValue: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        textFieldValue.inputAccessoryView = UtilKeyBoard.viewBotoesDeDeControleComConfirmacaoNoTarget(self, metodoAcaoConfirmacao: "keyBoardConfirm", tituloConfirmacao: "Confirmar", targetCancelar: self, metodoAcaoCancelar: "keyBoardCancel", tituloCancelar: "Cancelar", targetEsconderTeclado: self, metodoEsconderTeclado: "turnOffField", corBotao1: "#E92B2A", corBotao2: "#731705", corTextoBotao1Normal: "#63C5F0", corTextoBotao1Highlighted: "#8E8E93", corTextoBotao2Normal: "#FFFFFF", corTextoBotao2Highlighted: "#FFFFFF")
    }
    
    func keyBoardConfirm() {
        
        turnOffField()
    }
    
    func keyBoardCancel() {
        
        turnOffField()
        
    }
    
    func turnOffField() {
        
        textFieldValue?.resignFirstResponder()
    }
    
}
