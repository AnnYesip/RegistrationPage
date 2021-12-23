//
//  ContentView.swift
//  RegistrationPageDesign
//
//  Created by Ann Yesip on 01.11.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State var index = 0
    
    var body: some View {
        GeometryReader { _ in
            VStack {
                // Logo
                Image(systemName: "moon")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .padding(.top, 40)
                
                // Registration Page
                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    Login(index: self.$index)
                }
                
                // line "or" line
                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color.lightningYellow)
                        .frame(height: 1)
                    
                    Text("OR")
                    
                    Rectangle()
                        .fill(Color.orange)
                        .frame(height: 1)
                    
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
                
                HStack(spacing: 25) {
                    Button(action: {
                        //
                    }, label: {
                        Image("facebook_icon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                    })
                    
                    Button(action: {
                        //
                    }, label: {
                        Image("instagram_icon")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                    })
                    
                    Button(action: {
                        //
                    }, label: {
                        Image("telegram_logo")
                            .resizable()
                            .renderingMode(.original)
                            .frame(width: 50, height: 50)
                    })
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
            
        }
        .background(Color.graphite).edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
    }
}


struct CShapeLogin: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}


struct CShapeSignUp: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    @State var email = ""
    @State var path = ""
    @Binding var index: Int
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        Capsule()
                            .fill(self.index == 0 ? Color.coffeBean : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer()
                }
                .padding(.top, 30)
                
                /// Email Adress
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.coffeBean)
                        
                        TextField("", text: self.$email)
                            .placeholder(when: email.isEmpty) {
                                Text("Email Adress").foregroundColor(.coffeBean)
                            }
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                /// Password
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.coffeBean)
                        
                        SecureField("", text: self.$path)
                            .placeholder(when: path.isEmpty) {
                                Text("Password").foregroundColor(.coffeBean)
                            }
                        
                    }
                    
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack {
                    Spacer(minLength: 0)
                    
                    Button (action: {
                        //
                    }, label: {
                        Text("Forget password?")
                            .foregroundColor(Color.coffeBean)
                    })
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color.bone)
            .clipShape(CShapeLogin())
            .contentShape(CShapeLogin())
            .shadow(color: Color.black.opacity(0.3),
                    radius: 5,
                    x: 0,
                    y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                
            }, label: {
                Text("Login")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.lightningYellow)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1),
                            radius: 5,
                            x: 0,
                            y: 5)
                
            })
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }
}





struct SignUp: View {
    @State var email = ""
    @State var path = ""
    @Binding var index: Int
    @State var repass = ""
    
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10) {
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.coffeBean : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color.coffeBean)
                        TextField("", text: $email)
                            .placeholder(when: email.isEmpty) {
                                Text("Email Address").foregroundColor(.coffeBean)
                            }
                    }
                    Divider()
                        .background(Color.black.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.coffeBean)
                        
                        SecureField("", text: self.$path)
                            .placeholder(when: path.isEmpty) {
                                Text("Password").foregroundColor(.coffeBean)
                            }
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color.coffeBean)
                        
                        SecureField("", text: self.$repass)
                            .placeholder(when: repass.isEmpty) {
                                Text("Password").foregroundColor(.coffeBean)
                            }
                    }
                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color.bone)
            .clipShape(CShapeSignUp())
            .contentShape(CShapeSignUp())
            .shadow(color: Color.black.opacity(0.3),
                    radius: 5,
                    x: 0,
                    y: -5)
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)
            
            Button(action: {
                
            }, label: {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color.lightningYellow)
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1),
                            radius: 5,
                            x: 0,
                            y: -5)
                
            })
            .offset(y: 25)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
