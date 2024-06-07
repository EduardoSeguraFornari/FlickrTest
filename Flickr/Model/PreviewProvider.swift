//
//  PreviewProvider.swift
//  Flickr
//
//  Created by Eduardo Fornari on 07/06/24.
//

import Foundation

struct PreviewProvider {
    static let postsData = Posts(items: [post, post, post, post, post])
    static let post = Post(
        author: "nobody@flickr.com (\"ZoomZoom Du Buisson\")",
        description: "<p><a href=\"https://www.flickr.com/people/photosbyblackwolf/\">Dan King Alaskan Photography</a> posted a photo:</p> <p><a href=\"https://www.flickr.com/photos/photosbyblackwolf/53762634202/\" title=\"Porcupine Portrait\"><img src=\"https://live.staticflickr.com/65535/53762634202_b9bd80c596_m.jpg\" width=\"240\" height=\"160\" alt=\"Porcupine Portrait\" /></a></p> <p>I can only imagine that the face of a Porcupine is soft. This was the second Porcupine we seen this day. I was able to walk up near to where it was eating and it walked towards me a few feet, close enough to take a close up of its cute face. <br /> Porcupines do not throw their quills. They are very docile creatures and only spread their quills when threatened. When a Porcupine fees threatened, it will also chatter its teeth. The quills, which normally are not seen, will become erect and if an animal bites at the Porucpine, the quills will disloge and remain in the predator. The Porcupine will then grow new quills to relpace those that are lost.<br /> Porcupines are the third largest rodent on the planet and can weigh up to 30 lbs. The Capyberra and Beaver are the only rodents larger than the Porcupine.<br /> Porcupine young are called Porcupettes. Porcupines have been documented to live over 30 years. Their main diet is leaves and bark.</p> ",
        media: PostMedia(url: "https://hws.dev/paul.jpg"),
        published: Date(),
        title: "Porcupine in A Tree"
    )
}
