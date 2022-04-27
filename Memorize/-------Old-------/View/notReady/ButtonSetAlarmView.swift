//
//  ButtonSetAlarmView.swift
//  Notification
//
//  Created by Валерий Игнатьев on 11.05.21.
//

import SwiftUI

struct ButtonSetAlarmView: View {
    
    //MARK: - Properties

    @Binding var date: Date
    
    @State private var setAlarm: Bool = UserDefaults.standard.bool(forKey: "setAlarm") {
        didSet {
            UserDefaults.standard.set(self.setAlarm, forKey: "setAlarm")
        }
    }
    
    @State private var dateString: String = UserDefaults.standard.object(forKey: "Alarm") as? String ?? "00:00" {
        didSet {
            UserDefaults.standard.set(self.dateString, forKey: "Alarm")
        }
    }
    
    //MARK: - Body
    
    var body: some View {
            Button(action: {
                dateString = dateToString(date)
                NotificationManager.shared.sceduleNotification(date: date)
                withAnimation(.easeOut(duration: 0.4)) {
                    setAlarm = true
                }
            }) {
                HStack {
                    Text(setAlarm == false ? "Установить" : "Вкл:  \(dateString)")
                        .padding(.horizontal)
                    Image(systemName: "timer")
                }
                .frame(maxWidth: .infinity, maxHeight: 30)
                .font(.title.weight(.light))
                .padding(7)
                .foregroundColor(setAlarm == false ? .blue : .black.opacity(0.7))
                .padding(5)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(setAlarm == false ? Color.blue : Color.black.opacity(0), lineWidth: 3))
            }
            .disabled(setAlarm == true ? true : false)

        if setAlarm {
            ButtonRemoveAlarmView(setAlarm: $setAlarm)
        }
    }
    
    //MARK: - Private Methods

    private func dateToString(_ date: Date) -> String {
        let timeFormatter = DateFormatter()
        timeFormatter.timeStyle = .short
        return timeFormatter.string(from: date)
    }
    
}

struct ButtonSetAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
            .previewLayout(.sizeThatFits)
    }
}
