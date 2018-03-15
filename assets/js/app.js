import React from 'react'
import { render } from 'react-dom'
import ApolloClient from 'apollo-boost'
import { ApolloProvider } from 'react-apollo'
import App from './components/app'


if (document.getElementById('root')) {
  // Pass your GraphQL endpoint to uri
  const client = new ApolloClient({ uri: '/graphql' })

  render(
    <ApolloProvider client={client}>
      <App />
    </ApolloProvider>
    , document.getElementById('root'));
}
