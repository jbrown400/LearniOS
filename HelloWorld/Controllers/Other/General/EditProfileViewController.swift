//
//  EditProfileViewController.swift
//  HelloWorld
//
//  Created by Justin Brown on 8/22/20.
//  Copyright © 2020 Justin Brown. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save",
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(didTapSave))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Cancel",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapCancel))
    }
    
    @objc private func didTapSave() {
        
    }
    
    @objc private func didTapCancel() {
        
    }
    
    @objc private func didTapChangeProfilePicture() {
        let actionSheet = UIAlertController(title: "Profile Picture",
                                            message: "Change profile picture",
                                            preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose From Library", style: .default, handler: { _ in
            
        }))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        // So the action sheet doesn't crash on iPad
        actionSheet.popoverPresentationController?.sourceView = view
        actionSheet.popoverPresentationController?.sourceRect = view.bounds
        
        present(actionSheet, animated: true)
    }
}
