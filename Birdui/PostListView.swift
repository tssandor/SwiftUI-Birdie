//
//  PostListView.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

struct PostListView: View {
  
  @ObservedObject var listOfPosts = PostViewModel()
  @State var modalIsPresented = false
  
  var body: some View {
    // TODO: This should look exactly like the Birdie table view,
    // but with only one button.
    VStack(alignment: .leading) {
      
      HStack {
        Image("mascot_swift-badge")
          .resizable()
          .frame(width: 80.0, height: 80.0)

        Spacer()

        Text("Home")
          .multilineTextAlignment(.center)

        Spacer()
      }
      
      Button(
        action: { self.modalIsPresented = true }
      ) {
        Text("Create New Post")
      }
      .sheet(isPresented: $modalIsPresented) {
        NewPostView(postHandler: self.listOfPosts)
      }

      List {
          ForEach(listOfPosts.posts) { post in
              PostView(post: post)
          }
      }
      
//      List(listOfPosts.posts.indices) { item in
//        PostView(post: self.listOfPosts.posts[item])
//      }
//      List(listOfPosts.posts) { post in
//        Text(post.userName)
//      }

    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView()
  }
}
