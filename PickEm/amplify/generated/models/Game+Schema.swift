// swiftlint:disable all
import Amplify
import Foundation

extension Game {
  // MARK: - CodingKeys 
   public enum CodingKeys: String, ModelKey {
    case id
    case week
    case date
    case homeTeam
    case awayTeam
    case spread
    case groupId
    case createdAt
    case updatedAt
  }
  
  public static let keys = CodingKeys.self
  //  MARK: - ModelSchema 
  
  public static let schema = defineSchema { model in
    let game = Game.keys
    
    model.authRules = [
      rule(allow: .groups, groupClaim: "cognito:groups", groups: ["Admins"], provider: .userPools, operations: [.create, .update, .delete, .read])
    ]
    
    model.listPluralName = "Games"
    model.syncPluralName = "Games"
    
    model.attributes(
      .primaryKey(fields: [game.id])
    )
    
    model.fields(
      .field(game.id, is: .required, ofType: .string),
      .field(game.week, is: .required, ofType: .int),
      .field(game.date, is: .required, ofType: .dateTime),
      .field(game.homeTeam, is: .required, ofType: .string),
      .field(game.awayTeam, is: .required, ofType: .string),
      .field(game.spread, is: .required, ofType: .double),
      .field(game.groupId, is: .required, ofType: .string),
      .field(game.createdAt, is: .optional, isReadOnly: true, ofType: .dateTime),
      .field(game.updatedAt, is: .optional, isReadOnly: true, ofType: .dateTime)
    )
    }
}

extension Game: ModelIdentifiable {
  public typealias IdentifierFormat = ModelIdentifierFormat.Default
  public typealias IdentifierProtocol = DefaultModelIdentifier<Self>
}