import Foundation

extension Date {
    func string(
        with format: String = "dd/MM/yyyy"
    ) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
