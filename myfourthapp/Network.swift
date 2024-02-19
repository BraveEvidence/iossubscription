import Apollo
import Foundation
import ApolloWebSocket

class Network {
  static let shared = Network()

    
    private(set) lazy var apollo: ApolloClient = {
        let client = URLSessionClient()
        let cache = InMemoryNormalizedCache()
        let store = ApolloStore(cache: cache)
        
//        let provider = NetworkInterceptorProvider(client: client, store: store)
        let url = URL(string: "http://localhost:4000/graphql")!
        let transport = RequestChainNetworkTransport(interceptorProvider: DefaultInterceptorProvider(client: client, shouldInvalidateClientOnDeinit: true, store: store), endpointURL: url)

        let webSocket = WebSocket(
            url: URL(string: "ws://localhost:4000/graphql")!,
            protocol: .graphql_ws
        )

        let webSocketTransport = WebSocketTransport(websocket: webSocket)

        let splitTransport = SplitNetworkTransport(
            uploadingNetworkTransport: transport,
            webSocketNetworkTransport: webSocketTransport
        )

        return ApolloClient(networkTransport: splitTransport, store: store)
    }()
}
