// swiftlint:disable all
import Amplify
import Foundation

public struct SeasonRecord: Model {
  public let id: String
  public var userId: String
  public var groupId: String
  public var wins: Int
  public var losses: Int
  public var pushes: Int
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      userId: String,
      groupId: String,
      wins: Int,
      losses: Int,
      pushes: Int) {
    self.init(id: id,
      userId: userId,
      groupId: groupId,
      wins: wins,
      losses: losses,
      pushes: pushes,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      userId: String,
      groupId: String,
      wins: Int,
      losses: Int,
      pushes: Int,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.userId = userId
      self.groupId = groupId
      self.wins = wins
      self.losses = losses
      self.pushes = pushes
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}