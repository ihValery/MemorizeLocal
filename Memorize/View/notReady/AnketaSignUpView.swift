//
//  AnketaSignUpView.swift
//  SwiftUI_Firebase
//
//  Created by Валерий Игнатьев on 28.05.21.
//

import SwiftUI

struct AnketaSignUpView: View {
    
    //MARK: - Properties

    @State private var showPassword = false
    @State private var isShowPhotoLibrary = false

    @ObservedObject private var signViewModel = SignViewModel.shared

    //MARK: - Body

    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                HStack {
                    Image(systemName: "person.fill")
                        .padding(.leading, 3)
                        .padding(.trailing, 2)
                    
                    ZStack(alignment: .leading) {
                        if signViewModel.username.isEmpty {
                            Text("Введите имя")
                                .opacity(0.7)
                        }
                        TextField("", text: $signViewModel.username)
                    }
                }
                LineView()
                
                HStack {
                    Image(systemName: "envelope.fill")
                    
                    ZStack(alignment: .leading) {
                        if signViewModel.email.isEmpty {
                            Text("Укажите почту")
                                .opacity(0.7)
                        }
                        TextField("", text: $signViewModel.email)
                    }
                }
                LineView()
                
                HStack {
                    Image(systemName: "lock.fill")
                        .padding(.leading, 3)
                        .padding(.trailing, 2)
                    
                    ZStack(alignment: .trailing) {
                        if showPassword {
                            ZStack {
                                TextField("", text: $signViewModel.password)
                            }
                        } else {
                            ZStack(alignment: .leading) {
                                if signViewModel.password.isEmpty {
                                    Text("Придумайте пароль")
                                        .opacity(0.7)
                                }
                                SecureField("", text: $signViewModel.password)
                            }
                        }
                        Button(action: {
                            showPassword.toggle()
                        }, label: {
                            Image(systemName: "eye")
                                .opacity(showPassword ? 1 : 0.2)
                        })
                    }
                }
                LineView()
                
                HStack {
                    Image(systemName: "lock.fill")
                        .padding(.leading, 3)
                        .padding(.trailing, 2)
                    
                    ZStack (alignment: .leading) {
                        if signViewModel.passwordAgain.isEmpty {
                            Text("Повторите пароль")
                                .opacity(0.7)
                        }
                        SecureField("", text: $signViewModel.passwordAgain)
                    }
                }
                
                LineView()
            }
            .textFieldStyle(DefaultTextFieldStyle())
            .font(.title2)
            .foregroundColor(.signEnd)
            .padding()
            .offset(y: 40)
            
            FrameAvatarView(image: $signViewModel.image)
                .onTapGesture {
                    isShowPhotoLibrary = true
                }
                .clipShape(Circle())
                .offset(y: -190)
        }
        
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: $signViewModel.image, sourceType: .photoLibrary)
        }
    }
    
}

struct AnketaSignUpView_Previews: PreviewProvider {
    static var previews: some View {
        AnketaSignUpView()
    }
}
