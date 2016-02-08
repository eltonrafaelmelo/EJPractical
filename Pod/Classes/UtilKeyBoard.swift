
import UIKit

protocol UtilKeyboardDataSouce: NSObjectProtocol{
    func utilKeyboardViewThatWillBeAdjusted() -> UIView
    func utilKeiboardViewWhatIsUsedAsReferenceToCalculateAdjustmentRequired() -> UIView
}

public class UtilKeyBoard: NSObject {
    
    var deslocamentoNecessarioParaAjustarTeclado: CGPoint!
    var duracaoAnimacaoTeclado: Double!
    var espacamentoExtraEntreViewETeclado: Int!
    
    var dataSource: UtilKeyboardDataSouce?
    
    public class func viewBotoesDeDeControleComConfirmacaoNoTarget(targetConfirmacao: AnyObject, metodoAcaoConfirmacao: Selector, tituloConfirmacao: String, targetCancelar: AnyObject, metodoAcaoCancelar: Selector, tituloCancelar: String, targetEsconderTeclado: AnyObject, metodoEsconderTeclado: Selector, corBotao1: String, corBotao2: String, corTextoBotao1Normal: String, corTextoBotao1Highlighted: String, corTextoBotao2Normal: String, corTextoBotao2Highlighted: String) -> UIView{
        
        let dimensaoTela: CGRect = UIScreen.mainScreen().bounds
        
        let viewSuperior = UIView(frame: CGRectMake(0, 0, dimensaoTela.size.width, 44))
        viewSuperior.backgroundColor = UIColor.whiteColor()
        
        let botaoEsconderTeclado:UIButton = UIButton(type:UIButtonType.Custom)
        botaoEsconderTeclado.frame = CGRectMake(15, 7, 40, 30)
        botaoEsconderTeclado.backgroundColor = UtilColors.color("#8E8E93")
        botaoEsconderTeclado.setTitle("↓", forState: UIControlState.Normal)
        botaoEsconderTeclado.setTitle("↓", forState: UIControlState.Highlighted)
        botaoEsconderTeclado.setTitleColor(UtilColors.color("#FFFFFF"), forState: UIControlState.Normal)
        botaoEsconderTeclado.setTitleColor(UtilColors.color("#kkkkkk"), forState: UIControlState.Highlighted)
        botaoEsconderTeclado.addTarget(targetEsconderTeclado, action: metodoEsconderTeclado, forControlEvents: UIControlEvents.TouchUpInside)
        
        let botao1:UIButton = UIButton(type:UIButtonType.Custom)
        botao1.frame = CGRectMake(63.5, 7, 113, 30)
        botao1.addTarget(targetCancelar, action: metodoAcaoCancelar, forControlEvents: UIControlEvents.TouchUpInside)
        botao1.backgroundColor = UtilColors.color(corBotao1)
        botao1.setTitleColor(UtilColors.color(corTextoBotao1Normal), forState: UIControlState.Normal)
        botao1.setTitleColor(UtilColors.color(corTextoBotao1Highlighted), forState: UIControlState.Highlighted)

        
        botao1.setTitle(tituloCancelar, forState: UIControlState.Normal)
        botao1.setTitle(tituloCancelar, forState: UIControlState.Highlighted)
        
        let botao2:UIButton = UIButton(type:UIButtonType.Custom)
        botao2.frame = CGRectMake(188, 7, 113, 30)
        botao2.addTarget(targetConfirmacao, action: metodoAcaoConfirmacao, forControlEvents: UIControlEvents.TouchUpInside)
        botao2.backgroundColor = UtilColors.color(corBotao2)
        botao2.setTitleColor(UtilColors.color(corTextoBotao2Normal), forState: UIControlState.Normal)
        botao2.setTitleColor(UtilColors.color(corTextoBotao2Highlighted), forState: UIControlState.Highlighted)
        
        botao2.setTitle(tituloConfirmacao, forState: UIControlState.Normal)
        botao2.setTitle(tituloConfirmacao, forState: UIControlState.Highlighted)
        
        viewSuperior.addSubview(botaoEsconderTeclado)
        viewSuperior.addSubview(botao1)
        viewSuperior.addSubview(botao2)
        
        return viewSuperior

    }
    
    override init() {
        super.init()
        self.espacamentoExtraEntreViewETeclado = 10
        self.registrarEventosDeTeclado()
    }
    
    func registrarEventosDeTeclado() {
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"tecladoApareceu:" , name: UIKeyboardDidShowNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector:"tecladoDesapareceu:" , name: UIKeyboardDidHideNotification, object: nil)
    }
    
    func tecladoApareceu(notificacao: NSNotification) {
        
        self.voltarTelaAoEstadoOriginal()
        
        let info: NSDictionary! = notificacao.userInfo
        
        let dimensaoTeclado: CGSize! = info.objectForKey(UIKeyboardFrameBeginUserInfoKey)?.CGRectValue.size
        
        let dimensaoTela: CGRect! = UIScreen.mainScreen().bounds
        
        let viewReferenciaParaAjuste: UIView! = self.dataSource?.utilKeiboardViewWhatIsUsedAsReferenceToCalculateAdjustmentRequired()
        
        let posicaoRealDoTextFieldNaTela: CGRect = viewReferenciaParaAjuste.convertRect(viewReferenciaParaAjuste.bounds, toView: nil)
        
        let finalDoFrameTextFieldNoEixoY: CGFloat! = posicaoRealDoTextFieldNaTela.origin.y + posicaoRealDoTextFieldNaTela.size.height
        
        let inicioFrameTecladoNoEixoY: CGFloat! = dimensaoTela.size.height - dimensaoTeclado.height
        
        var deslocamentoNecessarioNoEixoY: CGFloat = 0
        
        if finalDoFrameTextFieldNoEixoY > inicioFrameTecladoNoEixoY{
            
            deslocamentoNecessarioNoEixoY = (finalDoFrameTextFieldNoEixoY - inicioFrameTecladoNoEixoY + 10) * -1

        }
        self.deslocamentoNecessarioParaAjustarTeclado = CGPointMake(0, deslocamentoNecessarioNoEixoY)
        
        if self.deslocamentoNecessarioParaAjustarTeclado.x != 0 || self.deslocamentoNecessarioParaAjustarTeclado.y != 0{
            
            self.duracaoAnimacaoTeclado = info.objectForKey(UIKeyboardAnimationDurationUserInfoKey)?.doubleValue
            UIView.animateWithDuration(self.duracaoAnimacaoTeclado, animations: {
                
                let viewAjustar: UIView! = self.dataSource?.utilKeyboardViewThatWillBeAdjusted()
                
                viewAjustar?.frame = CGRectMake(viewAjustar.frame.origin.x + self.deslocamentoNecessarioParaAjustarTeclado.x, viewAjustar.frame.origin.y + self.deslocamentoNecessarioParaAjustarTeclado.y, viewAjustar.frame.size.width, viewAjustar.frame.size.height)
            })
        }
        
    }
    
    func tecladoDesapareceu(notificacao: NSNotification){
        self.voltarTelaAoEstadoOriginal()
    }
    
    func voltarTelaAoEstadoOriginal(){
        
        if self.deslocamentoNecessarioParaAjustarTeclado != nil{
            if self.deslocamentoNecessarioParaAjustarTeclado.x != 0 || self.deslocamentoNecessarioParaAjustarTeclado.y != 0{
                UIView.animateWithDuration(self.duracaoAnimacaoTeclado, animations: {
                    
                    let viewAjustar: UIView! = self.dataSource?.utilKeyboardViewThatWillBeAdjusted()
                    viewAjustar?.frame = CGRectMake(viewAjustar.frame.origin.x - self.deslocamentoNecessarioParaAjustarTeclado.x, viewAjustar.frame.origin.y - self.deslocamentoNecessarioParaAjustarTeclado.y, viewAjustar.frame.size.width, viewAjustar.frame.size.height)
                })
            }
        }
 
        
        self.deslocamentoNecessarioParaAjustarTeclado = CGPointMake(0, 0)
    }
    
    
    
}
