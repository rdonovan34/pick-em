// swiftlint:disable all
import Amplify
import Foundation

extension SeasonRecord {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case userId
    case groupId
    case wins
    case losses
    case pushes
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let seasonRecord = SeasonRecord.keys
    
    model.authRules = [
      rule(allow: .owner, ownerField: "owner", identityClaim: "cognito:username", provider: .userPools, operations: [.create, .update, .delete, .read]),
      rule(allow: .groups, groupClaim: "cognito:groups", groups: ["Admins"], provider: .userPools, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "SeasonRecords"
    model.syncPluralName = "SeasonRecords"
    
    model.attributes(
      .primaryKey(fields: [seasonRecord.id])
    )
    
    model.fields(
      .field(seasonRecord.id, is: .required, ofType: .string),
      .field(seasonRecord.userId, is: .required, ofType: .string),
      .field(seasonRecord.groupId, is: .required, ofType: .string),
      .field(seasonRecord.wins, is: .required, ofType: .int),
      .field(seasonRecord.losses, is: .required, ofType: .int),
      .field(seasonRecord.pushes, is: .required, ofType: .int),
      .field(seasonRecord.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(seasonRecord.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension SeasonRecord: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}