import SwiftUI

struct MoodGaugeView: View {
    @State private var selectedFace: String = ""
    
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
                Button(action: {
                    withAnimation {
                        selectedFace = "😊" // Happy face
                    }
                }) {
                    Text("😊")
                        .font(.system(size: 120))
                        .frame(width: 140, height: 140)
                        .background(selectedFace == "😊" ? Color.blue : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    withAnimation {
                        selectedFace = "😐" // Neutral face
                    }
                }) {
                    Text("😐")
                        .font(.system(size: 120))
                        .frame(width: 140, height: 140)
                        .background(selectedFace == "😐" ? Color.blue : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
                
                Button(action: {
                    withAnimation {
                        selectedFace = "😔" // Sad face
                    }
                }) {
                    Text("😔")
                        .font(.system(size: 120))
                        .frame(width: 140, height: 140)
                        .background(selectedFace == "😔" ? Color.blue : Color.gray.opacity(0.5))
                        .foregroundColor(.white)
                        .clipShape(Circle())
                }
            }
            
            Spacer()
        }
        .navigationBarTitle("Mood Gauge")
    }
}

struct MoodGaugeView_Previews: PreviewProvider {
    static var previews: some View {
        MoodGaugeView()
    }
}

