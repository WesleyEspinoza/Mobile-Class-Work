import Foundation

let semaphore = DispatchSemaphore(value: 1)
DispatchQueue.global().async {
    print("Person 1 - wait")
    semaphore.wait()
    print("Person 1 - wait finished")
    sleep(1) // Person 1 playing with Switch
    print("Person 1 - done with Switch")
    semaphore.signal()
}
DispatchQueue.global().async {
    print("Person 2 - wait")
    semaphore.wait()
    print("Person 2 - wait finished")
    sleep(1) // Person 2 playing with Switch
    print("Person 2 - done with Switch")
    semaphore.signal()
}

func downloadMovies(numberOfMovies: Int) {
    
    // Create a semaphore
    
    // Launch 8 tasks
    // Each task should wait (pretend downloading takes 2 seconds) and inform the console once it's done.
    // Run the tasks on a background thread.
    // Let the semaphore know when you release the resource
    
}

downloadMovies(numberOfMovies:2)
