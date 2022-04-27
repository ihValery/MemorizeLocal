//
//  NotificationView.swift
//  Notification
//
//  Created by Валерий Игнатьев on 10.05.21.
//

import SwiftUI

struct NotificationView: View {
    
    @State private var currentDate = Date()
    @State private var toShowAlert = false

    @Environment(\.scenePhase) private var scenePhase
    @Environment(\.colorScheme) var colorScheme
    
    @ObservedObject var theme = ThemeViewModel.shared
    
    var body: some View {
        ZStack {
            LinearGradient(gradient:
                            Gradient(colors: [themeData[self.theme.current].color,
                                              .sideMenuStart]),
                           startPoint: UnitPoint(x: 0.9, y: 0.8), endPoint: UnitPoint(x: 0.1, y: 0.9))
                .opacity(0.6)
                .ignoresSafeArea()
            VStack {
                Text("10 минут,\nчто бы мозг работал эффективнее!")
                    .font(.largeTitle)
                    .foregroundColor(.black.opacity(0.7))
                    .multilineTextAlignment(.center)
                
                DatePicker("Время", selection: $currentDate, in: Date()...)
                    .datePickerStyle(GraphicalDatePickerStyle())
//                    .labelsHidden()
                    .environment(\.locale, Locale.init(identifier: "ru"))
                
                ButtonSetAlarmView(date: $currentDate)
            }
            .font(.largeTitle)
            .padding()
            
            .onChange(of: scenePhase) { phase in
                if phase == .active {
                    UIApplication.shared.applicationIconBadgeNumber = 0
                }
            }
            
            .onAppear {
                NotificationManager.shared.getNotification {
                    toShowAlert.toggle()
                }
            }
            
            .alert(isPresented: $toShowAlert, content: {
                Alert(title: Text("Уведомление отключено для этого приложения"),
                      message: Text("Пожалуйста, перейдите в настройки, чтобы включить его сейчас"),
                      primaryButton: .default(Text("Открыть настройки")) {
                        goToSettings()
                      },
                      secondaryButton: .cancel())
        })
        }
        .ignoresSafeArea(.all, edges: .all)
    }
}

extension NotificationView {
    private func goToSettings() {
        DispatchQueue.main.async {
            UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
        }
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .preferredColorScheme(.light)
    }
}
