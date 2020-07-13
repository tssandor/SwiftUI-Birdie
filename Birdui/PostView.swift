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
  
  static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.timeStyle = .short
        df.dateStyle = .short
        return df
  }()
  
  var body: some View {
    
    VStack(alignment: .leading, spacing: 0) {
      HStack {
        Image("mascot_swift-badge").resizable()
          .frame(width: 60.0, height: 60.0)
        VStack(alignment: .leading) {
          Text(post.userName)
          Text(Self.dateFormatter.string(from: post.timestamp))
        }
      }
   
      if post.textBody != nil {
        Text(post.textBody!)
          .multilineTextAlignment(.leading)
          .padding(.top, 8.0)
      }
      // Did use this instead of the simpler Text(post.textBody ?? "")
      // Because if it's an empty string then the line is still there, and the image
      // appears a tad too far from the timestamp row
      
      HStack(alignment: .center) {
        if post.uiImage != nil {
          Spacer()
          Image(uiImage: post.uiImage!)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 180, height: 180, alignment: .center)
          Spacer()
        } else {
          Text("")
          // This is here because it creates a bit of space
          // after the text if there's no image. Otherwise
          // the text is too close to the list cell divider bar
        }
      }
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
