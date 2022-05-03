//
//  ImageUploader.swift
//  TwitterSwiftUIYoutube
//
//  Created by 田中大地 on 2022/05/03.
//

import FirebaseStorage
import UIKit
import SwiftUI

struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping (String) -> Void){
        guard let imageData = image.jpegData(compressionQuality: 0.5) else { return }
        
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_image/\(filename)")
        
        ref.putData(imageData, metadata: nil){ _, error in
            if let error = error {
                print("DEBUG: Failed to upload image with error: \(error.localizedDescription)")
            }
            
            ref.downloadURL { imageUrl, _ in
                guard let imageUrl = imageUrl?.absoluteString else { return }
                completion(imageUrl)
            }
        }
    }
}
