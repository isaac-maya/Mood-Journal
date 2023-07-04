import SwiftUI

struct ContentView: View {
    @State private var selectedMode: Mode?

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Spacer()

                Button(action: {
                    selectedMode = .journal
                }) {
                    VStack {
                        Text("Journal")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Answer questions by recording your voice")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(Color.blue)
                    .cornerRadius(10)
                }
                .padding()
                .background(
                    NavigationLink(
                        destination: JournalView(),
                        isActive: Binding<Bool>(
                            get: { selectedMode == .journal },
                            set: { _ in }
                        ),
                        label: {
                            EmptyView()
                        }
                    )
                )

                Button(action: {
                    selectedMode = .moodGauge
                }) {
                    VStack {
                        Text("Mood Gauge")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        Text("Rate your mood with emojis")
                            .font(.subheadline)
                            .foregroundColor(.white)
                            .opacity(0.8)
                            .multilineTextAlignment(.center)
                            .padding(.top, 4)
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 120)
                    .background(Color.green)
                    .cornerRadius(10)
                }
                .padding()
                .background(
                    NavigationLink(
                        destination: MoodGaugeView(),
                        isActive: Binding<Bool>(
                            get: { selectedMode == .moodGauge },
                            set: { _ in }
                        ),
                        label: {
                            EmptyView()
                        }
                    )
                )

                Spacer()
            }
            .padding()
            .navigationBarTitle("Mood Journal", displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

enum Mode {
    case journal, moodGauge
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


