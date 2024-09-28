import SwiftUI
import AVFoundation

struct DiceRollerView: View {
    let sides: Int
    let diceImages: [String]
    @State private var rolledValue: Int? = nil
    @State private var diceImage: String
    @State private var isRolling: Bool = false
    @State private var audioPlayer: AVAudioPlayer?
    @State private var modifierValue: Int = 0
    @State private var isModifierPositive: Bool = true

    init(sides: Int, diceImages: [String]) {
        self.sides = sides
        self.diceImages = diceImages
        self._diceImage = State(initialValue: "d\(sides)_\(sides)")
    }

    var body: some View {
        ZStack {
            Color(hex: "#3c3c50")
                .ignoresSafeArea()
            
            VStack {
                Text("Optional Modifier")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding(.top, 16)
                
                HStack {
                    Button(action: {
                        isModifierPositive = true
                    }) {
                        Text("+")
                            .font(.title)
                            .frame(width: 40, height: 40)
                            .background(isModifierPositive ? Color(hex: "#1f1f2e") : Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    
                    TextField("Modifier", value: $modifierValue, formatter: NumberFormatter())
                        .padding()
                        .background(Color(hex: "#28283c"))
                        .frame(width: 100)
                        .foregroundColor(.white)
                        .keyboardType(.numberPad)
                        .cornerRadius(5)

                    Button(action: {
                        isModifierPositive = false
                    }) {
                        Text("-")
                            .font(.title)
                            .frame(width: 40, height: 40)
                            .background(isModifierPositive ? Color.gray : Color(hex: "#1f1f2e"))
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .padding()

                VStack {
                    Image(isRolling ? "d\(sides)_roll" : diceImage)
                        .resizable()
                        .frame(width: 270, height: 270)
                        .padding()
                        .background(Color(hex: "#28283c"))
                        .cornerRadius(30)
                        .padding()
                }
                
                Text(rolledValue == nil ? "Initiate a Roll" : getRollMessage())
                    .font(.title2)
                    .foregroundColor(.white)
                    .padding(.top, 16)
                    .fontWeight(.bold)

                if let rolledValue = rolledValue, rolledValue != 1 {
                    let finalValue = isModifierPositive ? rolledValue + modifierValue : rolledValue - modifierValue
                    let adjustedFinalValue = max(finalValue, 1)
                    Text("Final result: \(adjustedFinalValue)")
                        .font(.title)
                        .foregroundColor(.white)
                        .padding(.top, 16)
                }

                Button(action: rollDice) {
                    Text("Roll the Dice")
                        .font(.title2)
                        .padding()
                        .background(Color(.blue))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding(.top, 16)
            }
        }
        .navigationTitle("Rolling a D\(sides)")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("ROLLING A d\(sides)")
                    .foregroundColor(.white)
                    .font(.headline)
            }
        }
        .foregroundColor(.white)
        .onAppear {
            configureAudioSession()
        }
    }
    
    // This function sets up the audio to be played for the rolls
    private func configureAudioSession() {
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
        } catch {
            print("Error setting up audio session: \(error.localizedDescription)")
        }
    }

    // This function is the main function that updates the roll state, plays the sounds, and
    // finds a random integer (simulating dice roll)
    private func rollDice() {
        isRolling = true
        
        playSound(for: "roll_sound")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            rolledValue = Int.random(in: 1...sides)
            diceImage = diceImages[rolledValue! - 1]
            isRolling = false
            
            configureAudioSession()
            
            if rolledValue == 1 {
                playSound(for: "roll_1_sound")
            } else if rolledValue == sides {
                playSound(for: "roll_max_sound")
            }
        }
    }

    // This function plays the sounds for the app
    private func playSound(for resource: String) {
        if let soundURL = Bundle.main.url(forResource: resource, withExtension: "mp3") {
            do {
                audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                audioPlayer?.play()
                audioPlayer?.volume = 1.0
            } catch {
                print("Error playing sound: \(error.localizedDescription)")
            }
        } else {
            print("Sound file \(resource) not found")
        }
    }
    
    // This function will return the rolled value, however if it is a 1 or 20 on a d20, it will
    // Return a critical success or failure
    private func getRollMessage() -> String {
        guard let rolledValue = rolledValue else { return "" }
        
        if sides == 20 {
            if rolledValue == 1 {
                return "Critical Failure"
            } else if rolledValue == 20 {
                return "Critical Success!"
            }
        }
        return "You rolled a \(rolledValue)"
    }
}

// Preview for DiceRollerView
struct DiceRollerView_Previews: PreviewProvider {
    static var previews: some View {
        DiceRollerView(sides: 6, diceImages: ["d6_1", "d6_2", "d6_3", "d6_4", "d6_5", "d6_6"])
    }
}
