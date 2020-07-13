//
//  ImagePicker.swift
//  Birdui
//
//  Created by Audrey Tam on 4/7/20.
//  Copyright © 2020 Razeware. All rights reserved.
//

import SwiftUI

// Create struct ImagePicker: UIViewControllerRepresentable { }
// Hint: hackingwithswift.com

// To be honest I am not sure what it's going on here, but this is copied code from Hacking with Swift :]

struct ImagePicker: UIViewControllerRepresentable {
  @Environment(\.presentationMode) var presentationMode
  @Binding var image: UIImage?
  
  class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
      let parent: ImagePicker

      init(_ parent: ImagePicker) {
          self.parent = parent
      }
      
      func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
          if let uiImage = info[.originalImage] as? UIImage {
              parent.image = uiImage
          }
          parent.presentationMode.wrappedValue.dismiss()
      }
  }
  
  func makeUIViewController(context: UIViewControllerRepresentableContext<ImagePicker>) -> UIImagePickerController {
    let picker = UIImagePickerController()
    picker.delegate = context.coordinator
    return picker
  }

  func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<ImagePicker>) {
  }
    
  func makeCoordinator() -> Coordinator {
      Coordinator(self)
  }
  
}
