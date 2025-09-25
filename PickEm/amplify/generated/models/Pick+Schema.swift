// swiftlint:disable all
import Amplify
import Foundation

extension Pick {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case userId
    case gameId
    case selectedTeam
    case isCorrect
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let pick = Pick.keys
    
    model.authRules = [
      rule(allow: .owner, ownerField: "owner", identityClaim: "cognito:username", provider: .userPools, operations: [.create, .update, .delete, .read]),
      rule(allow: .groups, groupClaim: "cognito:groups", groups: ["Admins"], provider: .userPools, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Picks"
    model.syncPluralName = "Picks"
    
    model.attributes(
      .primaryKey(fields: [pick.id])
    )
    
    model.fields(
      .field(pick.id, is: .required, ofType: .string),
      .field(pick.userId, is: .required, ofType: .string),
      .field(pick.gameId, is: .required, ofType: .string),
      .field(pick.selectedTeam, is: .required, ofType: .string),
      .field(pick.isCorrect, is: .optional, ofType: .bool),
      .field(pick.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(pick.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Pick: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}