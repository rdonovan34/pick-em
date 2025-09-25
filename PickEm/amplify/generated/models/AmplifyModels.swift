// swiftlint:disable all
import Amplify
import Foundation

// Contains the set of classes that conforms to the `Model` protocol. 

final public class AmplifyModels: AmplifyModelRegistration {
  public let version: String = "4926cad8adc077f22e6e25ff8f5371b6"
  
  public func registerModels(registry: ModelRegistry.Type) {
    ModelRegistry.register(modelType: User.self)
    ModelRegistry.register(modelType: Group.self)
    ModelRegistry.register(modelType: Game.self)
    ModelRegistry.register(modelType: Pick.self)
    ModelRegistry.register(modelType: SeasonRecord.self)
  }
}