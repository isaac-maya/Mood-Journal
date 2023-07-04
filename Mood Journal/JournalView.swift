import SwiftUI

struct JournalView: View {
    @State private var answer: String = ""

    var body: some View {
        VStack {
            Text("Question")
                .font(.title)
                .padding()
            
            Spacer()
            
            TextEditor(text: $answer)
                .frame(height: 200)
                .padding()
            
            Spacer()
            
            Button(action: {
                // Handle the answer recording
                recordAnswer()
            }) {
                Text("Record Answer")
                    .font(.title)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .navigationBarTitle("Journal")
    }
    
    private func recordAnswer() {
        // Implement the logic to record the user's voice answer
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}

