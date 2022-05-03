// MARK: - 1
func quantify(closure: () -> Void) {
    print("func quantify")
    for i in 1...10 {
        print(i)
    }
    closure()
}

quantify {
    print("It's a closure.")
}

// MARK: - 2
let myString = "jbk23kies#@fgtg#"
let myArray = Array(myString)

let setOfvolwes = Set(["a","e","i","o","u","y"])
let setOfconsonants = Set(["b", "c", "d", "f", "g", "h","j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "z"])
let arrayOfnumbers = Set(["0","1","2","3","4","5","6","7","8","9"])

func priorityCharacter(character: Character) -> Int{
    let lowerLetter = String(character).lowercased()
    switch lowerLetter {
    case let letter where setOfvolwes.contains(letter):
        return 4
    case let letter where setOfconsonants.contains(letter):
        return 3
    case let letter where arrayOfnumbers.contains(letter):
        return 2
    case " ":
        return 1
    default:
        return 0
    }
}

let sortedArray = myString.sorted {
    let char1LowerCased = String($0).lowercased()
    let char2LowerCased = String($1).lowercased()

    let priority1 = priorityCharacter(character: $0)
    let priority2 = priorityCharacter(character: $1)
    if priority1 == priority2 {
        return char1LowerCased == char2LowerCased ? $0 < $1 : char1LowerCased < char2LowerCased
    } else {
        return priority1 > priority2
    }
}

print(String(sortedArray))


// MARK: - 3
extension Character {
    func isVowel() -> Bool {
        let arrayOfvolwes: [Character] = Array("aeiouyAEIOUY")
        return arrayOfvolwes.contains(self)
    }
}
let char1: Character = "a"
char1.isVowel()
let char2: Character = "l"
char2.isVowel()

// MARK: - 4
struct Workout {
    let distance: Int
    let time: Int
    let averageHR: Int
    
    func harderWorkout() -> Workout {
        Workout(distance: distance*2, time: time*2, averageHR: averageHR+30)
    }
}

extension Workout: CustomStringConvertible {
    var description: String {
        "Your distance = \(distance), time = \(time) and averageHR = \(averageHR)"
    }
}

extension Workout {
    var speed: Double {
        Double(distance/time)
    }
}

let workout1 = Workout(distance: 10, time: 123, averageHR: 98)
print(workout1)
let workout2 = workout1.harderWorkout()
print(workout2)
