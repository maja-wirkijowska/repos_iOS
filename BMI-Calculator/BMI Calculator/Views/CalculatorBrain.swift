import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getColor() -> UIColor {
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "No advice"
    }
    
    func getBMIValue() -> String {
        let bmiString = String(format: "%.1f", bmi?.value ?? 0.0)
        // make sure bmi is not nil, access value;if bmi == nil, use bmi = 0.0
        return bmiString
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        let bmiValue = weight / pow(height, 2)
        let adviceString: String
        let newColor: UIColor
        
        if (bmiValue < 18.5) {
            adviceString = "underweight"
            newColor = #colorLiteral(red: 0, green: 0.9914394021, blue: 1, alpha: 1)
        } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
            adviceString = "normal"
            newColor = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1)
        } else {
            adviceString = "overweight"
            newColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        }
        
        bmi = BMI(value: bmiValue, advice: adviceString, color: newColor)
    }
}
