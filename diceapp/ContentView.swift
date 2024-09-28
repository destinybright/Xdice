import SwiftUI

struct ContentView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(hex: "#3c3c50")
                    .edgesIgnoringSafeArea(.all)

                VStack {
                    Text("Choose Your Dice")
                    
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .padding()

                    LazyVGrid(columns: columns, spacing: 20) {
                        // d4
                        NavigationLink(destination: DiceRollerView(sides: 4, diceImages: ["d4_1", "d4_2", "d4_3", "d4_4"])) {
                            HStack {
                                Image("d4_4")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("d4")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .padding()
                            .background(Color.red)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        }
                        // d6
                        NavigationLink(destination: DiceRollerView(sides: 6, diceImages: ["d6_1", "d6_2", "d6_3", "d6_4", "d6_5", "d6_6"])) {
                            HStack {
                                Image("d6_6")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("d6")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .padding()
                            .background(Color.pink)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        }

                        // d8
                        NavigationLink(destination: DiceRollerView(sides: 8, diceImages: ["d8_1", "d8_2", "d8_3", "d8_4", "d8_5", "d8_6", "d8_7", "d8_8"])) {
                            HStack {
                                Image("d8_8")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("d8")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .padding()
                            .background(Color.orange)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        }

                        // d10
                        NavigationLink(destination: DiceRollerView(sides: 10, diceImages: ["d10_1", "d10_2", "d10_3", "d10_4", "d10_5", "d10_6", "d10_7", "d10_8", "d10_9", "d10_10"])) {
                            HStack {
                                Image("d10_10")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("d10")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        }

                        // d12
                        NavigationLink(destination: DiceRollerView(sides: 12, diceImages: ["d12_1", "d12_2", "d12_3", "d12_4", "d12_5", "d12_6", "d12_7", "d12_8", "d12_9", "d12_10", "d12_11", "d12_12"])) {
                            HStack {
                                Image("d12_12")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("d12")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        }

                        // d20
                        NavigationLink(destination: DiceRollerView(sides: 20, diceImages: ["d20_1", "d20_2", "d20_3", "d20_4", "d20_5", "d20_6", "d20_7", "d20_8", "d20_9", "d20_10", "d20_11", "d20_12", "d20_13", "d20_14", "d20_15", "d20_16", "d20_17", "d20_18", "d20_19", "d20_20"])) {
                            HStack {
                                Image("d20_20")
                                    .resizable()
                                    .frame(width: 70, height: 70)
                                Text("d20")
                                    .font(.system(size: 18))
                                    .fontWeight(.bold)
                                    .padding()
                            }
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .cornerRadius(30)
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

// Preview for ContentView
#Preview {
    ContentView()
}
