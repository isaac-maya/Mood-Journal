import SwiftUI

enum Mood: String {
    case happy = "😊"
    case neutral = "😐"
    case sad = "😔"
}

struct MoodGaugeView: View {
    @State private var selectedMood: Mood?
    @State private var navigateToConfirmation: Bool = false
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    var body: some View {
        VStack(spacing: 30) {
            Text("How are you feeling?")
                .font(.title)
                .fontWeight(.bold)
                .padding()
            
            Text(dateFormatter.string(from: Date()))
                .font(.headline)
                .foregroundColor(.gray)
            
            Spacer()
            
            VStack(spacing: 30) {
                NavigationLink(destination: ConfirmationView(), isActive: $navigateToConfirmation) {
                    EmptyView()
                }
                
                Button(action: {
                    withAnimation {
                        selectedMood = .happy
                        saveMood(.happy)
                        navigateToConfirmation = true
                    }
                }) {
                    Text(Mood.happy.rawValue)
                        .font(.system(size: 120))
                        .frame(width: 140, height: 140)
                        .background(selectedMood == .happy ? Color.blue : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    withAnimation {
                        selectedMood = .neutral
                        saveMood(.neutral)
                        navigateToConfirmation = true
                    }
                }) {
                    Text(Mood.neutral.rawValue)
                        .font(.system(size: 120))
                        .frame(width: 140, height: 140)
                        .background(selectedMood == .neutral ? Color.blue : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    withAnimation {
                        selectedMood = .sad
                        saveMood(.sad)
                        navigateToConfirmation = true
                    }
                }) {
                    Text(Mood.sad.rawValue)
                        .font(.system(size: 120))
                        .frame(width: 140, height: 140)
                        .background(selectedMood == .sad ? Color.blue : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            
            Spacer()
        }
        .navigationBarTitle("Mood Gauge")
    }
    
    func saveMood(_ mood: Mood) {
        let currentDate = Date()
        let key = dateFormatter.string(from: currentDate)
        UserDefaults.standard.set(mood.rawValue, forKey: key)
    }
}

struct ConfirmationView: View {
    var body: some View {
        Text("Mood has been saved!\nYou can close the app")
            .font(.title)
            .padding()
    }
}

struct MoodGaugeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MoodGaugeView()
        }
    }
}

