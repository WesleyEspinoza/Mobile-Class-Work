import UIKit

// Function called after some processing
func flyAway(finalStage: String){
    print("\(finalStage) emerged, flying away... ")
}

// Our main function
func metamorphosis(initialStage:String, completion:(String) -> Void){
    print("Caterpillar creates cocoon.")
    // They stay inside for up to 21 days.
    for _ in 1...21 {
        sleep(1)
        print("\(initialStage) inside cocoon")
    }
    completion("🦋")// completion -> flyAway(value: Int) -> Void
}


// Call metamorphosis to turn the caterpillar into a butterfly and let it fly once it happens
//fixing
metamorphosis(initialStage: "🐛") { string in
    print(string)
}
