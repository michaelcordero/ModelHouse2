//
//  ModelManager.swift
//  ModelHouse
//
//  Created by Michael Cordero on 3/29/23.
//

import Foundation
import CoreML
import ZipArchive

class ModelManager {
    static func fetch_model(stock: Stocks, mn: ModelName, mt: ModelType) -> MLModel? {
        
        

        var to_return: MLModel?
        var pre: String = #"http://onyx.cs.fiu.edu:3000/api/"#
        pre += stock.rawValue
        pre += #"/"#
        pre += mn.rawValue
        pre += #"/"#
        pre += mt.rawValue
        guard let url = URL(string: pre) else {
            return nil
        }
        // download it
        let task = URLSession.shared.downloadTask(with: url) { local_url, response, error in
            guard let local_url = local_url, error == nil else {
                print("Failed to download file: \(error?.localizedDescription ?? "unknown error")")
                return
            }
            let documents_dir_url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let destination_url = documents_dir_url.appendingPathComponent(local_url.lastPathComponent)
            do {
                try FileManager.default.moveItem(at: local_url, to: destination_url)
                print("File downloaded successfully to: \(destination_url.absoluteString)")
                // var mlpackage_dir = destination_url.absoluteString + ".mlpackage"
                SSZipArchive.unzipFile(atPath: destination_url.absoluteString, toDestination: destination_url.absoluteString)
                let compiled_model_url = try MLModel.compileModel(at: destination_url)
                let model = try MLModel(contentsOf: compiled_model_url)
                to_return = model
            } catch {
                print("Failed to save file: \(error.localizedDescription)")
            }
        }
        task.resume()
        return to_return
    }

}

