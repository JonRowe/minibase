import { gql } from 'apollo-boost';
import React from 'react'
import { compose, graphql } from 'react-apollo';
import ReactTable from 'react-table'

const GetMiniData = gql`
  query {
    minis {
      year
      number
      name
      design { name }
    }
  }
`

class DataSheetWrangler extends React.Component {
  render () {
    if (this.props.data.loading) return <div>Loading...</div>
    if (this.props.data.error) return <div>Error!</div>

    return (
      <ReactTable
        columns={[
          { Header: "Number", accessor: "number" },
          { Header: "Year", accessor: "year" },
          { Header: "Design", accessor: (m => m.design && m.design.name), id: "design" }
        ]}
        data={this.props.data.minis}
        filterable={true}
      />
    )
  }
}

const App = compose(graphql(GetMiniData),)(DataSheetWrangler)

export default App
