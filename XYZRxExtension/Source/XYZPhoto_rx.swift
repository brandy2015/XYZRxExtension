//
//  XYZPhoto_rx.swift
//  XYZRxExtension
//
//  Created by zhangzihao on 2022/4/20.
//

import UIKit
import RxSwift
import RxCocoa
import Photos


public class PhotoWriter {
    public enum Errors: Error {
    case couldNotSavePhoto
  }

    public static func save(_ image: UIImage) -> Observable<String> {
    return Observable.create { observer in
      var savedAssetId: String?
      PHPhotoLibrary.shared().performChanges({
        let request = PHAssetChangeRequest.creationRequestForAsset(from: image)
        savedAssetId = request.placeholderForCreatedAsset?.localIdentifier
      }, completionHandler: { success, error in
        DispatchQueue.main.async {
          if success, let id = savedAssetId {
            observer.onNext(id)
            observer.onCompleted()
          } else {
            observer.onError(error ?? Errors.couldNotSavePhoto)
          }
        }
      })

      return Disposables.create()
    }
  }
}
