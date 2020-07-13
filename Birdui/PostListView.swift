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
      
      ZStack {
        HStack {
          Image("mascot_swift-badge")
            .resizable()
            .frame(width: 60.0, height: 60.0)
            .padding([.leading], 18)
          Spacer()
        }
        Text("Home").font(.largeTitle)
      }.frame(height: 76)
      
      HStack {
        Spacer()
        Button(
          action: { self.modalIsPresented = true }
        ) {
          HStack {
            Image(systemName: "plus.circle")
            Text("Create New Post").font(.callout)
          }
        }
        .sheet(isPresented: $modalIsPresented) {
          NewPostView(postHandler: self.listOfPosts)
        }
        Spacer()
      }.background(Color.clear)
      List {
        ForEach(listOfPosts.posts) { post in
          PostView(post: post)
          
        }
      }
    }
  }
}

struct PostListView_Previews: PreviewProvider {
  static var previews: some View {
    PostListView()
  }
}
