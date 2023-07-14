import SwiftUI

struct CalendarView: View {
    @State private var moods: [String: Mood] = [:]
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM d, yyyy"
        return formatter
    }()
    
    let daysInMonth = Calendar.current.range(of: .day, in: .month, for: Date())?.count ?? 0
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        VStack {
            // Header
            Text("\(Date(), formatter: monthYearFormatter)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            
            // Calendar grid
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(1...daysInMonth, id: \.self) { day in
                        let date = Calendar.current.date(from: DateComponents(year: Calendar.current.component(.year, from: Date()), month: Calendar.current.component(.month, from: Date()), day: day))!
                        let key = dateFormatter.string(from: date)
                        Text("\(day)\n\(moods[key]?.rawValue ?? "")")
                            .frame(width: 40, height: 60)
                            .border(Color.gray)
                    }
                }
            }
        }
        .onAppear {
            loadMoods()
        }
    }
    
    private var monthYearFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM yyyy"
        formatter.locale = Locale(identifier: "en_US")  // set locale to English
        return formatter
    }

    
    func loadMoods() {
        for day in 1...daysInMonth {
            let date = Calendar.current.date(from: DateComponents(year: Calendar.current.component(.year, from: Date()), month: Calendar.current.component(.month, from: Date()), day: day))!
            let key = dateFormatter.string(from: date)
            if let moodString = UserDefaults.standard.string(forKey: key), let mood = Mood(rawValue: moodString) {
                moods[key] = mood
            }
        }
    }
}
