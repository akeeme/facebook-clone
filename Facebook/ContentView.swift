//
//  ContentView.swift
//  Facebook
//
//  Created by Akeeme on 7/9/21.
//

import SwiftUI


struct FBPostModel: Hashable {
    let name: String
    let post: String
    let imageName: String
}


struct ContentView: View {
    
    
    @Binding var text: String
    
    let stories = ["story1", "story2", "story3", "story4", "story5", "story6"]
    
    let persons = ["person1", "person2", "person3", "person4", "person5", "person6"]
    
    let posts: [FBPostModel] = [
        FBPostModel(name: "Velocity Kills",
                    post: "Whole lotta red!",
                    imageName: "person1"),
        FBPostModel(name: "Sleep Walker",
                    post: "what is life?",
                    imageName: "person2"),
        FBPostModel(name: "Nikki Skywalker",
                    post: "swift is ok... ig?",
                    imageName: "person3"),
        FBPostModel (name: "Rage Skywalker",
                     post: "idk what i am but ik what i could be",
                     imageName: "person4")
                     
    ]
    
    
    let facebookBlue = UIColor(red: 23/255.0,
                               green: 120/255.0,
                               blue: 242/255.0,
                               alpha: 1)
    var body: some View {
        VStack {
            HStack {
                Text("facebook")
                    .font(.system(size: 48, weight: .bold, design: .default))
                    .foregroundColor(Color(facebookBlue))
                
                Spacer()
                
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .foregroundColor(Color(.secondaryLabel))
            }
            .padding()
            
            TextField("Search...", text: $text)
                .padding(10)
                .background(Color(.systemGray5))
                .cornerRadius(20)
                .padding(.horizontal, 15)
            
            ZStack {
                Color(.secondarySystemBackground)
                
                ScrollView(.vertical){
                    VStack {
                        StoriesView(stories: stories)
                        
                        ForEach(posts, id: \.self) { model in
                            FBPost(model: model)
                            Spacer()
                        }
                    }
                }
            }
                
            Spacer()
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(text: .constant(""))

    }
}
