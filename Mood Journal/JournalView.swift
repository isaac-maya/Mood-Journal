import SwiftUI

struct JournalView: View {
    @State private var answer: String = ""
    private let questions = [
        "How would you describe your overall mood today?",
        "On a scale of 1 to 10, how happy or satisfied are you feeling right now?",
        "Can you tell me about something positive that happened to you recently?",
        "Is there anything specific that's been bothering you lately?",
        "How would you rate your stress level at the moment?",
        "Can you share an experience that made you feel particularly frustrated or upset?",
        "Are you generally feeling optimistic or pessimistic about the future?",
        "How would you describe your energy level today? High, moderate, or low?",
        "Are you finding it easy or difficult to focus on tasks or activities?",
        "Overall, would you say you're feeling more positive or negative emotions lately?",
        // Add more questions here if needed
    ]
    @State private var currentQuestion: String = ""
    @State private var isRecording: Bool = false

    var body: some View {
        VStack {
            Text(currentQuestion)
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
                // Pick a new random question
                currentQuestion = questions.randomElement() ?? ""
            }) {
                Text(isRecording ? "Stop Recording" : "Start Recording")
                    .font(.title)
                    .padding()
                    .background(isRecording ? Color.red : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
            Spacer()
        }
        .navigationBarTitle("Journal")
        .onAppear {
            currentQuestion = questions.randomElement() ?? ""
        }
    }

    private func recordAnswer() {
        if isRecording {
            // Stop recording logic
            isRecording = false
        } else {
            // Start recording logic
            isRecording = true
        }
    }
}

struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
