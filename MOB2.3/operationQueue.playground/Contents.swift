 import UIKit
 import PlaygroundSupport
 
 PlaygroundPage.current.needsIndefiniteExecution = true
 
 // Queue
 let operationQueue = OperationQueue()
 operationQueue.qualityOfService = .userInitiated
 
 class MyOperation: Operation {
    
    //TODO: Create main()
    override func main(){
        print("My Op Started")
    }
 }
 
 let myOp = MyOperation()
 
 
 myOp.completionBlock = {
    //TODO: print "MyOp Completed"
    print("My Op is Done")
 }
 
 
 operationQueue.addOperation(myOp)
