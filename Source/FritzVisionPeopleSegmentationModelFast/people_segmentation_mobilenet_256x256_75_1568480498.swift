//
// people_segmentation_mobilenet_256x256_75_1568480498.swift
//
// This file was automatically generated and should not be edited.
//

import CoreML


/// Model Prediction Input Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class people_segmentation_mobilenet_256x256_75_1568480498Input : MLFeatureProvider {

    /// image as color (kCVPixelFormatType_32BGRA) image buffer, 256 pixels wide by 256 pixels high
    var image: CVPixelBuffer

    var featureNames: Set<String> {
        get {
            return ["image"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "image") {
            return MLFeatureValue(pixelBuffer: image)
        }
        return nil
    }
    
    init(image: CVPixelBuffer) {
        self.image = image
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    convenience init(imageWith image: CGImage) throws {
        self.init(image: try MLFeatureValue(cgImage: image, pixelsWide: 256, pixelsHigh: 256, pixelFormatType: kCVPixelFormatType_32ARGB, options: nil).imageBufferValue!)
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    convenience init(imageAt image: URL) throws {
        self.init(image: try MLFeatureValue(imageAt: image, pixelsWide: 256, pixelsHigh: 256, pixelFormatType: kCVPixelFormatType_32ARGB, options: nil).imageBufferValue!)
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func setImage(with image: CGImage) throws  {
        self.image = try MLFeatureValue(cgImage: image, pixelsWide: 256, pixelsHigh: 256, pixelFormatType: kCVPixelFormatType_32ARGB, options: nil).imageBufferValue!
    }

    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func setImage(with image: URL) throws  {
        self.image = try MLFeatureValue(imageAt: image, pixelsWide: 256, pixelsHigh: 256, pixelFormatType: kCVPixelFormatType_32ARGB, options: nil).imageBufferValue!
    }

}


/// Model Prediction Output Type
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class people_segmentation_mobilenet_256x256_75_1568480498Output : MLFeatureProvider {

    /// Source provided by CoreML
    private let provider : MLFeatureProvider

    /// output as 2 × 256 × 256 3-dimensional array of doubles
    lazy var output: MLMultiArray = {
        [unowned self] in return self.provider.featureValue(for: "output")!.multiArrayValue
    }()!

    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }

    init(output: MLMultiArray) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["output" : MLFeatureValue(multiArray: output)])
    }

    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.13, iOS 11.0, tvOS 11.0, watchOS 4.0, *)
class people_segmentation_mobilenet_256x256_75_1568480498 {
    let model: MLModel

    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let bundle = Bundle(for: self)
        return bundle.url(forResource: "people_segmentation_mobilenet_256x256_75_1568480498", withExtension:"mlmodelc")!
    }

    /**
        Construct people_segmentation_mobilenet_256x256_75_1568480498 instance with an existing MLModel object.

        Usually the application does not use this initializer unless it makes a subclass of people_segmentation_mobilenet_256x256_75_1568480498.
        Such application may want to use `MLModel(contentsOfURL:configuration:)` and `people_segmentation_mobilenet_256x256_75_1568480498.urlOfModelInThisBundle` to create a MLModel object to pass-in.

        - parameters:
          - model: MLModel object
    */
    init(model: MLModel) {
        self.model = model
    }

    /**
        Construct people_segmentation_mobilenet_256x256_75_1568480498 instance by automatically loading the model from the app's bundle.
    */
    @available(*, deprecated, message: "Use init(configuration:) instead and handle errors appropriately.")
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }

    /**
        Construct a model with configuration

        - parameters:
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct people_segmentation_mobilenet_256x256_75_1568480498 instance with explicit path to mlmodelc file
        - parameters:
           - modelURL: the file url of the model

        - throws: an NSError object that describes the problem
    */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }

    /**
        Construct a model with URL of the .mlmodelc directory and configuration

        - parameters:
           - modelURL: the file url of the model
           - configuration: the desired model configuration

        - throws: an NSError object that describes the problem
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }

    /**
        Construct people_segmentation_mobilenet_256x256_75_1568480498 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<people_segmentation_mobilenet_256x256_75_1568480498, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }

    /**
        Construct people_segmentation_mobilenet_256x256_75_1568480498 instance asynchronously with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> people_segmentation_mobilenet_256x256_75_1568480498 {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }

    /**
        Construct people_segmentation_mobilenet_256x256_75_1568480498 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
          - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
    */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<people_segmentation_mobilenet_256x256_75_1568480498, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(people_segmentation_mobilenet_256x256_75_1568480498(model: model)))
            }
        }
    }

    /**
        Construct people_segmentation_mobilenet_256x256_75_1568480498 instance asynchronously with URL of the .mlmodelc directory with optional configuration.

        Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.

        - parameters:
          - modelURL: the URL to the model
          - configuration: the desired model configuration
    */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> people_segmentation_mobilenet_256x256_75_1568480498 {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return people_segmentation_mobilenet_256x256_75_1568480498(model: model)
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as people_segmentation_mobilenet_256x256_75_1568480498Input

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as people_segmentation_mobilenet_256x256_75_1568480498Output
    */
    func prediction(input: people_segmentation_mobilenet_256x256_75_1568480498Input) throws -> people_segmentation_mobilenet_256x256_75_1568480498Output {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }

    /**
        Make a prediction using the structured interface

        - parameters:
           - input: the input to the prediction as people_segmentation_mobilenet_256x256_75_1568480498Input
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as people_segmentation_mobilenet_256x256_75_1568480498Output
    */
    func prediction(input: people_segmentation_mobilenet_256x256_75_1568480498Input, options: MLPredictionOptions) throws -> people_segmentation_mobilenet_256x256_75_1568480498Output {
        let outFeatures = try model.prediction(from: input, options:options)
        return people_segmentation_mobilenet_256x256_75_1568480498Output(features: outFeatures)
    }

    /**
        Make a prediction using the convenience interface

        - parameters:
            - image as color (kCVPixelFormatType_32BGRA) image buffer, 256 pixels wide by 256 pixels high

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as people_segmentation_mobilenet_256x256_75_1568480498Output
    */
    func prediction(image: CVPixelBuffer) throws -> people_segmentation_mobilenet_256x256_75_1568480498Output {
        let input_ = people_segmentation_mobilenet_256x256_75_1568480498Input(image: image)
        return try self.prediction(input: input_)
    }

    /**
        Make a batch prediction using the structured interface

        - parameters:
           - inputs: the inputs to the prediction as [people_segmentation_mobilenet_256x256_75_1568480498Input]
           - options: prediction options 

        - throws: an NSError object that describes the problem

        - returns: the result of the prediction as [people_segmentation_mobilenet_256x256_75_1568480498Output]
    */
    @available(macOS 10.14, iOS 12.0, tvOS 12.0, watchOS 5.0, *)
    func predictions(inputs: [people_segmentation_mobilenet_256x256_75_1568480498Input], options: MLPredictionOptions = MLPredictionOptions()) throws -> [people_segmentation_mobilenet_256x256_75_1568480498Output] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [people_segmentation_mobilenet_256x256_75_1568480498Output] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  people_segmentation_mobilenet_256x256_75_1568480498Output(features: outProvider)
            results.append(result)
        }
        return results
    }
}
