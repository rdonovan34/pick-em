// swiftlint:disable all
import Amplify
import Foundation

extension Group {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case name
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let group = Group.keys
    
    model.authRules = [
      rule(allow: .groups, groupClaim: "cognito:groups", groups: ["Admins"], provider: .userPools, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Groups"
    model.syncPluralName = "Groups"
    
    model.attributes(
      .primaryKey(fields: [group.id])
    )
    
    model.fields(
      .field(group.id, is: .required, ofType: .string),
      .field(group.name, is: .required, ofType: .string),
      .field(group.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(group.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Group: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}