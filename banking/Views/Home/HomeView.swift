//
//  HomeView.swift
//  banking
//
//  Created by Andelson on 16/3/25.
//

import SwiftUI

struct HomeView: View {
    @Binding var isShowingMenu: Bool
    
    let cards = [
        CardModel(type: "Visa", balance: 5650.00, lastDigits: "3214", color: "A1E3F9"),
        CardModel(type: "Mastercard", balance: 34250.50, lastDigits: "7890", color: "A6F1E0"),
        CardModel(type: "Amex", balance: 45123.75, lastDigits: "5432", color: "C4D9FF"),
    ]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    // HOME VIEW --->
                    VStack {
                        Text("Total balance")
                            .font(.body)
                            .foregroundStyle(Color(hex:"3c3c3c"))
                            .fontWeight(.semibold)
                        
                        // send the user to the account overview to see more details about it
                        NavigationLink(destination: AccountOverview()) {
                            VStack {
                                HStack {
                                    Text("$")
                                        .fontWeight(.semibold)
                                        .font(.system(size: 30))
                                        .foregroundStyle(Color(hex:"3c3c3c"))
                                    
                                    Text("184,584")
                                        .font(.system(size: 60))
                                        .fontWeight(.light)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                        .foregroundStyle(Color(hex:"000"))
                                    
                                    Text(".00")
                                        .font(.system(size: 30))
                                        .foregroundStyle(Color(hex:"3c3c3c"))
                                }
                                .frame(maxWidth: 350, alignment: .bottom)
                                Text("Full balance in account information")
                                    .font(.body)
                                    .fontWeight(.light)
                                    .foregroundStyle(Color(hex:"27374D"))
                                    .frame(maxWidth: .infinity, alignment: .center)
                            }
                            .padding(.vertical)
                        }
                        
                        // CARD SECTION --->
                        VStack {
                            HStack {
                                Text("Cards")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                Spacer()
                                Image(systemName: "plus.circle", variableValue: 1.00)
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 25, weight: .regular))
                            }
                            .padding(.horizontal, 20)
                            
                            /// #  Card list.
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack(spacing: 10) {
                                    ForEach(cards) { card in
                                        CardListView(card: card)
                                    }
                                }
                                .padding(.horizontal, 8)
                                .padding(.vertical, 8)
                            }
                        }
                        
                        /// # Activity section
                        VStack {
                            HStack {
                                Text("History")
                                    .font(.system(size: 20))
                                    .fontWeight(.semibold)
                                Spacer()
                                Image(systemName: "magnifyingglass", variableValue: 1.00)
                                    .symbolRenderingMode(.monochrome)
                                    .foregroundColor(Color.black)
                                    .font(.system(size: 20, weight: .regular))
                            }
                            .padding(.horizontal, 20)
                            
                            /// - Activity list ----->
                            ForEach(0..<10) { index in
                                ActivityView()
                            }
                            /// - Activity list ----->
                        }
                        .padding(.top, 20)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    Spacer()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

struct CardListView: View {
    let card: CardModel
    
    var body: some View {
        // card design --->
        VStack {
            HStack {
                Text(card.type)
                    .font(.system(size: 20))
                    .fontWeight(.heavy)
                
                Spacer()
                
                Image(systemName: "equal", variableValue: 1.00)
                    .foregroundStyle(Color.black)
                    .symbolRenderingMode(.monochrome)
                    .font(.system(size: 20, weight: .bold))
            }
            .padding(.bottom, 100)
            .frame(maxWidth: .infinity)
            
            Spacer()
            
            VStack {
                Text("Family card")
                    .foregroundStyle(Color(hex:"27374D"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("$\(Int(card.balance))")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 30))
                    .fontWeight(.bold)
            }
            .padding(.bottom)
            .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack {
                Text("***1234")
                
                Spacer()
                
                Text(card.lastDigits)
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .frame(width: 220, height: 250)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(hex:card.color))
        )
    }
}
    
struct ActivityView: View {
    var body: some View {
        VStack {
            HStack {
                Image("discord")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                    .padding(5)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(hex:"EEEEEE"))
                    )
                VStack {
                    Text("Discord")
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text("Discord Inc")
                        .foregroundStyle(Color(hex:"4A628A"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
        
                Spacer()
                
                VStack {
                    Text("$ 9 billon").fontWeight(.semibold).foregroundStyle(Color(hex:"009990"))
                    Text("APY 6.5").font(.body).foregroundStyle(Color(hex:"4A628A"))
                }
            }
            .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .padding([.horizontal], 0)
        .frame(maxWidth: .infinity, maxHeight: 200, alignment: .center)
        .background(
            RoundedRectangle(cornerRadius: 15)
                .fill(Color(hex:"FFF"))
        )
        .padding(.horizontal, 20)
    }
}

#Preview {
    HomeView(
        isShowingMenu: .constant(false)
    )
}
