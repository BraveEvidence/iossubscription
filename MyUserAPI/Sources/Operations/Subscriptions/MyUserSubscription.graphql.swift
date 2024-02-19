// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class MyUserSubscription: GraphQLSubscription {
  public static let operationName: String = "MyUserSubscription"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"subscription MyUserSubscription { newUser { __typename name } }"#
    ))

  public init() {}

  public struct Data: MyUserAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { MyUserAPI.Objects.Subscription }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("newUser", NewUser?.self),
    ] }

    public var newUser: NewUser? { __data["newUser"] }

    /// NewUser
    ///
    /// Parent Type: `User`
    public struct NewUser: MyUserAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { MyUserAPI.Objects.User }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("name", String.self),
      ] }

      public var name: String { __data["name"] }
    }
  }
}
