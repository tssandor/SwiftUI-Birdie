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
    
    // TODO: This should look exactly like Birdie's table view cell.
    // The post text is left-aligned below the mascot image.
    // The image, if any, is horizontally centered in the view.
    VStack(alignment: .leading, spacing: 0) {
      HStack {
        Image("mascot_swift-badge").resizable()
          .frame(width: 80.0, height: 80.0)
        VStack(alignment: .leading) {
          Text(post.userName)
          Text(Self.dateFormatter.string(from: post.timestamp))
        }
      }
   
      Text(post.textBody!)
//        .frame(minWidth: 40, maxWidth: .infinity, minHeight: 40, alignment: .topLeading)
        .padding()
      //.alignmentGuide(.leading, computeValue: <#(ViewDimensions) -> CGFloat#>)// { d in d[.trailing]}
   
      if post.uiImage != nil {
        Image(uiImage: post.uiImage!)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .border(Color.black, width: 2)

      }
      Spacer()
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
