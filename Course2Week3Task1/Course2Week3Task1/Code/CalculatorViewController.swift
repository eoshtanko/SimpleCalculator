import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resultField: UILabel!
    
    
    @IBOutlet weak var firstOperandTitle: UILabel!
    @IBOutlet weak var firstOperand: UILabel!
    
    @IBOutlet weak var secondOperandTitle: UILabel!
    @IBOutlet weak var secondOperand: UILabel!
    
    @IBOutlet weak var firstOperandStepperValue: UIStepper!
    @IBAction func firstOperandStepperValueChanged(_ sender: Any) {
        firstOperand.text = String(format: "%.4f", firstOperandStepperValue.value)
    }
    
    @IBOutlet weak var secondOperandSliderValue: UISlider!
    @IBAction func secondOperandSliderValueChanged(_ sender: Any) {
        secondOperand.text = String(format: "%.4f", secondOperandSliderValue.value)
    }
    
    @IBOutlet weak var calculateButton: UIButton!
    @IBAction func calculateButtonPressed(_ sender: Any) {
        var result = Double(firstOperand.text!)! * Double(secondOperand.text!)!
        result = (result * 10000).rounded() / 10000
        resultField.text = String(result)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension CalculatorViewController {
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resultFieldViewSettings()
        firstOperandTitleViewSettings()
        firstOperandStepperViewSettings()
        firstOperandViewSettings()
        secondOperandTitleViewSettings()
        secondOperandSliderViewSettings()
        secondOperandViewSettings()
        calculateButtonViewSettings()
    }
    
    func resultFieldViewSettings() {
        let size = CGSize(width: view.bounds.width - Const.rightLeftAndBottomOffset * 2,
                          height: Const.heightOfButtonAndAnswerField)
        resultField.frame = CGRect(x: Const.rightLeftAndBottomOffset,
                                   y: Const.topOffset,
                                   width: size.width,
                                   height: size.height)
    }
    
    func firstOperandTitleViewSettings() {
        firstOperandTitle.frame.origin = CGPoint(x: Const.rightLeftAndBottomOffset,
                                                 y: Const.operandLablesTopOffset + resultField.frame.maxY)
    }
    
    func firstOperandStepperViewSettings() {
        firstOperandStepperValue.stepValue = 0.5
        firstOperandStepperValue.frame.origin = CGPoint(
            x: view.bounds.width - Const.rightLeftAndBottomOffset - firstOperandStepperValue.frame.width,
            y: Const.stepperAndSliderTopOffset + firstOperandTitle.frame.maxY)
    }
    
    func firstOperandViewSettings() {
        firstOperand.frame.origin = CGPoint(x: Const.rightLeftAndBottomOffset,
                                            y: firstOperandStepperValue.frame.midY - firstOperand.frame.height/2)
    }
    
    func secondOperandTitleViewSettings() {
        secondOperandTitle.frame.origin = CGPoint(x: Const.rightLeftAndBottomOffset,
                                                  y: Const.operandLablesTopOffset + firstOperandStepperValue.frame.maxY)
    }
    
    func secondOperandSliderViewSettings() {
        secondOperandSliderValue.frame.origin = CGPoint(x: view.bounds.width - Const.rightLeftAndBottomOffset - secondOperandSliderValue.frame.width,
                                                        y: Const.stepperAndSliderTopOffset +  secondOperandTitle.frame.maxY)
    }
    
    func secondOperandViewSettings() {
        secondOperand.frame.origin = CGPoint(x: Const.rightLeftAndBottomOffset,
                                             y: secondOperandSliderValue.frame.midY - secondOperand.frame.height / 2)
    }
    
    func calculateButtonViewSettings() {
        let size = CGSize(width: view.bounds.width - Const.rightLeftAndBottomOffset * 2,
                          height: Const.heightOfButtonAndAnswerField)
        calculateButton.frame = CGRect(x: Const.rightLeftAndBottomOffset,
                                       y: view.bounds.height - Const.rightLeftAndBottomOffset - size.height,
                                       width: size.width,
                                       height: size.height)
    }
}

extension CalculatorViewController {
    private enum Const {
        static let rightLeftAndBottomOffset: CGFloat = 16
        static let topOffset: CGFloat = 32
        static let heightOfButtonAndAnswerField: CGFloat = 60
        static let operandLablesTopOffset: CGFloat = 32
        static let stepperAndSliderTopOffset: CGFloat = 16
    }
}

