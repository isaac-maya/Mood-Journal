import SwiftUI

enum Mode {
    case journal, moodGauge
}

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
                        tag: Mode.journal,
                        selection: $selectedMode,
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
                        tag: Mode.moodGauge,
                        selection: $selectedMode,
                        label: {
                            EmptyView()
                        }
                    )
                    .isDetailLink(false)
                )

                Spacer()
            }
            .padding()
            .navigationBarTitle("Mood Journal", displayMode: .large)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

