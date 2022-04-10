import UIKit

protocol TeacherFactory {
    func getTeacher(name: String) -> Teacher
}

class EnglishTeacherFactory: TeacherFactory {
    func getTeacher(name: String) -> Teacher {
        let teacher = EnglishTeacher()
        teacher.name = name
        return teacher
    }
}

class MathTeacherFactory: TeacherFactory {
    func getTeacher(name: String) -> Teacher {
        let teacher = MathTeacher()
        teacher.name = name
        return teacher
    }
}

protocol Teacher {
    var name: String? { get }
    func addGroupp(_ group: Groupp)
    func deleteGroupp(_ group:  Groupp)
    func makeTask(_ task: String)
}

class EnglishTeacher: Teacher {
    var name: String?
    var groupes = NSMutableSet()
    func addGroupp(_ group: Groupp) {
        groupes.add(group)
    }
    
    func deleteGroupp(_ group:  Groupp) {
        groupes.remove(group)
    }
    
    func makeTask(_ task: String) {
        groupes.forEach { ($0 as! Groupp).getTask(with: "New English task:\n\(task)")
        }
    }
}

class MathTeacher: Teacher {
    var name: String?
    var groupes = NSMutableSet()
    func addGroupp(_ group: Groupp) {
        groupes.add(group)
    }
    
    func deleteGroupp(_ group:  Groupp) {
        groupes.remove(group)
    }
    
    func makeTask(_ task: String) {
        groupes.forEach { ($0 as! Groupp).getTask(with: "New Math task:\n\(task)")
        }
    }
}

protocol Groupp {
    var currentTask: String { get }
    func getTask(with task: String)
}

class JuniorGroup: NSObject, Groupp {
    var currentTask = "Empty"
    func getTask(with task: String) {
        self.currentTask = "Beginner group received \(task)\nand you should do it in an 3 hours\n"
        print(currentTask)
    }
}

class MiidleGroup: NSObject, Groupp {
    var currentTask = "Empty"
    func getTask(with task: String) {
        self.currentTask = "Middle group received \(task)\nand you should do it in an 2 hours\n"
        print(currentTask)
    }
}

class SeniorGroup: NSObject, Groupp {
    var currentTask = "Empty"
    func getTask(with task: String) {
        self.currentTask = "Senior group received \(task)\nand you should do it in an hour\n"
        print(currentTask)
    }
}


let englishTeacher = EnglishTeacherFactory().getTeacher(name: "Sara")

let juniorGroup = JuniorGroup()
let middleGroup = MiidleGroup()
let seniorGroup = SeniorGroup()

print(juniorGroup.currentTask)

englishTeacher.addGroupp(juniorGroup)
englishTeacher.addGroupp(middleGroup)
englishTeacher.addGroupp(seniorGroup)

englishTeacher.makeTask("read page 141")

let mathTeacher = MathTeacherFactory().getTeacher(name: "Jon")

mathTeacher.addGroupp(juniorGroup)
mathTeacher.addGroupp(middleGroup)
mathTeacher.addGroupp(seniorGroup)

mathTeacher.makeTask("read page 80")
