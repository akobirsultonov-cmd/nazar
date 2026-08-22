import SwiftUI

struct ContentView: View {
    @State private var alarmTime = Date()
    @State private var alarms: [Date] = []

    var body: some View {
        NavigationStack {
            VStack {
                DatePicker(
                    "Время",
                    selection: $alarmTime,
                    displayedComponents: .hourAndMinute
                )
                .datePickerStyle(.wheel)

                Button("Добавить будильник") {
                    alarms.append(alarmTime)
                }
                .buttonStyle(.borderedProminent)

                List {
                    ForEach(alarms, id: \.self) { alarm in
                        Text(alarm.formatted(date: .omitted, time: .shortened))
                    }
                    .onDelete { alarms.remove(atOffsets: $0) }
                }
            }
            .padding()
            .navigationTitle("Будильник")
        }
    }
}