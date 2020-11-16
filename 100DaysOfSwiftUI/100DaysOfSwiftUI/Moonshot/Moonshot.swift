//
//  Moonshot.swift
//  100DaysOfSwiftUI
//
//  Created by Mina Ashna on 16/11/2020.
//

import SwiftUI

struct Moonshot: View {
    let astronauts: [Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        NavigationView {
            List(missions) { mission in
                NavigationLink(destination: MissionView(mission: mission, astronauts: self.astronauts)) {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 44, height: 44)
                    
                    VStack(alignment: .leading) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                    }
                        }
            }
        }
        .navigationBarTitle("Moonshot")
    }
}

struct Moonshot_Previews: PreviewProvider {
    static var previews: some View {
        Moonshot()
    }
}
