// swiftlint:disable all
import Amplify
import Foundation

public struct Game: Model {
  public let id: String
  public var week: Int
  public var date: Temporal.DateTime
  public var homeTeam: String
  public var awayTeam: String
  public var spread: Double
  public var groupId: String
  public var createdAt: Temporal.DateTime?
  public var updatedAt: Temporal.DateTime?
  
  public init(id: String = UUID().uuidString,
      week: Int,
      date: Temporal.DateTime,
      homeTeam: String,
      awayTeam: String,
      spread: Double,
      groupId: String) {
    self.init(id: id,
      week: week,
      date: date,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      spread: spread,
      groupId: groupId,
      createdAt: nil,
      updatedAt: nil)
  }
  internal init(id: String = UUID().uuidString,
      week: Int,
      date: Temporal.DateTime,
      homeTeam: String,
      awayTeam: String,
      spread: Double,
      groupId: String,
      createdAt: Temporal.DateTime? = nil,
      updatedAt: Temporal.DateTime? = nil) {
      self.id = id
      self.week = week
      self.date = date
      self.homeTeam = homeTeam
      self.awayTeam = awayTeam
      self.spread = spread
      self.groupId = groupId
      self.createdAt = createdAt
      self.updatedAt = updatedAt
  }
}