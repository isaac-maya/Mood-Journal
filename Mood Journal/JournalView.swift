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
        "How would you describe your current level of motivation?",
        "Are you experiencing any difficulty in making decisions lately?",
        "Do you often find yourself feeling overwhelmed or anxious?",
        "Are you able to get a good night's sleep consistently?",
        "How would you rate your level of self-confidence at the moment?",
        "Have you been feeling more irritable or easily agitated lately?",
        "Are you able to find enjoyment in activities that used to bring you pleasure?",
        "Have you noticed any changes in your appetite or eating habits?",
        "Do you often feel a sense of hopelessness or sadness?",
        "Are you able to manage and cope with stress effectively?",
        "How would you describe your overall level of satisfaction with your life right now?",
        "Can you identify any specific triggers or factors that contribute to your current emotional state?",
        "Are you experiencing any difficulties in maintaining relationships with friends or family?",
        "How do you typically cope with stress or challenging situations?",
        "Have you noticed any changes in your ability to concentrate or remember things?",
        "Are you currently experiencing any physical symptoms that might be related to your mental state (e.g., headaches, fatigue)?",
        "Have you sought support or professional help for your mental well-being in the past?",
        "Are there any specific goals or aspirations that you feel unable to pursue at the moment?",
        "Have you noticed any changes in your interest or enjoyment of activities you used to find pleasurable?",
        "Are you open to seeking professional guidance or support to improve your mental well-being?",
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
                    if isRecording {
                        // Stop recording logic
                        isRecording = false
                    } else {
                        // Start recording logic
                        isRecording = true
                    }
                }) {
                    Text(isRecording ? "Stop Recording" : "Start Recording")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(isRecording ? Color.red : Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Button(action: {
                    // Pick a new random question
                    currentQuestion = questions.randomElement() ?? ""
                }) {
                    Text("Choose a Different Question")
                        .font(.title)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.horizontal)

                Spacer()
            }
            .navigationBarTitle("Journal")
            .onAppear {
                currentQuestion = questions.randomElement() ?? ""
            }
        }
    }

    struct JournalView_Previews: PreviewProvider {
        static var previews: some View {
            JournalView()
        }
    }
