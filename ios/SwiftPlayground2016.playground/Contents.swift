//: Playground - noun: a place where people can play

// Se pueden importar frameworks (bibliotecas)
import UIKit
//import Foundation

var str = "Hello, playground"

// No es necesario declarar el tipo de valor que va a contener la variable
var myVariable = 42
myVariable = 50
// let se usa para declarar un constante
let myConstant = 42
let implicitInteger = 70
let implicitDouble = 70.0

// Los tipos de datos primitivos son Double, Float, Int, String
let explicitDouble: Double = 70
let label = "The width is "
let width = 94
let widthLabel1 = label + String(width)

// En caso de que swift tenga que inferir un flotante, siempre elegirá Double (en vez de Float)
let pi = 3.14159

// Podemos utilizar \() para referirnos al valor contenido en una variable o constante
let widthLabel2 = "\(label) \(width)"

let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

//Conversión entre enteros y punto flotante
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi2 = Double(three) + pointOneFourOneFiveNine
// pi2 es de tipo Duoble

let integerPi = Int(pi2)

//Se crea un alias para la clase UInt64
typealias AudioSample = UInt64

var maxAmplitudeFound = AudioSample.max

//booleanos

let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnips are horrible.")
}


// Soporta tuplas
let (x, y) = (1, 2)
print("X is \(x)")
print("Y is \(y)")

let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

//también se puede crear un tupla así
let http200Status = (statusCode: 200, description: "OK")

// Se usan [] para declarar arreglos y diccionarios
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1] = "bottle of water"

var occupations = [
    "Malcolm": "Captain",
    "Kaylee": "Mechanic",
]

occupations["Jayne"] = "Public Relations"
print(occupations["Jayne"])

// Para declarar arreglos vacíos
let emptyArray = [String]()
// Para declarar diccionarios vacíos
let emptyDictionary = [String: Float]()

// Si no se sabe de antemano el tipo de dato que van a contener
shoppingList = []
occupations = [:]


let individualScores = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScores {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)

var optionalString: String? = "Hello"
print(optionalString == nil)

// El signo ? se llama optional y es una muy buena forma de asegurarse que las variables tengan valores nulos solo cuando el programador lo desee
var optionalName: String? = "John Appleseed"
var greeting = "Hello!"

optionalName = nil

if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Good Bye"
}

// Ejemplos de uso del operador ??
let defaultColorName = "red"
var userDefinedColorName: String?   // defaults to nil
var colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is nil, so colorNameToUse is set to the default of "red"

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
// userDefinedColorName is not nil, so colorNameToUse is set to "green"

var surveyAnswer: String?
print(surveyAnswer)


if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

let vegetable = "red pepper"
switch vegetable {
case "celery":
    let vegetableComment = "Add some raisins and make ants on a log."
case "cucumber", "watercress":
    let vegetableComment = "That would make a good tea sandwich."
case let x where x.hasSuffix("pepper"):
    let vegetableComment = "Is it a spicy \(x)?"
default:
    let vegetableComment = "Everything tastes good in soup."
    // Buena prueba sería eliminar la clausula default
}

// Este es un diccionario que cada elemento tiene un arreglo de enteros
let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
for (kind, numbers) in interestingNumbers {
    print(kind)
    for number in numbers {
        print(number)
        if number > largest {
            largest = number
        }
    }
}
print(largest)

var n = 2
while n < 100 {
    n = n * 2
}
print(n)

// En la última versión de Swift se cambió do-while por repeat-while
var m = 2
repeat {
    m = m * 2
} while m < 100
print(m)

var firstForLoop = 0
// En swift 3 se eliminó el ciclo for al estilo C
//for var i = 0; i < 4; ++i {
for i in 0..<4 {
    print(i)
    firstForLoop += i
}
print(firstForLoop)

firstForLoop = 0
for i in 0...6 {
    print(i)
    firstForLoop += i
}
print(firstForLoop)

func greet(person: String) {
    print("Hello, \(person)!")
}
greet(person: "Dave")

func greet(name: String, day: String) -> String {
    return "Hello \(name), today is \(day)."
    //return 0
}
greet(name: "Bob", day: "Tuesday")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0
    
    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}
let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
print(statistics.0)
print(statistics.1)
print(statistics.2)

// Función que permite devolver nil si es intenta calcular el factorial de un número negativo
func factorial(number: Int) -> Int? { // Prueba quitando el signo ?
    if (number < 0) {
        return nil
    }
    var result = 1
    for factor in 1...number {
        result = result * factor
    }
    return result
}
factorial(number: 3)
factorial(number: -3)

// Esto va a tirar un error ya que el compilador ha detectado que la función factorial puede devolver dos tipos distintos de valores (un número o nulo)
//factorial(3) + 7
// Para que funcione debemos utilizar ! (implicitly unwrapped optional), "Sé que este opcional (?) posee un valor, por favor utilízalo"
factorial(number: 3)! + 7
//factorial(number: -3)! + 7 // Esto tiraría un error al compilar

func sumOf(numbers: Int...) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}
sumOf()
sumOf(numbers: 42, 597, 12)

// Las funciones pueden ser anidadas y pueden acceder a las variables que pertenecen a la función padre
func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
returnFifteen()

// Las funciones pueden retornar otras funciones
func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
increment(7)

// Las funciones pueden recibir otras funciones como argunmento
func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTen)

// Argument Label: se utiliza cuando uno llama a la función
// Parameter Name: se utiliza cuando se declara una función
// Por defecto se utiliza el parameter name como argument label, cuando no se especifica el argument label
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)!  Glad you could visit from \(hometown)."
}
// En la función anterior "from" es argument label y "hometown" es parameter name
print(greet(person: "Bill", from: "Cupertino"))

// Si se desea omitir el argument label para un parameter, se debe utilizar "_" en vez del nombre del argument label
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // No hace nada
}
someFunction(1, secondParameterName: 2)

// Se pueden utilizar trozos de código como funciones sin declarar el nombre de la función
// El método map ejecuta una vez el trozo de código encerrado en {} para cada elemento del arreglo
let mappedNumbers1 = numbers.map({
    (number: Int) -> Int in
    let result = 3 * number
    return result
})
print(mappedNumbers1)

// Igual a lo anterior pero más simple de escribir y entender
let mappedNumbers2 = numbers.map({ number in 3 * number })
print(mappedNumbers2)

// función sorted permite ordenar elementos y también soporta {}
let sortedNumbers1 = numbers.sorted(by: { $0 > $1 })
print(sortedNumbers1)

// Esto se llama closures!

class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}
var shape = Shape()
shape.numberOfSides = 7
var shapeDescription1 = shape.simpleDescription()

class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    
    // Un inicializador es equivalente en Java a un constructor
    init(name: String) {
        // self es similiar a this de Java
        self.name = name
    }
    
    // También se puede utilizar deinit para realizar alguna limpiesa antes de que el objeto sea eliminado de la memoria
    
    func simpleDescription() -> String {
        return "A shape named \(name) with \(numberOfSides) sides."
    }
}
// Fijarse que hay que indicar el nombre del argumento a inicializar
var namedShape = NamedShape(name: "Shape")
namedShape.numberOfSides = 7
var shapeDescription2 = namedShape.simpleDescription()


// Para la herencia, en vez de usar la palabra extends como en Java se utilizan los :
// Una clase hija sólo puede tener un padre
class Square: NamedShape {
    var sideLength: Double
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        // Llamamos al constructor de la clase padre
        super.init(name: name)
        // Le asignamos un valor una variable de la clase padre
        numberOfSides = 4
    }
    
    func area() ->  Double {
        return sideLength * sideLength
    }
    
    // Sobreescribimos una función heredada de la clase padre
    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
// let test = Square(name: "my test square", sideLength: 5.2)
test.area()
test.simpleDescription()

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0
    
    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }
    
    // De esta forma se pueden crear getters y setters
    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            // el nuevo valor tiene un nombre implícito newValue
            sideLength = newValue / 3.0
        }
    }
    
    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
triangle.perimeter = 9.9
print(triangle.sideLength)

// Con willSet y didSet podemos ejecutar código que corra antes y después de que se le asigne un nuevo valor a una variable
class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLength: 50, name: "larger square") // Asignamos un nuevo objeto a square
print(triangleAndSquare.triangle.sideLength) // Automáticamente cambia la variable sideLength del triángulo

// ?
let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength

enum Rank: Int {
    case Ace = 1
    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten
    case Jack, Queen, King
    func simpleDescription() -> String {
        switch self {
        case .Ace:
            return "ace"
        case .Jack:
            return "jack"
        case .Queen:
            return "queen"
        case .King:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.Jack
let aceRawValue = ace.rawValue
let aceStringValue = ace.simpleDescription()

if let convertedRank = Rank(rawValue: 11) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Diamonds:
            return "diamonds"
        case .Clubs:
            return "clubs"
        }
    }
    
    func color() -> String {
        switch self {
        case .Spades:
            return "black"
        case .Clubs:
            return "black"
        case .Hearts:
            return "red"
        case .Diamonds:
            return "red"
            
        }
    }
}
let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()

// Las estructuras son similares a las clases, possen métodos y inicializadores, una gran diferencia es que las estructuras siempre son copiadas y las clases se manejan con referencias
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .Three, suit: .Spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


// Ejemplo de una respuesta desde el servidor, se le pregunta por la hora de salida y puesta de sol
enum ServerResponse {
    case Result(String, String)
    case Error(String)
}

//let success = ServerResponse.Result("6:00 am", "8:09 pm")
let success = ServerResponse.Error("Out of cheese.")

switch success {
case let .Result(sunrise, sunset):
    let serverResponse = "Sunrise is at \(sunrise) and sunset is at \(sunset)."
case let .Error(error):
    let serverResponse = "Failure...  \(error)"
}

// Genericos: permiten la especificación y utilización tardía de los tipos de datos en funciones y clases
/*func repeat<Item>(item: Item, times: Int) -> [Item] {
    var result = [Item]()
    for i in 0..<times {
        result.append(item)
    }
    return result
}
repeat("know", 4)*/

// Protocolo es una lista de métodos que especifícan un "contrato" o "interface"
protocol Speaker {
    func speak()
}

// Todas las clases que se ajustan a este protocolo tienen que implementar los métodos que se definieron en él
class Vicki: Speaker {
    func speak() {
        print("Hello, I am Vicki!")
    }
}

class Ray: Speaker {
    func speak() {
        print("Yo, I am Ray!")
    }
}
var ray = Ray()
ray.speak()


// En este ejemplo la clase Dog hereda de la clase Animal
// Una clase hereda hija sólo herada de una clase padre, pero puede ajustarse a varios protocolos
// Primero se debe especificar la clase padre y luego los protocolos separados por coma
class Animal {
}
class Dog: Animal, Speaker {
    func speak() {
        print("Woof!")
    }
}
var dog = Dog()
dog.speak()



