//
//  SessionFirebase.swift
//  testRemovetest
//
//  Created by Валерий Игнатьев on 4.06.21.
//

/*
 
import UIKit
import Combine
import Firebase
import FirebaseFirestore

final class SessionFirebase: ObservableObject {
    
    //MARK: - Properties
    
    @Published var isShowOnboard = false
    @Published var isSignIn = false
    @Published var errorMessage: String = ""
    @Published var user: User?
    
    private let store = Firestore.firestore().collection("users")
    
    //MARK: - Initializer
    
    init() {
        _ = Auth.auth().addStateDidChangeListener { [weak self] auth, user in
            if let user = user {
                self?.user = User(uid: user.uid, email: user.email)
                self?.getUrlAndName()
                self?.isSignIn = false
            } else {
                self?.user = nil
                //FIXME: Before assembly true
                self?.isShowOnboard = false
            }
        }
    }
    
    //MARK: - Public Methods
    
    func signIn(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
        }
    }
    
    func signUp(email: String, password: String, name: String, photo: UIImage) {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            guard let result = result else { return }
            
            self.upload(currenrUid: result.user.uid, photo: photo) { [weak self] resultUrlError in
                switch resultUrlError {
                case .success(let url):
                    self?.store.document(result.user.uid)
                        .setData(["userName" : name,
                                  "email" : email,
                                  "avatarURL" : url.absoluteString,
                                  "uid" : result.user.uid]) { error in
                            if let error = error {
                                self?.errorMessage = error.localizedDescription
                            } else {
                                self?.getUrlAndName()
                            }
                        }
                case .failure(let error):
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    //MARK: - Private Methods
    
    private func getUrlAndName() {
        guard let userId = user?.uid else { return }
        let currentDoc = store.whereField("uid", isEqualTo: userId)
        
        currentDoc.getDocuments() { querySnapshot, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
            } else {
                for document in querySnapshot!.documents {
                    self.user?.userName = document.data()["userName"] as? String
                    self.user?.avatarURL = document.data()["avatarURL"] as? String
                }
            }
        }
    }
    
    private func upload(currenrUid: String, photo: UIImage, completion: @escaping (Result<URL, Error>) -> Void) {
        let reference = Storage.storage().reference().child("avatars").child(currenrUid)
        
        guard let imageData = photo.jpegData(compressionQuality: 0.5) else { return }
        let metaData = StorageMetadata()
        metaData.contentType = "image/jpeg"
        
        reference.putData(imageData, metadata: metaData) { metadata, error in
            if let error = error {
                self.errorMessage = error.localizedDescription
                return
            }
            reference.downloadURL { url, error in
                if let error = error {
                    self.errorMessage = error.localizedDescription
                    return
                }
                if let url = url {
                    completion(.success(url))
                }
            }
        }
    }
    
}

*/
