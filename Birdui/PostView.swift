//
//  PostView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostView: View {
  let post: MediaPost
  
  var body: some View {
    
    // TODO: This should look exactly like Birdie's table view cell.
    // The post text is left-aligned below the mascot image.
    // The image, if any, is horizontally centered in the view.
    VStack(alignment: .leading) {
      HStack {
        Image("mascot_swift-badge").resizable()
          .frame(width: 80.0, height: 80.0)
        VStack(alignment: .leading) {
          Text(post.userName)
          Text("Second line")
        }
      }
      Text(post.textBody!)
//      GeometryReader { geo in
                      Image("octopus")
                        .resizable()
                //        .scaledToFit()
                //        .frame(width: 414.0)
                //        .frame(height: 220.0)
//                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
//      }
    }
  }
}

struct PostView_Previews: PreviewProvider {
  static var previews: some View {
    PostView(post: MediaPost(textBody: "Went to the Aquarium today :]",
      userName: "Audrey", timestamp: Date(timeIntervalSinceNow: -9876),
      uiImage: UIImage(named: "octopus")))
  }
}
