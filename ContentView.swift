import SwiftUI
import UserNotifications

struct ContentView: View {
    @State private var time = Date()
    @State private var alarms:[Date] = []

    var body: some View {
        NavigationStack {
            VStack(spacing:20) {
                Text("⏰ Будильник")
                    .font(.largeTitle.bold())

                DatePicker("Время", selection:$time, displayedComponents:.hourAndMinute)
                    .datePickerStyle(.wheel)

                Button("Добавить") {
                    alarms.append(time)
                    createNotification()
                }
                .padding()
                .frame(maxWidth:.infinity)
                .background(.green)
                .foregroundColor(.white)
                .cornerRadius(20)

                List {
                    ForEach(alarms, id:\.self) { alarm in
                        Text(alarm.formatted(date:.omitted, time:.shortened))
                    }
                    .onDelete { alarms.remove(atOffsets:$0) }
                }
            }
            .padding()
            .navigationTitle("Будильники")
            .onAppear {
                UNUserNotificationCenter.current()
                    .requestAuthorization(options:[.alert,.sound]) {_,_ in}
            }
        }
    }

    func createNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Будильник"
        content.body = "Пора вставать!"
        content.sound = .default

        let c = Calendar.current.dateComponents([.hour,.minute], from: time)
        let trigger = UNCalendarNotificationTrigger(dateMatching:c, repeats:true)

        UNUserNotificationCenter.current().add(
            UNNotificationRequest(identifier:UUID().uuidString,
                                  content:content,
                                  trigger:trigger)
        )
    }
}