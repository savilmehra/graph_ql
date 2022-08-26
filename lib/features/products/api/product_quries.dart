
const productGraphQL = r'''
  query ProductsQl( $nfirst: Int!, $nchannel: String!) {
  products( first: $nfirst, channel: $nchannel) {
    edges {
      node {
        id
        name
        description
        thumbnail{url}
      }
    }
  }
  }
''';


String query = r'''
  query {
    characters(page: 1) {
      results {
        id
        name
        status
      }
    }
  }
''';