import SwiftUI

struct LoginView: View {
    @AppStorage("username") var username: String = ""
    @State private var inputName: String = ""
    @State private var isLoggedIn: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("请输入用户名")
                    .font(.title2)
                TextField("用户名", text: $inputName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("登录") {
                    if !inputName.isEmpty {
                        username = inputName
                        isLoggedIn = true
                    }
                }
                .buttonStyle(.borderedProminent)

                // 跳转逻辑
                NavigationLink(destination: BookSelectionView(), isActive: $isLoggedIn) {
                    EmptyView()
                }
            }
            .navigationTitle("欢迎")
        }
    }
}
