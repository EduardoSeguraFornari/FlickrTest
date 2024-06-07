import Foundation

extension String {
    func extractDimensions() -> CGSize {
        // Regular expression pattern to match img tag with width and height attributes
        let pattern = "width=\"(\\d+)\" height=\"(\\d+)\""
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return .zero
        }
        // Search for the first match in the input string
        if let match = regex.firstMatch(in: self, options: [], range: NSRange(self.startIndex..., in: self)) {
            if let widthRange = Range(match.range(at: 1), in: self),
               let heightRange = Range(match.range(at: 2), in: self) {
                let widthString = String(self[widthRange])
                let heightString = String(self[heightRange])
                let width = Double(widthString) ?? 0
                let height = Double(heightString) ?? 0
                return CGSize(width: CGFloat(width), height: CGFloat(height))
            }
        }
        // Return default values if no match is found
        return .zero
    }

    func extractAuthor() -> String {
        // Regular expression pattern to match content within parentheses
        let pattern = "\\(([^)]+)\\)"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return ""
        }
        // Search for the first match in the string
        if let match = regex.firstMatch(in: self, options: [], range: NSRange(self.startIndex..., in: self)) {
            if let range = Range(match.range(at: 1), in: self) {
                let value = String(self[range])
                return value
            }
        }
        // Return empty string if no match is found
        return ""
    }

    func extractDescription() -> String {
        // Regular expression pattern to match content within <p> tags that contains text only
        let pattern = "<p>(.*?)<\\/p>"
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .dotMatchesLineSeparators) else {
            return ""
        }
        // Search for matches in the string
        let matches = regex.matches(in: self, options: [], range: NSRange(self.startIndex..., in: self))
        // Extract the text content from the matches and concatenate them
        let extractedText = matches.map { match -> String in
            if let range = Range(match.range(at: 1), in: self) {
                let content = String(self[range])
                // Remove any remaining HTML tags within the content
                let cleanContent = content.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
                return cleanContent.trimmingCharacters(in: .whitespacesAndNewlines)
            }
            // Return empty string if no match is found
            return ""
        }.joined(separator: " ")
        return extractedText
    }

    func date(
        with format: String = "dd/MM/yyyy"
    ) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        if let date = formatter.date(from: self) {
            return date
        }
        formatter.calendar = Calendar(identifier: .iso8601)
        return formatter.date(from: self)
    }
}
