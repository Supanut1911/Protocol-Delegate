////create protocol
//protocol Canfly {
//    func fly()
//}
//
//
//class Bird {
//    var isFemale = true
//
//    func layEgg() {
//        if isFemale {
//            print("can lay egg")
//        }
//    }
//}
//
//class Engale: Bird, Canfly {
//    func fly() {
//        print("engale can fly")
//    }
//}
//
//class Penguin: Bird {
//    func swim() {
//        print("penguin can swim")
//    }
//}
//
//struct Airplane: Canfly {
//    func fly() {
//        print("airplane can fly")
//    }
//    }
//
//struct FlyingMeseum {
//    func flyingDemo(flyingObj: Canfly) {
//        flyingObj.fly()
//    }
//}
//
//let myplane = Airplane()
//let mypenguin = Penguin()
//
//let meseu = FlyingMeseum()
//
//mypenguin.swim()
//meseu.flyingDemo(flyingObj: myplane)


//MARK:- Example Protocols and Delegates
//emergencyCallHandler -> access to pager(delegate: to report  arrrest)

//advanceLiftSupport protocol will adpot to person whos know "perform CPR"

//Pete: paramedic carry the pager
//Dotor:
//Surgeon:

//Event -> EmergencyHandler call to pager -> whos every carry pager must go here and go perform CPR


protocol AdvancLiftSupport{
    func performCPR()
}

class EmergencyCallHanlder {
    var delegate: AdvancLiftSupport?
    
    func assessSituation() {
        print("Can you tell me what happen?")
    }
    
    func medicalEmergency() {
        delegate?.performCPR()
    }
}

struct paramedic: AdvancLiftSupport {
    
    init(handler: EmergencyCallHanlder) {
        //เป็นตัวเชื่อมต่อกับ EmergencyHanlder / บอกว่าถูกเรียกจาก emergency ไหน
        handler.delegate = self
    }
    
    func performCPR() {
        print("The paramedic does chest compression, 30 per sec")
    }
}

class Doctor: AdvancLiftSupport {
    
    init(hanlder: EmergencyCallHanlder) {
        hanlder.delegate = self
    }
    
    func performCPR() {
        print("The Doctor does chest compression, 30 per sec")
    }
    
    func useStathescope() {
        print("Listening for heart sound")
    }
    
}

class Surgeon: Doctor {
    override func performCPR() {
        super.performCPR()
        print("Sing stayinh alive by the BeeGees")
    }
    
    func useElectricDrill() {
        print("Whirr...")
    }
}


let emilio = EmergencyCallHanlder()     //เหมือน emilo เป็น overseer
//let pete = paramedic(handler: emilio)   // pete จะรับงานที่โดนสั่งจาก emilio ผ่านทาง hanlder.delegate

//let romio = Doctor(hanlder: emilio)

let rio = Surgeon(hanlder: emilio)


emilio.assessSituation()
emilio.medicalEmergency()


