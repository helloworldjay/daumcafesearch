//
//  CafeSearchListViewController.swift
//  DaumCafeSearch
//
//  Created by Seungjin Baek on 2021/12/30.
//

import UIKit
import SwiftUI

final class CafeSearchListViewController: UIViewController {
  override func viewDidLoad() {
    super.viewDidLoad()


// MARK: - Preview

struct MainViewController_Previews: PreviewProvider {
  static var previews: some View {
    Container().edgesIgnoringSafeArea(.all)
  }
  
  struct Container: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
      let rootViewController = CafeSearchListViewController()
      return UINavigationController(rootViewController: rootViewController)
    }
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    typealias UIViewControllerType = UIViewController
  }
}
