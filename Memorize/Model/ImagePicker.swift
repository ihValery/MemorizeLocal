//
//  ImagePicker.swift
//  Memorize
//
//  Created by Валерий Игнатьев on 5.06.21.
//

import SwiftUI

struct ImagePicker: UIViewControllerRepresentable {
    
    //MARK: - Properties
    
    @Binding var selectedImage: UIImage
        
    var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @Environment(\.presentationMode) private var presentationMode
    
    //MARK: - Public Methods

    func makeUIViewController(context: Context) -> some UIViewController {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        imagePicker.sourceType = sourceType
        imagePicker.delegate = context.coordinator
        
        return imagePicker
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    //MARK: - SomeClass
    
    final class Coordinator: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
        
        //MARK: - Properties
        
        private var parent: ImagePicker
        
        //MARK: - Initializer
        
        init(_ parent: ImagePicker) {
            self.parent = parent
        }
        
        //MARK: - Public Methods
        
        func imagePickerController(_ picker: UIImagePickerController,
                                           didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
                parent.selectedImage = image
            }
            parent.presentationMode.wrappedValue.dismiss()
        }
    }
    
}
