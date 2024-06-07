//
//  String+Extensions.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import Foundation

extension String {
    func date(
        with format: String = "dd/MM/yyyy"
    ) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.date(from: self)
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
                return value.replacingOccurrences(of: "\"", with: "")
            }
        }
        // Return empty string if no match is found
        return ""
    }

    func extractDescription() -> String {
        var result = replaceEscapedSlashes()
        result = result.removeHrefs()
        result = result.removeImgTags()
        result = result.removeATagsWithTitle()
//        result = result.removeRelFromATags()

        result = result.removeFirstPTag()
        result = result.removeATagMarks()
        result = result.removePTagMarks()
        result = result.replaceBrWithNewline()
        result = result.removeMultiple(char: " ")
        result = result.trimmingCharacters(in: .whitespacesAndNewlines)
        result = result.removeSpacesAroundNewlines()

        return result
    }

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

    func removeHrefs() -> String {
        // Regular expression to match href="..."
        let pattern = #"href="[^"]*""#
        return self.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }

    func removeImgTags() -> String {
        // Regular expression to match <img ... />
        let pattern = #"<img\b[^>]*\/?>"#
        return self.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }

    func removeATagMarks() -> String {
        var result = replacingOccurrences(of: "</a>", with: "")
        result = result.replacingOccurrences(of: "<a>", with: "")
        result = result.replacingOccurrences(of: "<a >", with: "")
        return result
    }

    func removeATagsWithTitle() -> String {
        // Regular expression to match <a ... title="..." ...>...</a>
        let pattern = #"<a\b[^>]*\btitle="[^"]*"[^>]*>.*?<\/a>"#
        return self.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }

    func removeFirstPTag() -> String {
        // Define the regular expression pattern to match the first <p> tag
        let pattern = "<p>(.*?)</p>"
        // Create a regular expression object
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .dotMatchesLineSeparators) else {
            return self // Return the original string if there's an issue with the regular expression
        }
        // Find the first match of <p> tag in the string
        if let match = regex.firstMatch(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count)) {
            // Remove the first <p> tag from the string
            let modifiedString = regex.stringByReplacingMatches(in: self, options: [], range: match.range, withTemplate: "")
            return modifiedString
        }
        return self // Return the original string if no <p> tag is found
    }

    func removeMultiple(char: Character) -> String {
        // Define the regular expression pattern to match multiple spaces
        let pattern = "\(char){2,}"
        // Create a regular expression object
        guard let regex = try? NSRegularExpression(pattern: pattern, options: []) else {
            return self // Return the original string if there's an issue with the regular expression
        }
        // Replace all occurrences of multiple spaces with a single space
        let modifiedString = regex.stringByReplacingMatches(
            in: self, options: [], range: NSRange(location: 0, length: self.utf16.count), withTemplate: "\(char)"
        )
        return modifiedString
    }

    func removePTagMarks() -> String {
        var result = replacingOccurrences(of: "</p>", with: "")
        result = result.replacingOccurrences(of: "<p>", with: "")
        result = result.replacingOccurrences(of: "<p >", with: "")
        return result
    }

    func removeRelFromATags() -> String {
        // Regular expression to match rel="..."
        let pattern = #"\srel="[^"]*""#
        return self.replacingOccurrences(of: pattern, with: "", options: .regularExpression)
    }

    func removeSpacesAroundNewlines() -> String {
        // Regular expression to match spaces around newlines
        let pattern = #"\s*(\r?\n)\s*"#
        return self.replacingOccurrences(of: pattern, with: "$1", options: .regularExpression)
    }

    func replaceBrWithNewline() -> String {
        // Define the regular expression pattern to match <br /> tags
        let pattern = "<br\\s*/?>"
        // Create a regular expression object
        guard let regex = try? NSRegularExpression(pattern: pattern, options: .caseInsensitive) else {
            return self // Return the original string if there's an issue with the regular expression
        }
        // Replace all <br /> tags with a newline character
        let modifiedString = regex.stringByReplacingMatches(in: self, options: [], range: NSRange(location: 0, length: self.utf16.count), withTemplate: "\n")
        return modifiedString
    }

    func replaceEscapedSlashes() -> String {
        replacingOccurrences(of: "\\/", with: "/")
    }
}
