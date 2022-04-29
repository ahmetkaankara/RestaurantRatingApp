//
//  SignInView.swift
//  RestaurantRating
//
//  Created by Ahmet Kaan Kara on 17.03.2022.
//

import SwiftUI

struct SignInView: View {
    
    @State var email = ""
    @State var password = ""
    
    @EnvironmentObject var authManager: AuthManager
    
    
    var body: some View {
        
        ZStack{
            Background()
            
            VStack{
                Spacer()
                Image(systemName: "person.crop.circle")
                    .resizable()
                    .foregroundColor(Color.white)
                    .scaledToFit()
                    .frame(width: 150, height: 150, alignment: .center)
                    .padding()
                Group{
                    TextField("Email", text: $email)
                        .frame(width: 300, height: 20)
                        .autocapitalization(.none)
                        .padding()
                        .disableAutocorrection(true)
                        .background(Color.white)
                        .cornerRadius(50)
                    SecureField("Parola", text: $password)
                        .frame(width: 300, height: 20)
                        .padding()
                        .background(Color.white)
                        .cornerRadius(50)
                    
                    Button {
                        guard !email.isEmpty,!password.isEmpty else{
                            return
                        }
                        
                        authManager.signIn(email: email, password: password)
                        
                        
                        
                    } label: {
                        Text("Giriş Yap")
                        
                            .frame(width: 100, height: 45)
                            .font(.system(size: 20).bold())
                            .background(Color.white)
                            .foregroundColor(Color.purple)
                            .cornerRadius(10)
                            .padding(.top)
                    }
                    
                    
                    NavigationLink(destination: SignUpView()) {
                        Text("Kayıt Ol")
                        
                            .foregroundColor(Color.white)
                    }
                    .navigationTitle("")
                    .navigationBarHidden(true)
                    Spacer()
                    
                    
                    
                }
                Spacer()
                
                
            }
            
            
        }
        
        
    }
    
    struct SignInView_Previews: PreviewProvider {
        static var previews: some View {
            SignInView()
        }
    }
}


