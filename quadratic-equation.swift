import Foundation

struct QEData {
    public private(set) var a: Float
    public private(set) var b: Float
    public private(set) var c: Float

    init(a: Float, b: Float, c: Float){
        self.a = a
        self.b = b
        self.c = c
    }
}

func inputParse(input: String) -> QEData {
    var splitedInput: [String] = input.components(separatedBy: " ")

    let aRange = splitedInput[0].index(splitedInput[0].endIndex, offsetBy: -3)..<splitedInput[0].endIndex
    splitedInput[0].removeSubrange(aRange)

    let a = splitedInput[0].isEmpty ? "1" : splitedInput[0]

    splitedInput[2].remove(at: splitedInput[2].index(before: splitedInput[2].endIndex))

    let b = splitedInput[1] + (splitedInput[2].isEmpty ? "1" : splitedInput[2])

    let c = splitedInput[3] + (splitedInput[4].isEmpty ? "1" : splitedInput[4])

    return QEData(a: a.floatValue, b: b.floatValue, c: c.floatValue)
} 

func getAnswer(qeData: QEData, d: Float) {
    switch d {
        case 0:
            print("Answer: x = \(-1 * qeData.b / 2 * qeData.a)")
            break;
        case 1...:
            print("Answer: x1 = \( (-qeData.b + sqrt(d)) / (2 * qeData.a) ) x2 = \( (-qeData.b - sqrt(d)) / (2 * qeData.a) )")
            break
        default:
            print("D must be grater then 0")
            break
    }
}

print("Input quadratic equation:")

let input = "3x^2 - 14x - 5 = 0"

let qeData = inputParse(input: input)
let d = pow(qeData.b, 2) - 4 * qeData.a * qeData.c

print("a: \(qeData.a) b: \(qeData.b) c: \(qeData.c) d: \(d)")

getAnswer(qeData: qeData, d: d)

