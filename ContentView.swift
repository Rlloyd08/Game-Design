import SwiftUI
struct ContentView: View {
    // Game state
    @State private var currentStep = "start"
    var body: some View {
        VStack(spacing: 20) {
            Spacer()
            switch currentStep {
            case "start":
                Text("🏞️ You're in a plot of land, presented with three options.")
                    .multilineTextAlignment(.center)
                HStack {
                    gameButton("Go to the mountain") {
                        currentStep = "mountain"
                    }
                    gameButton("Cross the road") {
                        currentStep = "road"
                    }
                    gameButton("Jump in the water"){
                        currentStep = "water"
                    }
                    
                }
            case "mountain":
                Text("🌉 You find a cave, how do you sih to proceed?")
                    .multilineTextAlignment(.center)
                VStack {
                    gameButton("Go in cave") {
                        currentStep = "cave"
                    }
                    gameButton("Continue foward") {
                        currentStep = "fall foward"
                    }
                    
                }
                
            case "fall foward":
                Text("🤸You fall of the mountain.")
                gameButton("Restart") {
                    currentStep = "start"
                }
            case "road":
                Text("🚗 A car runs you over!")
                gameButton("Restart") {
                    currentStep = "start"
                }
            case "water":
                Text("🦈😱You get swallowed by a shark")
                gameButton("Restart") {
                    currentStep = "start"
                }
          
            case "cave":
                Text("There are two differnt paths presented to you")
                gameButton("Go left") {
                    currentStep = "Bats"
                }
                gameButton("Go right") {
                    currentStep = "Escape"
                }
                
            case "Bats":
                Text("🕳️ It's dark and scary. A bat flies out! You are ripped to shreds.")
                Ellipse()
                    .fill(Color.gray)
                    .frame(width: 120, height: 60)
                gameButton("Retreat") {
                    currentStep = "start"
                }
            case "Escape":
                Text("You make it out the cave and see a large🌲tree besides a patch of woods, how do you proceed?")
                
                gameButton("Go into woods") {
                    currentStep = "Woods"
                }
                gameButton("Climb tree"){
                    currentStep = "Tree"
                }
            case "Woods":
                Text("You thought you were alone. A bear shows up! You are eaten")
                Circle()
                    .fill(Color.brown)
                    .frame(width: 100, height: 100)
                gameButton("Restart") {
                    currentStep = "start"
                }
            case "Tree":
                Text("😫 Your arms are getting very tired, do you decide to stop and rest or keep climbing?")
                
                gameButton("Continue") {
                    currentStep = "Continue"
                }
                gameButton("Stop climbing"){
                currentStep = "stop"
          }
            case "Continue":
                Text("You find treasure.🤑🤑")
                gameButton("HOORAYY.") {
                    currentStep = "default"
                }
            case "stop":
                Text(" 😞You slip and fall of the tree")
        
                gameButton("Restart") {
                    currentStep = "start"
                }
            default:
                Text("Game Over.")
            }
            Spacer()
        }
        .padding()
        .font(.title3)
    }
    // Reusable styled button
    func gameButton(_ label: String, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            Text(label)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.blue.opacity(0.8))
                .foregroundColor(.white)
                .cornerRadius(10)
        }
    }
}
#Preview {
    ContentView()
}


