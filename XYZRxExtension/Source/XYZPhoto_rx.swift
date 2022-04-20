//
//  XYZPhoto_rx.swift
//  XYZRxExtension
//
//  Created by zhangzihao on 2022/4/20.
//

import UIKit

class XYZPhoto_rx: NSObject {

}


//class PhotoWriter {
//  enum Errors: Error {
//    case couldNotSavePhoto
//  }
//
//  static func save(_ image: UIImage) -> Observable<String> {
//    return Observable.create { observer in
//      var savedAssetId: String?
//      PHPhotoLibrary.shared().performChanges({
//        let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
//        savedAssetId = request.placeholderForCreatedAsset?.localIdentifier
//      }, completionHandler: { success, error in
//        DispatchQueue.main.async {
//          if success, let id = savedAssetId {
//            observer.onNext(id)
//            observer.onCompleted()
//          } else {
//            observer.onError(error ?? Errors.couldNotSavePhoto)
//          }
//        }
//      })
//
//      return Disposables.create()
//    }
//  }
//}
