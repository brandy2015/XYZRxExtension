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
//@IBAction func actionSave() {
//  guard let image = imagePreview.image else { return }
//
//  PhotoWriter.save(image)
//    .asSingle()
//    .subscribe(
//      onSuccess: { [weak self] id in
//        self?.showMessage("Saved with id: \(id)")
//        self?.actionClear()
//      },
//      onError: { [weak self] error in
//        self?.showMessage("Error", description: error.localizedDescription)
//      }
//    )
//    .disposed(by: bag)
//}




import Foundation
import Photos
import RxSwift

public extension PHPhotoLibrary {
  static var authorized: Observable<Bool> {
    return Observable.create { observer in
      
      DispatchQueue.main.async {
        if authorizationStatus() == .authorized {
          observer.onNext(true)
          observer.onCompleted()
        } else {
          observer.onNext(false)
          requestAuthorization { newStatus in
            observer.onNext(newStatus == .authorized)
            observer.onCompleted()
          }
        }
      }
      
      return Disposables.create()
    }
  }
}


//// MARK: View Controller
//override func viewDidLoad() {
//  super.viewDidLoad()
//
//  let authorized = PHPhotoLibrary.authorized
//    .share()
//
//  authorized
//    .skipWhile { !$0 }
//    .take(1)
//    .subscribe(onNext: { [weak self] _ in
//      self?.photos = PhotosViewController.loadPhotos()
//      DispatchQueue.main.async {
//        self?.collectionView?.reloadData()
//      }
//    })
//    .disposed(by: bag)
//
//  authorized
//    .skip(1)
//    .takeLast(1)
//    .filter { !$0 }
//    .subscribe(onNext: { [weak self] _ in
//      guard let errorMessage = self?.errorMessage else { return }
//      DispatchQueue.main.async(execute: errorMessage)
//    })
//    .disposed(by: bag)
//}
//
//private func errorMessage() {
//  alert(title: "No access to Camera Roll",
//    text: "You can grant access to Combinestagram from the Settings app")
//    .asObservable()
//    .take(.seconds(5), scheduler: MainScheduler.instance)
//    .subscribe(onCompleted: { [weak self] in
//      self?.dismiss(animated: true, completion: nil)
//      _ = self?.navigationController?.popViewController(animated: true)
//    })
//    .disposed(by: bag)
//}
