
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
        
        textFieldValue.inputAccessoryView = UtilKeyBoard.viewBotoesDeDeControleComConfirmacaoNoTarget(self, metodoAcaoConfirmacao: "keyBoardConfirm", tituloConfirmacao: "Cancelar", targetCancelar: self, metodoAcaoCancelar: "keyBoardCancel", tituloCancelar: "Confirmar", targetEsconderTeclado: self, metodoEsconderTeclado: "turnOffField", corBotao1Ativado: "#E92B2A", corBotao1Desativado: "#731705", corBotao2Ativado: "#63C5F0", corBotao2Desativado: "#8E8E93", corTextoBotao1: "#FFFFFF", corTextoBotao2: "#FFFFFF")
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
